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



<div class="container">
    <div class="container1">
        <div class="container2">
<h3>${uporabnik.ime} ${uporabnik.priimek}</h3>
<p>Moj profil</p>

        </div>

        <div class="container">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#profil2">Profil</a></li>
                <li><a data-toggle="tab" href="#menu1">Menu 1</a></li>
                <li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
                <li><a data-toggle="tab" href="UrediProfil">Uredi profil</a></li>
            </ul>

            <div class="tab-content">
                <div id="home" class="tab-pane fade in active">
                    <h3>Profil</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                </div>
                <div id="menu1" class="tab-pane fade">
                    <h3>Menu 1</h3>
                    <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>
                <div id="menu2" class="tab-pane fade">
                    <h3>Menu 2</h3>
                    <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
                </div>
            </div>
        </div>

        <!-- ------------------------------------- -->
        <ul class="seznamKnjig">
            <c:forEach items="${uporabnik.izposojeneKnjige}" var="knjiga">
                <li><b>${knjiga.avtor}</b>: ${knjiga.naslov}</li>
            </c:forEach>
        </ul>
    </div>
</div>





</div>

<script>
    prijav();
</script>
</body>
</html>