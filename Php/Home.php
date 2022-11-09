<?php 

include "./Back/Database.php";

$web_page = file_get_contents('../Html/Template.html');
$headbar = file_get_contents('../Html/Headbar.html');
$home = file_get_contents('../Html/Home.html');

$web_page = str_replace('<headbar/>', $headbar , $web_page);

$cards = '';

$sql_seleziona_porti_partenza = "SELECT * FROM ((viaggio INNER JOIN porto_pa ON viaggio.codice_viaggio=porto_pa.codice_viaggio) INNER JOIN porto ON porto_pa.codice_porto=porto.codice_porto) HAVING tipo='partenza' ORDER BY porto_pa.codice_viaggio";
$sql_seleziona_porti_arrivo = "SELECT * FROM ((viaggio INNER JOIN porto_pa ON viaggio.codice_viaggio=porto_pa.codice_viaggio) INNER JOIN porto ON porto_pa.codice_porto=porto.codice_porto) HAVING tipo='arrivo' ORDER BY porto_pa.codice_viaggio";
$sql_seleziona_tutto = "SELECT * FROM viaggio ORDER BY codice_viaggio";

$result_all = $connessione->query($sql_seleziona_tutto);
$result_porti_p = $connessione->query($sql_seleziona_porti_partenza);
$result_porti_a = $connessione->query($sql_seleziona_porti_arrivo);
$formattatore = new IntlDateFormatter('it_IT',IntlDateFormatter::FULL,IntlDateFormatter::FULL,null,null," dd MMM ");
    
if($result_all && $result_porti_p && $result_porti_a)
{
    if($result_all ->num_rows > 0 && $result_porti_p->num_rows > 0 && $result_porti_a->num_rows > 0){
        while($row=$result_all->fetch_assoc())
        {
            $porti_p=$result_porti_p->fetch_assoc();
            $porti_a=$result_porti_a->fetch_assoc();

            $data_ora_p_a = json_decode($row["data_ora_p_a"], true);
            $prezzo = $row["prezzo"];
            
            $datetime_part = date_create($data_ora_p_a["ora_part"]);
            $datetime_arri = date_create($data_ora_p_a["ora_arri"]);
            $date_part = date_create($data_ora_p_a["data_part"]);
            $date_arr = date_create($data_ora_p_a["data_arri"]);

            $complete_part =  $datetime_part->format("H:i") . " ". $date_part->format("Y/n/d") . " ";
            $complete_arri = $datetime_arri->format("H:i") . " ". $date_arr->format("Y/n/d") . " ";

            $complete_partenza = new DateTime($complete_part);
            $complete_arrivo = new DateTime($complete_arri);

            $durata = date_diff($complete_partenza,$complete_arrivo);

            if($durata->format("%d") > 0)
                $durata = $durata->format("Durata %d g %H h %i m");
            else
                $durata = $durata->format("Durata %H h %i m");
                        
            $time_part = strtotime($data_ora_p_a["data_part"]);
            $time_arr = strtotime($data_ora_p_a["data_arri"]);

            $cards.='<div class="card">
                <div class="card_section">
                    <p>Partenza</p>
                    <h2>'. $porti_p["citta"].'</h2>
                    <h5>'. $porti_p["nome_porto"].'</h5>
                    <h2>'.$data_ora_p_a["ora_part"].'<span> '.$formattatore->format($time_part).'</span></h2>
                    <a class="card_sec_btn" href="">
                        <img src="../Assets/info_icon.png" alt="">
                        <p>Info viaggio</p>
                    </a>
                    <div class="card_sec_btn sec_time">
                        <img src="../Assets/clock_icon.png" alt="">
                        <p>'. $durata .'</p>
                    </div>
                </div>
                <div class="card_section">
                    <p>Arrivo</p>
                    <h2>'. $porti_a["citta"].'</h2>
                    <h5>'. $porti_a["nome_porto"].'</h5>
                    <h2>'.$data_ora_p_a["ora_arri"].'<span> '.$formattatore->format($time_arr).'</span></h2>
                </div>
                <div class="card_section last_sec">
                    <p>Prezzo totale</p>
                    <h2>€ '.$prezzo.'</h2>
                    <div class="posti_card">
                        <img src="../Assets/pearson_icon.png" alt="">
                        <h5>Posti disponibili</h5>
                    </div>
                    <a class="select_button" href="">
                        <h3>Seleziona</h3>
                    </a>
                </div>
            </div>
            ';
        }
    }else
        echo "Errore";
}
else
    echo "Impossibile reperire i dati";

$home = str_replace('<cards/>', $cards , $home);

echo str_replace('<contenuto/>', $home , $web_page);

?>