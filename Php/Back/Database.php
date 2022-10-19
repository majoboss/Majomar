<?php 

$host = "127.0.0.1";
$user = "root";
$passw = "";
$db = "navigazione";

$connessione = new mysqli($host,$user,$passw,$db);

if(!$connessione)
{
    die("Errore connessione");
}


?>