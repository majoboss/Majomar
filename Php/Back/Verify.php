<?php

    include "./Back/Database.php";

    $username = $_POST["username"];
    $password = $_POST["password"];

    $getusers = "SELECT username,password FROM utenti WHERE username=" . $username . " && password=".$password;

    if($sucessful = $connessione->query($getusers))
    {
        echo "Logged";
    }
    else
    {
        echo "Not logged";
    }



?>