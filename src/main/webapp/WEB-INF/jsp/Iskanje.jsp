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
                            <c:if test="${knjiga.navoljo==1}"><td class="tIzpis prijavljen"><a href="vkosarico?id=${knjiga.idKnjiga}">&#9870</a></td></c:if>
                        </tr>

                    </c:forEach>
                </table>

            </div>
        </div>
    </div>
</div>
</div>

</body>
</html>