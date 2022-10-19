<?php 

$web_page = file_get_contents('../Html/Template.html');

$headbar = file_get_contents('../Html/Headbar.html');

echo str_replace('<headbar/>', $headbar , $web_page);;

?>