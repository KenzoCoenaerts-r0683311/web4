<%--
  Created by IntelliJ IDEA.
  User: Kenzo
  Date: 30/04/2018
  Time: 23:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<jsp:include page="head.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>
<body>
<jsp:include page="header.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>
<form method="POST" action="Controller?action=Register">
    <label for="naam">naam: <input id="naam" type="text"></label>
    <label for="voornaam">voornaam: <input id="voornaam" type="text"></label>
    <label for="email">email: <input id="email" type="text"></label>
    <label for="geslacht">geslacht: <input id="geslacht" type="text"></label>
    <label for="wachtwoord">wachtwoord: <input id="wachtwoord" type="text"></label>
    <label>herhaal wachtwoord: <input type="text"></label>
</form>
</body>
</html>
