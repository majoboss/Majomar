<?php

include "../Database.php";


$cancella = "DELETE FROM porto WHERE codice_porto=".$_POST['Key']."";


if($connessione->query($cancella))
{

}

header('Location: ../../Porti.php');


?>