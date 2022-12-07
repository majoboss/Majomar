<?php

include "../Database.php";


$modifica = "UPDATE navi SET nome='".$_POST['Nome']."', stazza=".$_POST['Stazza'].", lunghezza=".$_POST['Lunghezza'].", anno_costruzione=".$_POST['Anno_costruzione'].", potenza_motori=".$_POST['Potenza_motori'].", posti_occupabili=".$_POST['Posti']." WHERE codice_nave=".$_POST['Key']."";


if($connessione->query($modifica))
{

}

header('Location: ../../Navi.php');


?>