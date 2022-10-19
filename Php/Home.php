<?php 

include "./Back/Database.php";

$web_page = file_get_contents('../Html/Template.html');

$headbar = file_get_contents('../Html/Headbar.html');

$home = file_get_contents('../Html/Home.html');

$web_page = str_replace('<headbar/>', $headbar , $web_page);

$cards = '';


$sql_seleziona = "SELECT * FROM viaggio";

if($result = $connessione->query($sql_seleziona))
{
    if($result->num_rows>0){
        while($row=$result->fetch_assoc())
        {
            $data_ora_p_a = json_decode($row["data_ora_p_a"], true);
            $prezzo = $row["prezzo"];

            $cards.='<div class="card">
                <div class="card_section">
                    <p>Partenza</p>
                    <h2>Palermo</h2>
                    <h5>Porto Palermo</h5>
                    <h2>'.$data_ora_p_a["ora_part"].'<span> '.$data_ora_p_a["data_part"].'</span></h2>
                    <a class="card_sec_btn" href="">
                        <img src="../Assets/info_icon.png" alt="">
                        <p>Info viaggio</p>
                    </a>
                    <div class="card_sec_btn sec_time">
                        <img src="../Assets/clock_icon.png" alt="">
                        <p>Durata 17h</p>
                    </div>
                </div>
                <div class="card_section">
                    <p>Arrivo</p>
                    <h2>Genova</h2>
                    <h5>Porto Genova</h5>
                    <h2>'.$data_ora_p_a["ora_arri"].'<span> '.$data_ora_p_a["data_arri"].'</span></h2>
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
    }

}
else
    echo "Impossibile reperire i dati";


$home = str_replace('<cards/>', $cards , $home);


echo str_replace('<contenuto/>', $home , $web_page);;

?>