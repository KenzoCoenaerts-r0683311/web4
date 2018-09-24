<%--
  Created by IntelliJ IDEA.
  User: Kenzo
  Date: 18/04/2018
  Time: 22:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<jsp:include page="head.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>
<body>
<jsp:include page="header.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>
<main>
    <button id="toggle" onclick="hideFriends()">hide</button>
    <ul id="friends"></ul>
    <div id="chats"></div>
</main>
<jsp:include page="footer.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>
<script src="js/chat.js"></script>
</body>
</html>
