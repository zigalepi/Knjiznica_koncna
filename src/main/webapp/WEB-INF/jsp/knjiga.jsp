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
                                    <label class="tip">
                                        Mnenje: <input id="idMnenje" name="check"  type="radio" value="mnenje" />
                                    </label>
                                </div>
                                <div class="col-sm-3">
                                    <label class="tip">
                                        Revizija: <input id="idRevizija" name="check"  type="radio" value="revizija"/>
                                    </label>
                                </div>
                                <div class="col-sm-3">
                                    <label class="tip">
                                        Vprašanje: <input id="idVprasanje" name="check"  type="radio"  value="vprasanje"/>
                                    </label>
                                </div>
                                <div class="col-sm-3">
                                    <label class="tip">
                                        Razmislek: <input id="idRazmislek" name="check"  type="radio" value="razmislek" />
                                    </label>
                                </div>

                                   <textarea name="kom" rows="5" cols="94" style = "border: solid 1px black" value="Vnesite željeno besedilo."></textarea>
                                    <br>
                                   <input type="submit" id="komG" value="potrdi">



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

                    <c:forEach items="${komentarji}" var="komentar" varStatus="loop">
                        <div class="komentar">
                            <div class="kIme">
                                <span style="font-weight: bold;font-size:15px;margin-right:15px;color:white">${komentar.upIme}</span> <span style="color:grey;font-size:14px">Tip: ${komentar.tipKomentarja}</>
                            </div>
                               <div class="kVsebina">
                                       ${komentar.vsebina}
                               </div>

                        </div>
                    </c:forEach>

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