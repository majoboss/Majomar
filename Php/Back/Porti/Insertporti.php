<?php

include "../Database.php";


$inserisci = "INSERT INTO porto(nome_porto,citta,posti_barca,latitudine,longitudine) VALUES('".$_POST['Nome']."','".$_POST['Citta']."',".$_POST['Posti'].",".$_POST['Latitudine'].",".$_POST['Longitudine'].")";


if($connessione->query($inserisci))
{

}


header('Location: ../../Porti.php');





?>