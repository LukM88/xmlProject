<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
        <xsl:template match="/">
                <html>
                <head>
                        <title>Wyszukiwarka</title>
                        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.9/angular.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.7.9/angular-resource.js"></script>
                </head>
                <body>
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark" name="nav">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent" name="navD">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active" ng-click="a = true">
          <a class="nav-link" href="#jeden">Jeden</a>
        </li>
        <li class="nav-item" ng-if="jedenClick">
          <a class="nav-link" href="#">Dwa</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#trzy">Trzy</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#cztery">Cztery</a>
        </li>
      </ul>
      <form class="form-inline my-2 my-lg-0" name="navForm">
        <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search" id="search"/>
        <input class="btn btn-outline-success my-2 my-sm-0" type="button" onClick="searchByLastName()" value="Search by lastname" />
        <p>:</p>
        <input class="btn btn-outline-success my-2 my-sm-0" type="button" onClick="searchByName()" value="Search by name"/>
      </form>
    </div>
  </nav>
  <div id="mydiv" margin-left="50px" bacgrund="black">
  
  </div>
  <div class="container">
    
  </div>
   <script>
              function searchByLastName(){
              var name= document.getElementById("search").value
              var name2;
              var newDiv = document.createElement("div")
              console.log(document.getElementById("mydiv").children);
              if(document.getElementById("mydiv").children.length!=0){
                 console.log("HEJ")
                document.getElementById("mydiv").children[0].remove()
              }
              var testhtml= '<ul class="list-group" id="lista"> Lista';
              <xsl:for-each select="osoby/osoba">
              name2="<xsl:value-of select="nazwisko"/>";
              if(include(name2,name)){
              var data = "<xsl:value-of select="stopien" />"+" "+"<xsl:value-of select="imie" />"+" "+"<xsl:value-of select="nazwisko" />"+" "+"<xsl:value-of select="katedra" />";

              testhtml+= '<li class="list-group-item list-group-item-success">'+data+'    '+'<button type="button" class="btn btn-outline-danger btn-sm" ng-click="vm.remove($index)">Usuń</button>'+'</li>';
              
              }
              </xsl:for-each>
              testhtml+=  '</ul>'
              newDiv.innerHTML = testhtml
              document.getElementById("mydiv").appendChild(newDiv);
              }

              function include(a,b){
              if(b.length>a.length || b.length==0){
                return false;
              }else if(a.indexOf(b)==-1){
                return false
              }else{
                return true;
                }
              }

              function searchByName(){
              var name= document.getElementById("search").value
              var name2;
              var newDiv = document.createElement("div")
              console.log(document.getElementById("mydiv").children);
              if(document.getElementById("mydiv").children.length!=0){
                 console.log("HEJ")
                document.getElementById("mydiv").children[0].remove()
              }
              var testhtml= '<ul class="list-group" id="lista"> Lista';
              <xsl:for-each select="osoby/osoba">
              name2="<xsl:value-of select="imie"/>";
              if(include(name2,name)){
              var data = "<xsl:value-of select="stopien" />"+" "+"<xsl:value-of select="imie" />"+" "+"<xsl:value-of select="nazwisko" />"+" "+"<xsl:value-of select="katedra" />";

              testhtml+= '<li class="list-group-item list-group-item-success">'+data+'    '+'<button type="button" class="btn btn-outline-danger btn-sm" ng-click="vm.remove($index)">Usuń</button>'+'</li>';
              
              }
              </xsl:for-each>
              testhtml+=  '</ul>'
              newDiv.innerHTML = testhtml
              document.getElementById("mydiv").appendChild(newDiv);
              }
              
             
              </script>
                </body>
               
                </html>
        </xsl:template>
</xsl:stylesheet>