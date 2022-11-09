<?php 

$web_page = file_get_contents('../Html/Template.html');

$headbar = file_get_contents('../Html/Headbar.html');

$auth = file_get_contents('../Html/Auth.html');

$web_page = str_replace('<headbar/>', $headbar , $web_page);

echo str_replace('<contenuto/>', $auth , $web_page);

?>