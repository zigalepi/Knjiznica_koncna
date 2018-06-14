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
                        <div class="container2">
                            <h3 class="reg">Knjiga v kosarici</h3>
                        </div>

                    <table class="tIzpis">
                        <tr class="tIzpis">
                            <th class="tIzpis">Naslov</th>
                            <th class="tIzpis">Avtor</th>

                        </tr>
                        <c:forEach items="${kosarica}" var="knjiga" varStatus="loop">
                            <tr class="tIzpis">
                                <td class="tIzpis"><a class="tIzpis" href="komentarji?id=${knjiga.idKnjiga}">${knjiga.naslov}</a></td>
                                <td class="tIzpis">${knjiga.avtor}</td>
                                <td class="tIzpis "><a href="izbrisiKos?id=${knjiga.idKnjiga}">&#10060</a></td>
                            </tr>
                        </c:forEach>
                    </table>

                    <a id="submit-reg" href="izposodi">Izposodi si</a>
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