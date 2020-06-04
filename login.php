<?php
$osoby = simplexml_load_file('login.xml');
$mail=$_GET['mail'];
$haslo=$_GET['haslo'];
foreach($osoby->osoba as $osoba1)
{if ($osoba1->haslo==$haslo && $osoba1->mail==$mail ){
    header("Location: /meta/xmlProject/osoby.xml");
    exit;
}
}
header("Location: /meta/xmlProject/login.html");
exit;
 
?>