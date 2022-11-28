<?php 

include "./Back/Database.php";

$web_page = file_get_contents('../Html/Template.html');

$headbar = file_get_contents('../Html/Headbar.html');

$navi = file_get_contents('../Html/Navi.html');

$dashboard = file_get_contents('../Html/Dashboard.html');

$web_page = str_replace('<headbar/>', $headbar , $web_page);

$web_page = str_replace('Accedi', 'Esci' , $web_page);

$web_page = str_replace('Accedi', 'Esci' , $web_page);

$web_page = str_replace('<contenuto/>', $dashboard , $web_page);

$web_page = str_replace('list-group-item navi list-group-item-action py-2 ripple', 'list-group-item navi list-group-item-action py-2 ripple active' , $web_page);

$sql_seleziona_navi = "SELECT * FROM  navi";

$data_navi = $connessione->query($sql_seleziona_navi);



$tabella ='';

while($row=$data_navi->fetch_assoc())
{
    $tabella.='
        <tr>
            <td>
            <div class="d-flex align-items-center">
            <i class="fa-solid fa-ship fa-fw me-3"></i>
                <div class="ms-3">
                <p class="fw-bold mb-1">'.$row["nome"].'</p>
                </div>
            </div>
            </td>
            <td>
            <p class="fw-normal mb-1">'.$row["anno_costruzione"].'</p>
            </td>
            <td>
            <span class="badge badge-success rounded-pill d-inline">'.$row["posti_occupabili"].'</span>
            </td>
            <td>'.$row["lunghezza"].'</td>
            <td>'.$row["stazza"].'</td>
            <td>'.$row["potenza_motori"].'</td>
            <td>
            <button type="button" onclick="stampa()" class="btn btn-link btn-sm btn-rounded ">
                Edit
            </button>
            </td>
        </tr>
    ';
}

$navi = str_replace('<righe />', $tabella , $navi);

echo str_replace('<sezione />', $navi , $web_page);


?>