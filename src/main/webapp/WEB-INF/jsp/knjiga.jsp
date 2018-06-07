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

    <div class="nav">
        <ul>
            <li>
                <a href="index">Domov</a>
            </li>
            <li>
                <a href="iskanje">Iskanje knjig</a>
            </li>
            <li class="active">
                <a href="registracija">Registracija</a>
            </li>
            <li>
                <a href="Knjiga.jsp">Podatki knjige</a>
            </li>
            <div id="prijava">
                <li class="active" style="float:right;color:white" >
                    <a href="#" onclick="submitPrijava()">Prijava</a>
                </li>
                <li style="float:right;color:white" >
                    <input type="password" name="pGeslo" placeholder="Geslo">
                </li>
                <li style="float:right;color:white" >
                    <input type="text" name="pUporabnisko" placeholder="Uporabniško ime">
                </li>
            </div>


        </ul>
    </div>

    <br>

    <div class="container" style="width:100%">
        <div class="row" style="width:100%">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <div class="userData">
                    <form action="izpisKom" id="vnosP" name="vnosP" method="get">
                        <div class="container2">

                            <h3 class="reg">Podatki knjige</h3>

                        </div>
                        <div class="container1">
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Avtor: </p>
                                </div>
                                <div class="col-sm-2">
                                    <output type="text" name="rAvtor">
                                        ${avtor}
                                    </output>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Naslov: </p>
                                </div>
                                <div class="col-sm-2">
                                    <output type="text" name="rNaslov">
                                        ${naslov}
                                    </output>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>ISBN: </p>
                                </div>
                                <div class="col-sm-2">
                                    <output type="text" name="rISBN">
                                        ${isbn}
                                    </output>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Založba: </p>
                                </div>
                                <div class="col-sm-2">
                                    <output type="text" name="rZalozba">
                                        ${zalozba}
                                    </output>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Leto izdaje: </p>
                                </div>
                                <div class="col-sm-2">
                                    <output type="text" name="rLetoIzdaje">
                                        ${letoIzdaje}
                                    </output>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Prevod: </p>
                                </div>
                                <div class="col-sm-2">
                                    <output type="text" name="rPrevod">
                                        ${prevod}
                                    </output>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Ilustracije: </p>
                                </div>
                                <div class="col-sm-2">
                                    <output type="text" name="rIlustracije">
                                        ${ilustracije}
                                    </output>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Žanr: </p>
                                </div>
                                <div class="col-sm-2">
                                    <output type="text" name="rZanr">
                                        ${zanr}
                                    </output>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Ciljna publika: </p>
                                </div>
                                <div class="col-sm-2">
                                    <output type="text" name="rCiljnaPublika">
                                        ${publika}
                                    </output>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Prostor: </p>
                                </div>
                                <div class="col-sm-2">
                                    <output type="text" name="rProstor">
                                        ${lokacija}
                                    </output>
                                </div>
                            </div>
                        </div>
                        <div class="prijavljen">
                            <div class="container3">

                                <div class="col-sm-3">
                                    <label>
                                        Mnenje: <input id="idMnenje" name="check"  type="radio" value="mnenje" />
                                    </label>
                                </div>
                                <div class="col-sm-3">
                                    <label>
                                        Revizija: <input id="idRevizija" name="check"  type="radio" value="revizija"/>
                                    </label>
                                </div>
                                <div class="col-sm-3">
                                    <label>
                                        Vprašanje: <input id="idVprasanje" name="check"  type="radio"  value="vprasanje"/>
                                    </label>
                                </div>
                                <div class="col-sm-3">
                                    <label>
                                        Razmislek: <input id="idRazmislek" name="check"  type="radio" value="razmislek" />
                                    </label>
                                </div>

                                    <textarea name="kom" rows="5" cols="94" style = "border: solid 1px black" value="Vnesite željeno besedilo."></textarea>
                                    <br>
                                   <button onclick="izpisKom">
                                      Potrdi
                                   </button>

                            </div>
                        </div>
                    </form>

                </div>
            </div>

            <div class="col-sm-3"></div>
        </div>

    </div>
</div>
<div class="container" style="width:100%">
    <div class="row" style="width:100%">
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
            <div class="userData">
                <div class="container2">

                    <h3 class="reg">Pretekli komentarji</h3>

                </div>
                <div class="container1">

                    <table class="tIzpis">
                        <tr class="tiZpis">
                            <th class="tIzpis">Uporabnik</th>
                            <th class="tIzpis">Vsebina</th>
                            <th class="tIzpis">Tip</th>

                        </tr>
                        <c:forEach items="${komentarji}" var="komentar" varStatus="loop">
                            <tr class="tIzpis" id="a">
                                <td class="tIzpis">${komentar}</td>
                                <td class="tIzpis">${komentar.vsebina}</td>
                                <td class="tIzpis">${komentar.tipKomentarja}</td>

                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="napaka">
    ${napaka}
</div>
<script>
    prijav();
</script>
</body>
</html>