<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <%@ page contentType="text/html; charset=UTF-8" %>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <title>Moja Knjiznica</title>
    <script src="js/JavaScript.js"></script>
</head>
<body>
<script>
    var session = '<%= session.getAttribute("currentSessionUser") %>'
    document.write(session);
</script>
<div id="wrapper">
    <div class="glava">
        <header style="background-color: cornflowerblue">
            <div class="nav" style="width:100%" >
                <div class="row">
                    <div class="col-sm-2">
                        <img src="slike/logo.jpg" style="height:120px">
                    </div>

                    <div class="col-sm-4">
                        <h1>
                            MOJA KNJIŽNCA!
                        </h1>
                    </div>
                    <div class="col-sm-4"></div>
                </div>
            </div>
        </header>
    </div>

    <div class="prijavljen">
        <div class="nav">
            <ul>
                <li>
                    <a href="index">Domov</a>
                </li>
                <li>
                    <a href="iskanje">Iskanje knjig</a>
                </li>
                <li class="active">
                    <a href="dodajKnj">Dodaj Knjigo</a>
                </li>
                <li>
                    <a href="profil">Profil</a>
                </li>
                <li style="float:right">
                    <a href="logout">Odjava</a>
                </li>
                <li style="float:right">
                    <div class="prijavljen">
                        <p>Pozdravljen, <%= session.getAttribute( "currentSessionUserName" ) %></p>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <br>
    <div class="container" style="width:100%">
        <div class="row" style="width:100%">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <div class="userData">
                        <div class="container2">
                            <h3 class="reg">Knjiga v kosarici</h3>
                        </div>

                    <table class="tIzpis">
                        <tr class="tIzpis">
                            <th class="tIzpis">Naslov</th>
                            <th class="tIzpis">Avtor</th>
                            <th class="tIzpis">Založba</th>
                            <th class="tIzpis">Leto izdaje</th>
                            <th class="tIzpis">Žanr</th>
                        </tr>
                        <c:forEach items="${kosarica}" var="knjiga" varStatus="loop">
                            <tr class="tIzpis">
                                <td class="tIzpis"><a class="tIzpis" href="komentarji?id=${knjiga.idKnjiga}">${knjiga.naslov}</a></td>
                                <td class="tIzpis">${knjiga.avtor}</td>
                                <td class="tIzpis">${knjiga.zalozba}</td>
                                <td class="tIzpis">${knjiga.letoIzdaje}</td>
                                <td class="tIzpis">${knjiga.zanr}</td>
                            </tr>
                        </c:forEach>
                    </table>

                    <a id="submit-reg" href="izposodi">Izposodi si</a>
                </div>
            </div>

            <div class="col-sm-3"></div>
        </div>
    </div>


</div>
<script>
    prijav();
</script>
</body>
</html>