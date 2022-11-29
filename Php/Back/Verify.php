<?php

    include "Database.php";

    $username = $_POST["username"];
    $password = $_POST["password"];
    
    $getusers = "SELECT username,password FROM utenti WHERE username= '" . $username . "' AND password='".$password."'";

    if($sucessful = $connessione->query($getusers))
    {
        if($sucessful->num_rows > 0)
        {
            $_SESSION["user"] = $username;
            $_SESSION["passw"] = $password;
            
            header('Location: ../Php/Home.php');
        }
        else
        {
            header('Location: ../Php/Home.php');
        }
    }
    else
    {
        echo "Error";
    }



?>