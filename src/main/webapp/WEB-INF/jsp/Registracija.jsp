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

    <div class="container" style="width:100%">
        <div class="row" style="width:100%">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <div class="userData">
                    <form action="regBaza" id="vnosP" name="vnosP" method="post">
                        <div class="container2">

                            <h3 class="reg">Podatki uporabnika</h3>

                        </div>
                        <div class="container1">
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Ime</p>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" name="rIme">
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Priimek</p>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" name="rPriimek">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Email</p>

                                </div>
                                <div class="col-sm-4">
                                    <input type="text" name="rEmail">
                                    <div id="emailalert"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Naslov</p>
                                </div>
                                <div class="col-sm-4">
                                    <input type="text" name="rNaslov">
                                    <div id="naslovalert"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Kraj</p>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" name="rKraj">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Poštna številka</p>
                                </div>
                                <div class="col-sm-2">
                                    <input type="text" name="rPostna">
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
                                    <input type="text" name="rUporabnisko">
                                    <div class="${napA}">
                                        ${napaka}
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Geslo</p>
                                </div>
                                <div class="col-sm-4">
                                    <input type="password" name="rGeslo">
                                    <div id="gesloalert"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Ponovi geslo</p>
                                </div>
                                <div class="col-sm-4">
                                    <input type="password" name="rGeslo1">
                                    <div id="geslo1alert"></div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-5"></div>
                            <div class="col-sm-2"><a id="submit-reg" onclick="preveriReg()" href="#">Potrdi</a></div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="col-sm-3"></div>
        </div>
    </div>
</div>


</body>
</html>