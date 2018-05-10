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
        <script>
            let xhr = new XMLHttpRequest();
            let xhr2 = new XMLHttpRequest();
            let xhr3 = new XMLHttpRequest();
            let xhr4 = new XMLHttpRequest();

            window.onload = () => {
                asyncMethod(xhr, "GET", "Controller?action=ShowFriends", getData);
                asyncMethod(xhr2, "GET", "Controller?action=GetStatus", getData2);
            };

            document.getElementById("btn").onclick = function() {
                asyncMethod(xhr3, "POST", "Controller?action=ChangeStatus", null, "state=" + encodeURIComponent(document.getElementById("state").value));
                document.getElementById("state").value = "";
            };

            document.getElementById("addFriend").onclick = () => {
                asyncMethod(xhr4, "POST", "Controller?action=AddFriend", null, "name=" + encodeURIComponent(document.getElementById("friendName").value));
                document.getElementById("friendName").value = "";
            };

            function asyncMethod(request, method, url, callback, params = null) {
                request.open(method, url, true);

                if( callback != null)
                    request.onreadystatechange = callback;

                request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                request.send(params);
            }


            function getData() {
                if (xhr.status === 200 && xhr.readyState === 4) {
                    let users = JSON.parse(xhr.responseText);

                    let table = document.getElementById("table");
                    table.innerHTML = "";
                    for (let i = 0; i < users.length; i++) {

                        let tr = document.createElement('tr');
                        let tdUserId = document.createElement('td');
                        let tdUserState = document.createElement('td');

                        let userIdText = document.createTextNode(users[i]["userId"]);
                        let userStateText = document.createTextNode(users[i]["state"]);

                        tdUserId.appendChild(userIdText);
                        tdUserState.appendChild(userStateText);

                        tr.appendChild(tdUserId);
                        tr.appendChild(tdUserState);

                        table.appendChild(tr);
                    }

                    setTimeout("asyncMethod(xhr, 'GET', 'Controller?action=ShowFriends', getData)", 1000);
                }
            }

            function getData2() {
                if (xhr2.status === 200) {
                    if (xhr2.readyState === 4) {

                        let state = JSON.parse(xhr2.responseText);
                        let stateDiv = document.getElementById("status");
                        let statePara = stateDiv.childNodes[0];

                        if (statePara == null) {
                            statePara = document.createElement('p');
                            statePara.id = "stateText";
                            let stateText = document.createTextNode(state);
                            statePara.appendChild(stateText);
                            stateDiv.appendChild(statePara);
                        }
                        else {
                            let stateText = document.createTextNode(state);
                            statePara.removeChild(statePara.childNodes[0]);
                            statePara.appendChild(stateText);
                        }

                        setTimeout("asyncMethod(xhr2, 'GET', 'Controller?action=GetStatus', getData2)", 1000);
                    }
                }
            }
        </script>
    </body>
</html>
