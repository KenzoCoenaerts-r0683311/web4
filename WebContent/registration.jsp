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
    <label for="name"><input id="name" name="name"></label>
    <label for="firstName"><input id="firstName" name="firstName"></label>
    <label for="email"><input id="email" name="email"></label>
    <label for="password"><input id="password" name="password"></label>
    <label lang="repeatPassword"><input id="repeatPassword" name="resetPassword"></label>
    <input type="submit" value="Register">
</form>
</body>
</html>
