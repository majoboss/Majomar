<?php 

$web_page = file_get_contents('../Html/Template.html');

$headbar = file_get_contents('../Html/Headbar.html');

$dashboard = file_get_contents('../Html/Dashboard.html');

$web_page = str_replace('<headbar/>', $headbar , $web_page);

$web_page = str_replace('Accedi', 'Esci' , $web_page);

echo str_replace('<contenuto/>', $dashboard , $web_page);



?>