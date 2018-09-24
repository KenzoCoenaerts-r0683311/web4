<%--
  Created by IntelliJ IDEA.
  User: kenzo
  Date: 18-6-2018
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="head.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>
<body>
<jsp:include page="header.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>
ploeg 1: <input type="text" id="ploeg1"/>
ploeg 2: <input type="text" id="ploeg2">
score:   <input type="text" id="score"/>
<input type="button" id="addResultaat" value="addResutaat">
<table id="table"></table>
<script>
    const xhr = new XMLHttpRequest();
    const xhr1 = new XMLHttpRequest();

    window.onload = () => {
        asyncMethod(xhr, "GET", "Controller?action=ShowResultaat", getResultaten);
    };

    document.getElementById("addResultaat").onclick = () => {
        /*let json = {"ploeg1": encodeURIComponent(document.getElementById("ploeg1").value),
                    "ploeg2": encodeURIComponent(document.getElementById("ploeg2").value),
                    "score": encodeURIComponent(document.getElementById("score").value)};*/

        let resultaat = encodeURIComponent(document.getElementById("ploeg1").value) + " "
                        + encodeURIComponent(document.getElementById("ploeg2").value) + " "
                        + encodeURIComponent(document.getElementById("score").value);

        asyncMethod(xhr1, "POST", "Controller?action=AddResultaat", null, "resultaat=" + resultaat);
        document.getElementById("friendName").value = "";
    };

    function asyncMethod(request, method, url, callback, params = null) {
        request.open(method, url, true);

        if( callback != null)
            request.onreadystatechange = callback;

        request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        request.send(params);
    }

    function getResultaten() {
        if (xhr.status === 200 && xhr.readyState === 4) {
            let WkResultaten = JSON.parse(xhr.responseText);
            console.log(WkResultaten);

            let table = document.getElementById("table");
            table.innerHTML = "";
            for (let i = 0; i < WkResultaten.length; i++) {
                let tr = document.createElement('tr');
                let tdScore = document.createElement('td');
                let scoreText = document.createTextNode(WkResultaten[i]["score"]);

                tdScore.appendChild(scoreText);
                tr.appendChild(tdScore);
                table.appendChild(tr);
            }

            setTimeout("asyncMethod(xhr, 'GET', 'Controller?action=ShowResultaat', getResultaten)", 1000);
        }
    }
</script>
</body>
</html>
