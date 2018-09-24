<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Status</title>
        <link rel="stylesheet" type="text/css" href="css/sample.css">
    </head>
    <body>
        <jsp:include page="header.jsp">
            <jsp:param name="title" value="Home"/>
        </jsp:include>
        <main>
            <div id="status"></div>
            <p>
                <label for="state">Change Status</label>
                <input type="text" id="state"/>
                <input type="button" id="btn" value="change status">
            </p>
            <p>
                <label for="friendName">Add Friend</label>
                <input type="text" id="friendName"/>
                <input type="button" id="addFriend" value="add friend">
            </p>
            <table id="table"></table>
        </main>

        <script src="js/status.js"></script>
    </body>
</html>
