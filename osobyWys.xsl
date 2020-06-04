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
        <li class="nav-item" ng-if="jedenClick">
          <a class="nav-link" href="#dodawanie">Dodawanie wykładowców</a>
        </li>
      </ul>

      <form class="form-inline my-2 my-lg-0" name="navForm">
        <div class="btn-group" role="group" aria-label="Basic example">
        <button type="button" class="btn btn-secondary" onClick="setTwo()">1-9 </button>
        <button type="button" class="btn btn-secondary" onClick="setZero()">A-Z</button>
        <button type="button" class="btn btn-secondary" onClick="setOne()">Z-A</button>
        </div>
        <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search" id="search"/>
        <input class="btn btn-outline-success my-2 my-sm-0" type="button" onClick="searchByLastName()" value="Szukaj po nazwisku" />
        <p>:</p>
        <input class="btn btn-outline-success my-2 my-sm-0" type="button" onClick="searchByName()" value="Szukaj po imieniu"/>
        <a class="nav-link" href="#dodawanie"><button type="button" href="#dodawanie" class="btn btn-outline-success my-2 my-sm-0" OnClick="Insert()">Dodaj nowy</button></a>
      </form>
    </div>
  </nav>
  <div class="container" id="mydiv"  bacgrund="black">
  
  </div>
  
  <div class="container" id="dodawanie">
    <form name="form" id="form" action="/meta/xmlProject/php.php" method="GET"> Formularz dodawania <a class="nav-link" href="#">^na górę^</a>
    <div class="form-group">
     <label for="exampleFormControlInput1">ID</label>
    <input type="text" class="form-control" name="id" id="id" readonly="true"/>
    <br/>
    <label for="exampleFormControlInput1">Imie</label>
    <input type="text" class="form-control" name="imie" id="exampleFormControlInput1" placeholder="Sauron"/>
    <br/>
    <label for="exampleFormControlInput1">Nazwisko</label>
    <input type="text" name="nazwisko" class="form-control" id="exampleFormControlInput1" placeholder="Brando"/>
    <br/>
    <label for="exampleFormControlInput1">Email address</label>
    <input type="email" name="mail" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com"/>
    <br/>
    <label for="exampleFormControlSelect1">Tytuł</label>
    <select class="form-control" name="stopien" id="exampleFormControlSelect1">
      <option>inż</option>
      <option>mgr.</option>
      <option>dr</option>
      <option>dr hab.</option>
      <option>prof.</option>
    </select>
    <br/>
    <label for="exampleFormControlTextarea1">Katedra</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" name="katedra" rows="3"></textarea>
    <br/>
    <label for="exampleFormControlTextarea2">Specjalizacja</label>
    <textarea class="form-control" id="exampleFormControlTextarea2" name="specjalizacja" rows="3"></textarea>
    <br/>
    <input type="submit" name="akcja" value="Dodaj wykładowce" disabled="true" />
    <br/>
    
    
  </div>
</form>
  </div>
   <script>
              var sort = 2;
              function searchByLastName(){
              var name= document.getElementById("search").value
              var name2;
              var newDiv = document.createElement("div")
             if(document.getElementById("mydiv").children.length!=0){
                document.getElementById("mydiv").children[0].remove()
              }
              var testhtml= '<ul class="list-group" id="lista"> Lista';
              console.log(sort);
              if(sort==0){
              <xsl:for-each select="osoby/osoba">
              <xsl:sort select="nazwisko"/>
              name2="<xsl:value-of select="nazwisko"/>";
              if(include(name2,name)){
              var data = "<xsl:value-of select="@id" />"+". "+"<xsl:value-of select="stopien" />"+" "+"<xsl:value-of select="imie" />"+" "+"<xsl:value-of select="nazwisko" />"+" "+"<xsl:value-of select="katedra" />"+" "+"<xsl:value-of select="mail"/>";
              var index = "<xsl:value-of select="@id" />"
              testhtml+= '<li class="list-group-item list-group-item-success">'+data+'<a class="nav-link" href="#dodawanie">'+'<button type="button" class="btn btn-outline-danger btn-sm" OnClick="Delete('+index+')">Usuń</button>'+' '+'<button type="button" class="btn btn-outline-warning btn-sm" OnClick="Update('+index+')">Modyfikuj</button>'+'</a>'+'</li>';
              }
              </xsl:for-each>
              }
              if(sort==2){
              <xsl:for-each select="osoby/osoba">
              name2="<xsl:value-of select="nazwisko"/>";
              if(include(name2,name)){
              var data = "<xsl:value-of select="@id" />"+". "+"<xsl:value-of select="stopien" />"+" "+"<xsl:value-of select="imie" />"+" "+"<xsl:value-of select="nazwisko" />"+" "+"<xsl:value-of select="katedra" />"+" "+"<xsl:value-of select="mail"/>";
              var index = "<xsl:value-of select="@id" />"
              testhtml+= '<li class="list-group-item list-group-item-success">'+data+'<a class="nav-link" href="#dodawanie">'+'<button type="button" class="btn btn-outline-danger btn-sm" OnClick="Delete('+index+')">Usuń</button>'+' '+'<button type="button" class="btn btn-outline-warning btn-sm" OnClick="Update('+index+')">Modyfikuj</button>'+'</a>'+'</li>';
              }
              </xsl:for-each>
              }
              if(sort==1){
                 <xsl:for-each select="osoby/osoba">
              <xsl:sort select="nazwisko" order="descending"/>
              name2="<xsl:value-of select="nazwisko"/>";
              if(include(name2,name)){
              var data = "<xsl:value-of select="@id" />"+". "+"<xsl:value-of select="stopien" />"+" "+"<xsl:value-of select="imie" />"+" "+"<xsl:value-of select="nazwisko" />"+" "+"<xsl:value-of select="katedra" />"+" "+"<xsl:value-of select="mail"/>";
              var index = "<xsl:value-of select="@id" />"
              testhtml+= '<li class="list-group-item list-group-item-success">'+data+'<a class="nav-link" href="#dodawanie">'+'<button type="button" class="btn btn-outline-danger btn-sm" OnClick="Delete('+index+')">Usuń</button>'+' '+'<button type="button" class="btn btn-outline-warning btn-sm" OnClick="Update('+index+')">Modyfikuj</button>'+'</a>'+'</li>';
              }
              </xsl:for-each>
              }
              testhtml+=  '</ul>'
              newDiv.innerHTML = testhtml
              document.getElementById("mydiv").appendChild(newDiv);
              }

              function include(a,b){
              if(b.length>a.length ){
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
              if(document.getElementById("mydiv").children.length!=0){
                document.getElementById("mydiv").children[0].remove()
              }
              var testhtml= '<ul class="list-group" id="lista"> Lista';
              if(sort==0){
              <xsl:for-each select="osoby/osoba">
              <xsl:sort select="imie"/>
              name2="<xsl:value-of select="imie"/>";
              if(include(name2,name)){
              var data = "<xsl:value-of select="@id" />"+". "+"<xsl:value-of select="stopien" />"+" "+"<xsl:value-of select="imie" />"+" "+"<xsl:value-of select="nazwisko" />"+" "+"<xsl:value-of select="katedra" />"+" "+"<xsl:value-of select="mail"/>";
              var index = "<xsl:value-of select="@id" />"
              testhtml+= '<li class="list-group-item list-group-item-success">'+data+'<a class="nav-link" href="#dodawanie">'+'<button type="button" class="btn btn-outline-danger btn-sm" OnClick="Delete('+index+')">Usuń</button>'+' '+'<button type="button" class="btn btn-outline-warning btn-sm" OnClick="Update('+index+')">Modyfikuj</button>'+'</a>'+'</li>';
              }
              </xsl:for-each>
              }
              if(sort==2){
              <xsl:for-each select="osoby/osoba">
              name2="<xsl:value-of select="imie"/>";
              if(include(name2,name)){
              var data = "<xsl:value-of select="@id" />"+". "+"<xsl:value-of select="stopien" />"+" "+"<xsl:value-of select="imie" />"+" "+"<xsl:value-of select="nazwisko" />"+" "+"<xsl:value-of select="katedra" />"+" "+"<xsl:value-of select="mail"/>";
              var index = "<xsl:value-of select="@id" />"
              testhtml+= '<li class="list-group-item list-group-item-success">'+data+'<a class="nav-link" href="#dodawanie">'+'<button type="button" class="btn btn-outline-danger btn-sm" OnClick="Delete('+index+')">Usuń</button>'+' '+'<button type="button" class="btn btn-outline-warning btn-sm" OnClick="Update('+index+')">Modyfikuj</button>'+'</a>'+'</li>';
              }
              </xsl:for-each>
              }
              if(sort==1){
                 <xsl:for-each select="osoby/osoba">
             <xsl:sort select="imie" order="descending"/>
              name2="<xsl:value-of select="imie"/>";
              if(include(name2,name)){
              var data = "<xsl:value-of select="@id" />"+". "+"<xsl:value-of select="stopien" />"+" "+"<xsl:value-of select="imie" />"+" "+"<xsl:value-of select="nazwisko" />"+" "+"<xsl:value-of select="katedra" />"+" "+"<xsl:value-of select="mail"/>";
              var index = "<xsl:value-of select="@id" />"
              testhtml+= '<li class="list-group-item list-group-item-success">'+data+'<a class="nav-link" href="#dodawanie">'+'<button type="button" class="btn btn-outline-danger btn-sm" OnClick="Delete('+index+')">Usuń</button>'+' '+'<button type="button" class="btn btn-outline-warning btn-sm" OnClick="Update('+index+')">Modyfikuj</button>'+'</a>'+'</li>';
              }
              </xsl:for-each>
              }
              testhtml+=  '</ul>'
              newDiv.innerHTML = testhtml
              document.getElementById("mydiv").appendChild(newDiv);
              }

              function Update(id){
              <xsl:for-each select="osoby/osoba">
              var index = "<xsl:value-of select="@id"/>"
              var stopien = "<xsl:value-of select="stopien"/>"
              if(index==id){
                document.getElementsByName("form")[0][0].value=id 
                document.getElementsByName("form")[0][0].editible=false 
                document.getElementsByName("form")[0][1].value="<xsl:value-of select="imie"/>"
                document.getElementsByName("form")[0][2].value="<xsl:value-of select="nazwisko"/>"
                document.getElementsByName("form")[0][3].value="<xsl:value-of select="mail"/>"
                switch(stopien){
                  case "inż":
                    document.getElementsByName("form")[0][4].selectedIndex=0
                    break;
                  case "mgr.":
                    document.getElementsByName("form")[0][4].selectedIndex=1
                  case "dr":
                    document.getElementsByName("form")[0][4].selectedIndex=2
                    break;
                  case "dr hab.":
                    document.getElementsByName("form")[0][4].selectedIndex=3
                    break;
                    default:
                    document.getElementsByName("form")[0][4].selectedIndex=4
                }
                
                document.getElementsByName("form")[0][5].value="<xsl:value-of select="katedra"/>" 
                document.getElementsByName("form")[0][6].value="<xsl:value-of select="specjalizacja"/>" 
                document.getElementsByName("form")[0][7].value="Modyfikuj" 
                document.getElementsByName("form")[0][7].disabled = false;
              }
                </xsl:for-each>
             
             }

             function setOne(){
              sort=1
              console.log(sort)
             }
             function setZero(){
              sort=0
              console.log(sort)
             }
             function setTwo(){
              sort=2
              console.log(sort)
             }
             
             
             function Delete(id){
             console.log(document.getElementsByName("form"))
              <xsl:for-each select="osoby/osoba">
              var index = "<xsl:value-of select="@id"/>"
              var stopien = "<xsl:value-of select="stopien"/>"
              if(index==id){
                document.getElementsByName("form")[0][0].value=id 
                document.getElementsByName("form")[0][1].value="<xsl:value-of select="imie"/>"
                document.getElementsByName("form")[0][2].value="<xsl:value-of select="nazwisko"/>"
                document.getElementsByName("form")[0][3].value="<xsl:value-of select="mail"/>"
                switch(stopien){
                  case "inż":
                    document.getElementsByName("form")[0][4].selectedIndex=0
                    break;
                  case "mgr.":
                    document.getElementsByName("form")[0][4].selectedIndex=1
                  case "dr":
                    document.getElementsByName("form")[0][4].selectedIndex=2
                    break;
                  case "dr hab.":
                    document.getElementsByName("form")[0][4].selectedIndex=3
                    break;
                    default:
                    document.getElementsByName("form")[0][4].selectedIndex=4
                }
                
                document.getElementsByName("form")[0][5].value="<xsl:value-of select="katedra"/>" 
                document.getElementsByName("form")[0][6].value="<xsl:value-of select="specjalizacja"/>" 
                
                document.getElementsByName("form")[0][7].value="Usuń" 
              }
                </xsl:for-each>
               document.getElementsByName("form")[0][1].disabled = true;
               document.getElementsByName("form")[0][2].disabled = true;
               document.getElementsByName("form")[0][3].disabled = true;
               document.getElementsByName("form")[0][4].disabled = true;
               document.getElementsByName("form")[0][5].disabled = true;
               document.getElementsByName("form")[0][6].disabled = true;
               document.getElementsByName("form")[0][7].disabled = false;

             }

             function Insert(){
             var index =null
             var te = null
             <xsl:for-each select="osoby/osoba">
             index = "<xsl:value-of select="@id" />"
             te = "<xsl:value-of select="@id" />"
             </xsl:for-each>

             <xsl:for-each select="osoby/osoba">
              te="<xsl:value-of select="@id" />"
              if(te >index){
              index=te
              }
             </xsl:for-each>
             index++
                document.getElementsByName("form")[0][0].value=index 
                document.getElementsByName("form")[0][1].value=""
                document.getElementsByName("form")[0][2].value=""
                document.getElementsByName("form")[0][3].value=""
                document.getElementsByName("form")[0][4].selectedIndex=0
                document.getElementsByName("form")[0][5].value="" 
                document.getElementsByName("form")[0][6].value="" 
                document.getElementsByName("form")[0][7].value="Dodaj wykładowce"
                
               document.getElementsByName("form")[0][1].disabled = false;
               document.getElementsByName("form")[0][2].disabled = false;
               document.getElementsByName("form")[0][3].disabled = false;
               document.getElementsByName("form")[0][4].disabled = false;
               document.getElementsByName("form")[0][5].disabled = false;
               document.getElementsByName("form")[0][6].disabled = false;
               document.getElementsByName("form")[0][7].disabled = false;

             }
             
              </script>
              
              
                </body>
               
                </html>
        </xsl:template>
</xsl:stylesheet>