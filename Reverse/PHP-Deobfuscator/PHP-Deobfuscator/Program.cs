using System;
using System.IO;
using System.Text.RegularExpressions;

class Proj
{
    // Fixes obfuscation pattern of the form ('['^'(').(')'^']')
    public static string RemoveParanthesisPattern(string data)
    {
        string pattern = @"\(('.'\^)+'.'\)"; // ('['^':')

        Regex regex = new Regex(pattern);
        MatchCollection matches = regex.Matches(data);

        int found = 0;
        foreach (Match match in matches)
        {
            // Console.WriteLine(match);
            // Console.WriteLine("----------------------------");

            // Removing the first two characters ('
            string tmp = match.ToString().Remove(0, 1).Remove(0, 1);
            // Removing the last two characters ')
            tmp = tmp.Remove(tmp.Length - 2, 1).Remove(tmp.Length - 2, 1);
            tmp = tmp.Replace("'^'", "\x01");

            int val = 0;
            foreach (var x in tmp.Split('\x01', StringSplitOptions.None))
            {
                val ^= char.Parse(x);
            }

            data = data.Replace(match.ToString(), ((char)val).ToString());
            found += 1;
        }

        Console.WriteLine($"RemoveParanthesisPattern: Total Matches Found: {found}");
        return data;
    }

    // Fixes names of the form s.t.r.s.t.r --> strstr
    public static string FixDottedNames(string data, string pattern = "")
    {
        // XXX: Use this pattern if something breaks
        // string pattern = @"\((([a-z])\.)+[a-z]\)";
        pattern = pattern == "" ? @"\((([a-z0-9_])\.)+[a-z]\)" : pattern;

        Regex regex = new Regex(pattern);
        MatchCollection matches = regex.Matches(data);

        int found = 0;
        foreach (Match match in matches)
        {
            string tmp = match.ToString();
            if (tmp.StartsWith("("))
            {
                tmp = tmp.Remove(tmp.Length - 1, 1).Remove(0, 1);
            }
            tmp = tmp.Replace(".", "");

            data = data.Replace(match.ToString(), tmp);
            found += 1;
        }

        Console.WriteLine($"FixDottedNames: Total Matches Found: {found}");
        return data;
    }

    static void Main(string[] args)
    {
        string filename = "obfuscated.php";
        string fileData = File.ReadAllText(filename);

        fileData = RemoveParanthesisPattern(fileData);
        fileData = FixDottedNames(fileData);

        // Step3
        fileData = fileData.Replace(@"''.abs(strstr('','.'))", "'0'");

        // Step4
        fileData = RemoveParanthesisPattern(fileData);

        fileData = FixDottedNames(fileData);
        fileData = FixDottedNames(fileData, @"(([a-z0-9A-Z_])\.)+[a-z0-9A-Z]");

        fileData = fileData.Replace(".'0'.", "0");

        File.WriteAllText("deobfuscated.php", "<?php\n" + fileData);

    }
}
