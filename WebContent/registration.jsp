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
    <p>last name: <input id="name" name="name"></p>
    <p>first name: <input id="firstName" name="firstName"></p>
    <p>email: <input id="email" name="email"></p>
    <p>password: <input type="password" id="password" name="password"></p>
    <p>repeat password: <input type="password" id="repeatPassword" name="resetPassword"></p>
    <input type="submit" value="Register">
</form>
</body>
</html>