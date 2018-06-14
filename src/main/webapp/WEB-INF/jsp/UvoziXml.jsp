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


                    <form name="vnosP" action="UvoziXmlPost" method="post">


                        <div class="container2">

                            <h3 class="reg">Podatki o knjigi</h3>

                        </div>
                        <div class="container1">

                            <div class="row">
                                <div class="col-sm-2">
                                    <p>Uvozi XML</p>
                                </div>
                                <div class="col-sm-2">
                                   <textarea rows="30" cols="50" name="xml">
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
                                       <knjiga>

 <avtor></avtor>

<idKnjiga></idKnjiga>

<ilustracije></ilustracije>

<isbn></isbn>

<letoIzdaje></letoIzdaje>

<lokacija></lokacija>

<naslov></naslov>

<navoljo></navoljo>

<prevod></prevod>

<zalozba></zalozba>

</knjiga>
                                    </textarea>
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
