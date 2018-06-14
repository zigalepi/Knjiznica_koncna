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



<div class="container">
    <div class="row" style="width:100%">
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
            <div class="userData">
                <div class="container2">
                    <p>Moj profil</p>
                </div>

                <div class="container1">
                    <h3>Podatki</h3>

                    <p>Ime: ${uporabnik.ime}</p>
                    <p>Priimek: ${uporabnik.priimek}</p>
                    <p>Email: ${uporabnik.email}</p>

                </div>

                <div class="container1">
                <h3>Izposojene knjige</h3>
                <ul class="seznamKnjig">
                    <c:forEach items="${uporabnik.izposojeneKnjige}" var="knjiga">
                        <li><b>${knjiga.avtor}</b>: ${knjiga.naslov} <a id="izbrisi" href="vrni?id=${knjiga.idKnjiga}">Vrni Knjigo</a></li>
                    </c:forEach>
                </ul>
                </div>
                <div class="container1">
                <h3>Moje knjige</h3>
                    <ul  class="seznamKnjig">
                    <c:forEach items="${uporabnik.mojeKnjige}" var="knjiga">
                        <li><b>${knjiga.avtor}</b>: ${knjiga.naslov}</li>
                    </c:forEach>
                    </ul>
                </div>

                <div class="container1">
                    <h3>Seznam željenih knjig</h3>
                    <ul  class="seznamKnjig">
                        <table class="tIzpis">
                            <tr class="tiZpis">
                                <th class="tIzpis">Naslov</th>
                                <th class="tIzpis">Avtor</th>
                                <th class="tIzpis">Založba</th>
                                <th class="tIzpis">Leto izdaje</th>
                                <th class="tIzpis">Žanr</th>

                            </tr>
                            <c:forEach items="${nekaj2}" var="knjiga" varStatus="loop">
                                <tr class="tIzpis" id="${knjiga.idKnjiga}">
                                    <td class="tIzpis"><a href="komentarji?id=${knjiga.idKnjiga}">${knjiga.naslov}</a></td>
                                    <td class="tIzpis">${knjiga.avtor}</td>
                                    <td class="tIzpis">${knjiga.zalozba}</td>
                                    <td class="tIzpis">${knjiga.letoIzdaje}</td>
                                    <td class="tIzpis">${knjiga.zanr}</td>

                                </tr>
                            </c:forEach>
                        </table>

                    </ul>
                </div>
            </div>
        </div>

    </div>
</div>





</div>

<script>
    prijav();
</script>
</body>
</html>