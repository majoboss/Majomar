<?php

include "../Database.php";


$modifica = "UPDATE porto SET nome_porto='".$_POST['Nome']."', citta='".$_POST['Citta']."', posti_barca=".$_POST['Posti'].", latitudine=".$_POST['Latitudine'].", longitudine=".$_POST['Longitudine']." WHERE codice_porto=".$_POST['Key']."";


if($connessione->query($modifica))
{

}


header('Location: ../../Porti.php');


?>