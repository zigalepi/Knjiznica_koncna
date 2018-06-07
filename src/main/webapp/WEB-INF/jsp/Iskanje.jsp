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
    <script>
        var session = '<%= session.getAttribute("currentSessionUser") %>'
        document.write(session);
    </script>
</head>

<body>
<div id="wrapper">
    <div>
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

    <div class="neprijavljen">
        <div class="nav">
            <ul>
                <li>
                    <a href="index">Domov</a>
                </li>
                <li class="active">
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
                <li class="active">
                    <a href="index">Domov</a>
                </li>
                <li>
                    <a href="iskanje">Iskanje knjig</a>
                </li>
                <li>
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
                <form id="iskanje" name="vnosP" method="post" action="iskanjeMetoda">
                    <div class="container2">

                        <h3 class="reg">Podatki za iskanje knjige</h3>

                    </div>

                        <div class="row">
                            <div class="col-sm-2">
                                <select name="izbira1" id="izbirni_seznam_ena">
                                    <option selected = "selected" value ="naslov">Naslov</option>
                                    <option  value ="avtor">Avtor</option>
                                    <option value="isbn">ISBN</option>
                                    <option value ="zalozba">Založba</option>
                                    <option value="leto">Leto Izdaje</option>
                                    <option value="prevod">Prevod</option>
                                    <option value="ilustracije">Ilustracije</option>
                                    <option value="zanr">Žanr</option>
                                    <option value="publika">Ciljna publika</option>
                                    <option value="lokacija">Lokacija</option>
                                </select>
                            </div>
                        </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <input type="text" name="iskanje1">
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-sm-2">
                         <input type="submit"value="Išči">
                            </div>
                    </div>

                </form>
            </div>

        <div class="col-sm-3"></div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
            <div class="tIzpis" style="width:100%">

                <table class="tIzpis">
                    <tr class="tIzpis">
                        <th class="tIzpis">Naslov</th>
                        <th class="tIzpis">Avtor</th>
                        <th class="tIzpis">Založba</th>
                        <th class="tIzpis">Leto izdaje</th>
                        <th class="tIzpis">Žanr</th>
                        <th class="tIzpis prijavljen">Seznam želja</th>
                        <th class="tIzpis prijavljen">Izposoja</th>
                    </tr>
                    <c:forEach items="${nekaj}" var="knjiga" varStatus="loop">

                        <tr class="tIzpis" id="${knjiga.idKnjiga}">
                            <td class="tIzpis"><a class="tIzpis" href="komentarji?id=${knjiga.idKnjiga}">${knjiga.naslov}</a></td>
                            <td class="tIzpis">${knjiga.avtor}</td>
                            <td class="tIzpis">${knjiga.zalozba}</td>
                            <td class="tIzpis">${knjiga.letoIzdaje}</td>
                            <td class="tIzpis">${knjiga.zanr}</td>
                            <td class="tIzpis prijavljen"><a href="seznamZelja?id=${knjiga.idKnjiga}">&#9770</a></td>
                            <td class="tIzpis prijavljen"><a href="vkosarico?id=${knjiga.idKnjiga}">&#9870</a></td>
                        </tr>

                    </c:forEach>
                </table>

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