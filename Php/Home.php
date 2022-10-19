<?php 

$web_page = file_get_contents('../Html/Template.html');

$headbar = file_get_contents('../Html/Headbar.html');

$home = file_get_contents('../Html/Home.html');

$web_page = str_replace('<headbar/>', $headbar , $web_page);

$cards = '';

for($i=0;$i<10;$i++){
    $cards.='<div class="card">
    <div class="card_section">
        <p>Partenza</p>
        <h2>Palermo</h2>
        <h5>Porto Palermo</h5>
        <h2>06:55<span> 19 ott</span></h2>
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
        <h2>23:55<span> 19 ott</span></h2>
    </div>
    <div class="card_section last_sec">
        <p>Prezzo totale</p>
        <h2>€ 39.90</h2>
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

$home = str_replace('<cards/>', $cards , $home);


echo str_replace('<contenuto/>', $home , $web_page);;

?>