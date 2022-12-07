<?php

include "../Database.php";


$inserisci = "INSERT INTO navi(nome,stazza,lunghezza,anno_costruzione,potenza_motori,posti_occupabili) VALUES('".$_POST['Nome']."',".$_POST['Stazza'].",".$_POST['Lunghezza'].",".$_POST['Anno_costruzione'].",".$_POST['Potenza_motori'].",".$_POST['Posti'].")";


if($connessione->query($inserisci))
{

}

header('Location: ../../Navi.php');





?>