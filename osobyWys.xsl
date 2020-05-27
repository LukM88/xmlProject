<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
        <xsl:template match="/">
                <html>
                <head>
                        <title>Wyszukiwarka</title>
                        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
  
                </head>
                <body>
                Wyszukaj wykłądowce!!!
              <br/>
              <script>
              function f(){
              var name= document.wyszukaj.text.value;
              var name2;
              <xsl:for-each select="osoby/osoba">
              name2="<xsl:value-of select="nazwisko"/>";
              if(include(name2,name)){
       
              console.log("<xsl:value-of select="stopien" />"+" "+"<xsl:value-of select="imie" />"+" "+"<xsl:value-of select="nazwisko" />"+" "+"<xsl:value-of select="katedra" />");
             
              }
              </xsl:for-each>
              }
              function include(a,b){
              if(b.length>a.length){
                return false;
              }else if(a.indexOf(b)==-1){
                return false
              }else{
                return true;
                }
              }
              </script>
              <form name="wyszukaj">
              <input type="text" name="text"/>
              <input type="button" class="btn btn-outline-danger btn-sm" padding="5px" name="button" value="Wyszukaj" onClick="f()"/>
              </form>
              <div id="tabela">
              
              </div>
                
                </body>
                </html>
        </xsl:template>
</xsl:stylesheet>