<?php

    session_start();

    include "Database.php";

    $username = $_POST["username"];
    $password = $_POST["password"];
    
    $getusers = "SELECT username,password FROM utenti WHERE username= '" . $username . "' AND password='".$password."'";

    if($sucessful = $connessione->query($getusers))
    {
        if($sucessful->num_rows > 0)
        {
            $_SESSION["Username"] = $username;
            $_SESSION["Password"] = $password;
            header('Location: ../Navi.php');
        }
        else
        {
            echo "<script type='text/javascript'>
                alert('Username o password non corretti!');
                window.location.href='../Auth.php';
            </script>";
        }
    }
    else
    {
        echo "Error";
    }



?>