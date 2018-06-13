<%@ page import = "javax.servlet.RequestDispatcher" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Moja Knjiznica</title>
<script src="js/JavaScript.js"></script>
<link href="https://fonts.googleapis.com/css?family=Eater|Permanent+Marker" rel="stylesheet">
<script>
    var session = '<%= session.getAttribute("currentSessionUser") %>'
</script>