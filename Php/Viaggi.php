<?php 

include "./Back/Database.php";

$web_page = file_get_contents('../Html/Template.html');

$headbar = file_get_contents('../Html/Headbar.html');

$viaggi = file_get_contents('../Html/Viaggi.html');

$dashboard = file_get_contents('../Html/Dashboard.html');

$web_page = str_replace('<headbar/>', $headbar , $web_page);

$web_page = str_replace('Accedi', 'Esci' , $web_page);

$web_page = str_replace('./Auth.php', './Back/Exit.php' , $web_page);

$web_page = str_replace('<contenuto/>', $dashboard , $web_page);

$web_page = str_replace('list-group-item viaggi list-group-item-action py-2 ripple', 'list-group-item viaggi list-group-item-action py-2 ripple active' , $web_page);

$sql_seleziona_porti_partenza = "SELECT * FROM ((viaggio INNER JOIN porto_pa ON viaggio.codice_viaggio=porto_pa.codice_viaggio) INNER JOIN porto ON porto_pa.codice_porto=porto.codice_porto) HAVING tipo='partenza' ORDER BY porto_pa.codice_viaggio";
$sql_seleziona_nave = "SELECT * FROM viaggio INNER JOIN navi ON codice_navi=codice_nave";
$sql_seleziona_porti_arrivo = "SELECT * FROM ((viaggio INNER JOIN porto_pa ON viaggio.codice_viaggio=porto_pa.codice_viaggio) INNER JOIN porto ON porto_pa.codice_porto=porto.codice_porto) HAVING tipo='arrivo' ORDER BY porto_pa.codice_viaggio";
$sql_seleziona_tutto = "SELECT * FROM viaggio ORDER BY codice_viaggio";

$data_viaggi = $connessione->query($sql_seleziona_tutto);
$data_porto_p = $connessione->query($sql_seleziona_porti_partenza);
$data_porto_a = $connessione->query($sql_seleziona_porti_arrivo);
$data_nave = $connessione->query($sql_seleziona_nave);
$formattatore = new IntlDateFormatter('it_IT',IntlDateFormatter::FULL,IntlDateFormatter::FULL,null,null," dd MMM ");



$tabella ='';

while($row=$data_viaggi->fetch_assoc())
{

    $porto_p=$data_porto_p->fetch_assoc();
    $porto_a=$data_porto_a->fetch_assoc();
    $nave=$data_nave->fetch_assoc();


    $data_ora_p_a = json_decode($row["data_ora_p_a"], true);
    
    $datetime_part = date_create($data_ora_p_a["ora_part"]);
    $datetime_arri = date_create($data_ora_p_a["ora_arri"]);
    $date_part = date_create($data_ora_p_a["data_part"]);
    $date_arr = date_create($data_ora_p_a["data_arri"]);

    $complete_part =  $datetime_part->format("H:i") . " ". $date_part->format("Y/n/d") . " ";
    $complete_arri = $datetime_arri->format("H:i") . " ". $date_arr->format("Y/n/d") . " ";

    $time_part = strtotime($data_ora_p_a["data_part"]);
    $time_arr = strtotime($data_ora_p_a["data_arri"]);


    $tabella.='
        <tr>
            <td>
            <div class="d-flex align-items-center">
            <i class="fa-solid fa-ship fa-fw me-3"></i>
            <div class="ms-3">
                <p class="fw-bold mb-1">'.$porto_p["nome_porto"].'</p>
                <p class="fw-bold mb-1">'.$formattatore->format($time_part).' / '.$data_ora_p_a["ora_part"].'</p>
             </div>
            </div>
            </td>
            <td>
                <p class="fw-bold mb-1">'.$porto_a["nome_porto"].'</p>
                <p class="fw-bold mb-1">'.$formattatore->format($time_arr).' / '.$data_ora_p_a["ora_arri"].'</p>
            </td>
            <td>
            <span class="badge badge-success rounded-pill d-inline">'.$row["prezzo"].' €</span>
            </td>
            <td>'.$row["peso_carico"].'</td>
            <td><p class="fw-bold mb-1">'.$nave["nome"].'</p></td>
            <td>
                <button type="button" onclick="mod()" class="btn btn-link btn-sm btn-rounded ">
                    <i class="fa-solid fa-pencil"></i>
                </button>
                <button type="button" onclick="delet()" class="btn btn-link btn-sm btn-rounded ">
                    <i class="fa-solid fa-trash"></i>
                </button>
            </td>
        </tr>
    ';
}

$viaggi = str_replace('<righe />', $tabella , $viaggi);

echo str_replace('<sezione />', $viaggi , $web_page);


?>