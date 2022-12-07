<?php

include "../Database.php";


$modifica = "UPDATE porto SET nome_porto='".$_POST['nome']."', citta='".$_POST['citta']."', posti_barca=".$_POST['posti'].", latitudine=".$_POST['latitudine'].", longitudine=".$_POST['longitudine']." WHERE codice_porto=".$_POST['Key']."";


if($connessione->query($modifica))
{

}
else echo "Erroe: " . $connessione->error;

//header('Location: ../../Porti.php');


?>