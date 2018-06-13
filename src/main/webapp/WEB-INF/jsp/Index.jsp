<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="Links.jsp"%>
</head>
<body  onload="prijav()">
<div id="wrapper">
    <%@include file="Menu.jsp"%>

    <br>
    <div class="telo">
        <div class="police">
            <div class="row">
            <div class="slikadomov">
                <a href="iskanjeMetoda?izbira1=zanr&iskanje1=grozljivke"><img src="slike/police_domaca/polica1.jpg" class="slika_police"></a>
                <a href="iskanjeMetoda?izbira1=zanr&iskanje1=kriminalke"> <img src="slike/police_domaca/polica2.jpg" class="slika_police"></a>
                <a href="iskanjeMetoda?izbira1=zanr&iskanje1=romantika"> <img src="slike/police_domaca/polica3.jpg" class="slika_police"></a>
            </div>
            <div class="slikadomov">
                <a href="iskanjeMetoda?izbira1=zanr&iskanje1=biografije in autobiografije"> <img src="slike/police_domaca/polica4.jpg" class="slika_police"></a>
                <a href="iskanjeMetoda?izbira1=zanr&iskanje1=fantazija"> <img src="slike/police_domaca/polica5.jpg" class="slika_police"></a>
                <a href="iskanjeMetoda?izbira1=zanr&iskanje1=otroške knjige"><img src="slike/police_domaca/polica6.jpg" class="slika_police"></a>
            </div>
            <div class="slikadomov">
                <a href="iskanjeMetoda?izbira1=zanr&iskanje1=znanstvena fantastika" > <img src="slike/police_domaca/polica7.jpg" class="slika_police"></a>
                <a href="iskanjeMetoda?izbira1=zanr&iskanje1=pustolovski romani" ><img src="slike/police_domaca/polica8.jpg" class="slika_police"></a>
                <a href="iskanjeMetoda?izbira1=zanr&iskanje1=erotika" > <img src="slike/police_domaca/polica9.jpg" class="slika_police"></a>
            </div>
            </div>
        </div>
    </div>


</div>


</body>
</html>