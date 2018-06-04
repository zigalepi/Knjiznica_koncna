<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <%@ page contentType="text/html; charset=UTF-8" %>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/JavaScript.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <title>Moja Knjiznica</title>

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
                            MOJA KNJIŽNCA!
                        </h1>
                    </div>
                    <div class="col-sm-4"></div>
                </div>
            </div>
        </header>
    </div>

    <div class="prijavljenn">
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
                <li  class="active">
                    <a href="profil">Profil</a>
                </li>
                <li style="float:right">
                    <div class="prijavljen">
                        <p>Pozdravljen, <%= session.getAttribute( "currentSessionUserName" ) %></p>
                    </div>
                </li>
                <li>

                    <a href="logout">Odjava</a>

                </li>


            </ul>
        </div>
    </div>

    <br>

    <div style="color: red">
        <c:forEach items="${napake}" var="napaka">
            <b>${napaka}</b><br />
        </c:forEach>
    </div>

    <div class="container" style="width:100%">
        <div class="row" style="width:100%">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <div class="userData">
                    <form action="UrediProfil" id="vnosP" name="vnosP" method="post">
                        <div class="container2">

                            <h3 class="reg">Podatki uporabnika</h3>

                        </div>
                        <div class="container1">
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Ime</p>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" name="rIme" id="rIme" value="${uporabnik.ime}">
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Priimek</p>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" name="rPriimek" id="rPriimek" value="${uporabnik.priimek}">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Email</p>

                                </div>
                                <div class="col-sm-4">
                                    <input type="text" name="rEmail" id="rEmail" value="${uporabnik.email}">
                                    <div id="emailalert"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Naslov</p>
                                </div>
                                <div class="col-sm-4">
                                    <input type="text" name="rNaslov" id="rNaslov" value="${uporabnik.naslov.ulica} ${uporabnik.naslov.hisnaSt}">
                                    <div id="naslovalert"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Kraj</p>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" name="rKraj" id="rKraj" value="${uporabnik.naslov.kraj.naziv}">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Poštna številka</p>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" name="rPostna" id="rPostna" value="${uporabnik.naslov.kraj.postnaSt}">
                                </div>
                            </div>

                        </div>

                        <div class="container2">

                            <h3 class="reg">Uporabniško ime in geslo</h3>

                        </div>

                        <div class="container1">

                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Uporabniško ime</p>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" name="rUporabnisko" id="rUporabnisko" value="${uporabnik.upIme}">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Novo geslo</p>
                                </div>
                                <div class="col-sm-4">
                                    <input type="password" name="rGeslo" id="rGeslo">
                                    <div id="gesloalert"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Ponovi geslo</p>
                                </div>
                                <div class="col-sm-4">
                                    <input type="password" name="rGeslo1" id="rGeslo1">
                                    <div id="geslo1alert"></div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-2"><a id="submit-reg" onclick="preveriReg2(false)" href="#">Spremeni</a></div>
                            <div class="col-sm-5"><a id="reset-uredi-profil" href="#">Zbriši vse podatke</a></div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="col-sm-3"></div>
        </div>
    </div>
</div>
<div class="napaka">
    ${napaka}
</div>
</body>
</html>