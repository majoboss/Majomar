<?php 

$web_page = file_get_contents('../Html/Template.html');

$headbar = file_get_contents('../Html/Headbar.html');

$navi = file_get_contents('../Html/Navi.html');

$dashboard = file_get_contents('../Html/Dashboard.html');

$web_page = str_replace('<headbar/>', $headbar , $web_page);

$web_page = str_replace('Accedi', 'Esci' , $web_page);

$web_page = str_replace('Accedi', 'Esci' , $web_page);

$web_page = str_replace('<contenuto/>', $dashboard , $web_page);

$web_page = str_replace('list-group-item navi list-group-item-action py-2 ripple', 'list-group-item navi list-group-item-action py-2 ripple active' , $web_page);

echo str_replace('<sezione />', $navi , $web_page);


?>