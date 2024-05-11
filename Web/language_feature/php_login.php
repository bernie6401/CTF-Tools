<?php
    // BSides Ahmedabad CTF 2021: entrance

    include 'flag.php';
    $users = array(
        "admin" => "ed2b7b57b3b5be3e8d4246c69e4b513608ffb352",
        "guest" => "35675e68f4b5af7b995d9205ad0fc43842f16450"
    );

    function lookup($username)
    {
        global $users;
        return array_key_exists($username, $users) ? $users[$username] : "";
    }

    if (!empty($_POST['username']) && !empty($_POST['password']))
    {
        $sha1pass = lookup($_POST['username']);
        if ($sha1pass == sha1($_POST['password']))
        {
            if ($_POST['username'] !== 'guest') echo $FLAG;
            else echo 'Welcome guest!';
        }
        else { echo 'Login Failed!';}
    }
    else { echo "You can login with guest:guest";}

    echo "<br>\n";
    highlight_file(__file__);
?>
