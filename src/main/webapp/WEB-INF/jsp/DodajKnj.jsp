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
                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Uvozi XML</p>
                                </div>
                                <div class="col-sm-2">
                                    <a href="UvoziXml">Tukaj!</a>
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

</body>
</html>