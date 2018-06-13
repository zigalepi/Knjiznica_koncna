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


                    <form name="vnosP" action="dodajKnj" method="post">


                        <div class="container2">

                            <h3 class="reg">Podatki o knjigi</h3>

                        </div>
                        <div class="container1">

                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Naslov</p>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" name="kNaslov">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Ime</p>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" name="kAvtorIme">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Priimek</p>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" name="kAvtorPriimek">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-2">
                                    <p>ISBN</p>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" name="kISBN">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Založba</p>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" name="kZalozba">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Leto izdaje</p>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" name="kLetoIzdaje">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Prevod</p>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" name="kPrevod">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Ilustracije</p>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" name="kIlustracije">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Žanr knjige</p>
                                </div>
                                <div class="col-sm-2">
                                    <select name="kZanr">
                                        <option value="fantazija">Fantazija</option>
                                        <option value="znanstvena fantastika">Znanstvena fantastika</option>
                                        <option value="kriminalke">Kriminalke</option>
                                        <option value="grozljivke">Grozljivke</option>
                                        <option value="romantika">Romantika</option>
                                        <option value="pustolovski romani">Pustolovski romani</option>
                                        <option value="biografije in autobiografije">Biografije in autobiografije</option>
                                        <option value="otroške knjige">Otroške knjige</option>
                                        <option value="erotika">Erotika</option>

                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Ciljna publika</p>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" name="kCiljnaPublika">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Lokacija</p>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" name="kLokacija">
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-sm-5"></div>
                            <div class="col-sm-2"><input id="submit-reg" type="submit" value="Potrdi"></div>
                        </div>
                    </form>
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