<?php
$osoby = simplexml_load_file('osoby.xml');
$id=$_GET['id'];
if($_GET['akcja']=="Modyfikuj"){
foreach($osoby->osoba as $osoba1)
{if ($osoba1['id']==$id ){
            $osoba1->stopien = $_GET['stopien'];
            $osoba1->imie = $_GET['imie'];
            $osoba1->nazwisko = $_GET['nazwisko'];
            $osoba1->katedra = $_GET['katedra'];
            $osoba1->mail = $_GET['mail'];
            $osoba1->specjalizacja = $_GET["specjalizacja"];
    file_put_contents('osoby.xml', $osoby->asXML());
    //header('location: lista.php?id='.$nr);
}
}
}elseif($_GET['akcja']=="Usuń"){
    $doc = new DOMDocument; 
    $doc->load('osoby.xml');
    $thedocument = $doc->documentElement;
    
    $list = $thedocument->getElementsByTagName('osoba');
  
    $nodeToRemove = null;
    foreach ($list as $domElement){
      $attrValue = $domElement->getAttribute('id');
      if ($attrValue == $_GET['id']) {
        $nodeToRemove = $domElement;
      }
    }

$thedocument->removeChild($nodeToRemove);


file_put_contents('osoby.xml', $doc->saveXML());
}
else
{
    
    $nowa=$osoby->addChild('osoba');
    $nowa->addAttribute('id', $_GET['id']);
    $nowa->addChild('stopien',$_GET['stopien']);
    $nowa->addChild('imie',$_GET['imie']);
    $nowa->addChild('nazwisko',$_GET['nazwisko']);
    $nowa->addChild('katedra',$_GET['katedra']);
    $nowa->addChild('mail',$_GET['mail']);
    $nowa->addChild('specjalizacja',$_GET['specjalizacja']);
    file_put_contents('osoby.xml', $osoby->asXML());


 }
 header("Location: /meta/xmlProject/osoby.xml");
 exit;
?>