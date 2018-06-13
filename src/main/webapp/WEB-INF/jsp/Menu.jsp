<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="glava">
    <header style="background-color: cornflowerblue">
        <div class="nav" style="width:100%" >
            <div class="row">
                <div class="col-sm-3">
                    <img src="slike/logo.png" style="height:120px">
                </div>
                <div class="col-sm-6">
                    <h1 class="glavaNapis">
                        MOJA KNJIŽNICA!
                    </h1>
                </div>

                <div class="col-sm-3">
                    <img src="slike/logo.png" style="height:120px; float:right">
                </div>
            </div>
        </div>
    </header>
</div>
<div class="neprijavljen">
    <div class="nav">
        <ul>
            <li class="<c:if test="${izbira==1}">active</c:if>">
                <a href="index">Domov</a>
            </li>
            <li class="<c:if test="${izbira==2}">active</c:if>">
                <a href="iskanje">Iskanje knjig</a>
            </li>
            <li class="<c:if test="${izbira==3}">active</c:if>">
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
            <li>
                <a href="kosarica">Košarica</a>
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