<?php

include "../Database.php";


$cancella = "DELETE FROM navi WHERE codice_nave=".$_POST['Key']."";


if($connessione->query($cancella))
{

}

header('Location: ../../Navi.php');


?>