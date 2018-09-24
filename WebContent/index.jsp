<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>
<body>
<jsp:include page="header.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>
<main>
    <p>Veel succes!</p>
    <c:if test="${errors.size()>0 }">
        <div class="danger">
            <ul>
                <c:forEach var="error" items="${errors }">
                    <li>${error }</li>
                </c:forEach>
            </ul>
        </div>
    </c:if> <c:choose>
    <c:when test="${user!=null}">
        <p>Welcome ${user.getFirstName()}!</p>
        <form method="post" action="Controller?action=LogOut">
            <p>
                <input type="submit" id="logoutbutton" value="Log Out">
            </p>
        </form>
    </c:when>
    <c:otherwise>
        <form method="post" action="Controller?action=LogIn">
            <p>
                <label for="email">Your email </label>
                <input type="text" id="email" name="email" value="jan@ucll.be">
            </p>
            <p>
                <label for="password">Your password</label>
                <input type="password" id="password" name="password" value="t">
            </p>
            <p>
                <input type="submit" id="loginbutton" value="Log in">
            </p>
        </form>
    </c:otherwise>
</c:choose></main>
<div id="firstTopic">
    <h2>1 topic</h2>
    <p>text</p>
    <input id="comment1" type="text"/>
    <button onclick="send(1)">send</button>
    <div>
        <h3>Comments</h3>
        <div id="comments1"></div>
    </div>
</div>
<div id="secondTopic">
    <h2>2 topic</h2>
    <p>text</p>
    <input id="comment2" type="text"/>
    <button onclick="send(2)">send</button>
    <div>
        <h3>Comments</h3>
        <div id="comments2"></div>
    </div>
</div>
<div id="thirdTopic">
    <h2>3 topic</h2>
    <p>text</p>
    <input id="comment3" type="text"/>
    <button onclick="send(3)">send</button>
    <div>
        <h3>Comments</h3>
        <div id="comments3"></div>
    </div>
</div>
<div id="fourthTopic">
    <h2>4 topic</h2>
    <p>text</p>
    <input id="comment4" type="text"/>
    <button onclick="send(4)">send</button>
    <div>
        <h3>Comments</h3>
        <div id="comments4"></div>
    </div>
</div>
<div id="fifthTopic">
    <h2>5 topic</h2>
    <p>text</p>
    <input id="comment5" type="text"/>
    <button onclick="send(5)">send</button>
    <div>
        <h3>Comments</h3>
        <div id="comments5"></div>
    </div>
</div>
<jsp:include page="footer.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>

<script src="js/index.js"></script>
</body>
</html>