<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page import = "javax.servlet.RequestDispatcher" %>
    <%@ page contentType="text/html; charset=UTF-8" %>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <title>Moja Knjiznica</title>
    <script src="js/JavaScript.js"></script>
    <script>
        var session = '<%= session.getAttribute("currentSessionUser") %>'

    </script>
</head>
<body>
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
                            MOJA KNJIŽNICA!
                        </h1>
                    </div>
                    <div class="col-sm-4"></div>
                </div>
            </div>
        </header>
    </div>
    <div class="neprijavljen">
        <div class="nav">
            <ul>
                <li class="active">
                    <a href="index">Domov</a>
                </li>
                <li>
                    <a href="iskanje">Iskanje knjig</a>
                </li>
                <li>
                    <a href="registracija">Registracija</a>
                </li>
                <div id="prijava">
                    <form method="post" action="login" id="loginform" >
                        <li class="active" style="float:right;color:white" >
                            <a href="#" onclick="submitPrijava()">Prijava</a>
                        </li>
                        <li style="float:right;color:white" >
                            <input type="password" name="pGeslo" placeholder="Geslo">
                        </li>
                        <li style="float:right;color:white" >
                            <input type="text" name="pUporabnisko" placeholder="Uporabniško ime">
                        </li>
                    </form>
                </div>


            </ul>
        </div>
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
                <li>
                    <a href="dodajKnj">Dodaj Knjigo</a>
                </li>
                <li class="active">
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



<div class="container">
    <div class="row" style="width:100%">
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
            <div class="userData">
                <div class="container2">
                    <h3>${uporabnik.ime} ${uporabnik.priimek}</h3>
                    <p>Moj profil</p>

                </div>

                <nav class="navbar navbar-inverse">
                    <ul class="nav navbar-nav">
                        <li><a href="profil">Moj profil</a></li>
                        <li><a href="UrediProfil">Uredi profil</a></li>
                    </ul>
                    <p class="navbar-text">Ti pa si pravi knjižni molj!</p>
                </nav>
                <!-- ------------------------------------- -->
                <div class="container1">
                <h3>Izposojene knjige</h3>
                <ul class="seznamKnjig">
                    <c:forEach items="${uporabnik.izposojeneKnjige}" var="knjiga">
                        <li><b>${knjiga.avtor}</b>: ${knjiga.naslov}</li>
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