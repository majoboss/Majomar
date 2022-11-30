<?php 

include "./Back/Database.php";


$web_page = file_get_contents('../Html/Template.html');

$headbar = file_get_contents('../Html/Headbar.html');

$porti = file_get_contents('../Html/Porti.html');

$dashboard = file_get_contents('../Html/Dashboard.html');

$web_page = str_replace('<headbar/>', $headbar , $web_page);

$web_page = str_replace('Accedi', 'Esci' , $web_page);

$web_page = str_replace('Accedi', 'Esci' , $web_page);

$web_page = str_replace('<contenuto/>', $dashboard , $web_page);

$web_page = str_replace('list-group-item porti list-group-item-action py-2 ripple', 'list-group-item porti list-group-item-action py-2 ripple active' , $web_page);

$sql_seleziona_porti = "SELECT * FROM  porto";

$data_porti = $connessione->query($sql_seleziona_porti);


$tabella ='';
while($row=$data_porti->fetch_assoc())
{
    $tabella.='
        <tr>
            <td>
                <div class="d-flex align-items-center">
                <i class="fa-solid fa-anchor fa-fw me-3"></i>
                    <div class="ms-3">
                    <p class="fw-bold mb-1">'.$row["nome_porto"].'</p>
                    </div>
                </div>
                </td>
                <td>
                <p class="fw-normal mb-1">'.$row["citta"].'</p>
                </td>
                <td>
                <span class="badge badge-success rounded-pill d-inline">'.$row["posti_barca"].'</span>
                </td>
                <td>'.$row["latitudine"].'</td>
                <td>'.$row["longitudine"].'</td>
                <td>
                <button type="button" onclick="mod(\''.$row["nome_porto"].'\', \''.$row["citta"].'\', '.$row["posti_barca"].', '.$row["latitudine"].', '.$row["longitudine"].' )" class="btn btn-link btn-sm btn-rounded ">
                    Edit
                </button>
            </td>
        </tr>
    ';
}

$porti = str_replace('<righe />', $tabella , $porti);

echo str_replace('<sezione />', $porti , $web_page);


?>