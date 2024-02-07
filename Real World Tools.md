# Real World Tools
## Recon
* [Google Hacking](https://www.exploit-db.com/google-hacking-database)
    :::spoiler Description
    | Syntax | Description | Example |
    | ------ | ----------- | ------- |
    |+|連接多個關鍵字|--|
    |-|忽略關鍵字|--|
    |..|範圍|--|
    |\*|萬用字元|--|
    |''|精準查詢，一定要符合關鍵字|index of|
    |intext|搜尋網頁內容，列出符合關鍵字的網頁|intext:SECRET_KEY|
    |intitle|搜尋網頁中的標題|intitle:index of|
    |define|搜尋關鍵字的定義|define:hacker|
    |filetype|搜尋指定類型的文件|filetype:pdf|
    |info|搜尋指定網站的基本資訊|info:www.fcu.edu.tw|
    |related|搜尋類似於指定網站的其他網站|related:www.fcu.edu.tw|
    |inurl|尋找指定的字串是否在網址列當中|inurl:www.fcu.edu.tw|
    | site   | 搜尋指定網址的內容|site:www.fcu.edu.tw|
    :::


* [Shodan](https://www.shodan.io/dashboard)
    :::spoiler Description
    ![](https://hackmd.io/_uploads/Hym-h3oH2.png)
    :::

## Dictionary Brute Force
* [John The Ripper](https://www.openwall.com/john/)
    ```bash
    # NTLM
    $ ./run/john.exe {pwn file} --wordlist={dictionary path} --format={NT...}
    
    # JWT
    $ john jwt.txt --wordlist={e.g. /usr/share/wordlists/rockyou.txt} --format={jwt alg, e.g. HMAC-SHA256}
    ```
* [Rockyou.txt](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwiyotmP3uD_AhVB72EKHd3QCHMQFnoECBQQAQ&url=https%3A%2F%2Fgithub.com%2Fbrannondorsey%2Fnaive-hashcat%2Freleases%2Fdownload%2Fdata%2Frockyou.txt&usg=AOvVaw3snAERl1mU6Ccr4WFEazBd&opi=89978449)
* [Online Tool 1](https://www.cmd5.com/)
* [Online Tool 2](https://hashes.com/en/decrypt/hash)
* [hashcat](https://home.gamer.com.tw/creationDetail.php?sn=3669363):
    ```bash
    # NTLM
    $ hashcat -a 0 -m 1000 {ntlm.hash} {rockyou.txt} --force
    
    # JWT
    $ hashcat -a 3 -m 16500 {jwt.txt} {secrets format, e.g. ?a?a?a?a}
    ```
## Escalation
* For Windows: [Mimikatz](https://github.com/ParrotSec/mimikatz)

## Overall
* [Mitre ATT&CK](https://attack.mitre.org/)
* 如果要查常用指令怎麼下，可以找tldr

## Inspect
* [Virus Total](https://www.virustotal.com/gui/home/upload)
* [Alien Vault](https://otx.alienvault.com)
* [IBM X-Force](https://exchange.xforce.ibmcloud.com)
* [Any.Run](https://app.any.run/): Online Sandbox
## OSINT
* [sherlock](https://github.com/sherlock-project/sherlock)
    ```bash
    $ git clone https://github.com/sherlock-project/sherlock.git
    $ cd sherlock
    $ conda create --name sherlock python=3.10 -y
    $ pip install -r requirements.txt
    $ python sherlock/sherlock.py {username}
    ```
* [Image Search](https://images.google.com/)
* [Google Map](https://www.google.com/maps)
* [OSINT Framework](https://osintframework.com/)
    * [Phone](https://www.truecaller.com)
    * [Whois](https://www.whois.com/whois) or [ipwhoisinfo](https://ipwhoisinfo.com/)
    * [Whatsmyname - online tool](https://whatsmyname.app/)