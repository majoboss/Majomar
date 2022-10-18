<?php 

$web_page = file_get_contents('../Html/Template.html');

$headbar = file_get_contents('../Html/Headbar.html');

$home = file_get_contents('../Html/Home.html');

$web_page = str_replace('<headbar/>', $headbar , $web_page);
$web_page = str_replace('<contenuto/>', $home , $web_page);

echo $web_page;

?>