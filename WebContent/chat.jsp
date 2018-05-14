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
    <ul id="friends"></ul>
    <div id="chats"></div>
</main>
<jsp:include page="footer.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>
<script>
    $(() => {
        $.ajax({
            type: "GET",
            url: "Controller?action=ShowFriends",
            dataType: "json",
            success: json => {
                $(json).each((index, friend) => {
                    $("#friends")
                        .append($("<li onclick=openchat(" + JSON.stringify(friend.userId) + ")/>")
                            .text("show: " + JSON.stringify(friend.userId)));
                })
            },
            error: () => {
                alert("nope nope nope");
            }
        })
    });

    function openchat(id) {
        $("#chats").append("<div class='chatScreen'>" +
            "<p>" + id + "<p>" +
            "<div id=messages" + id + "></div>" +
            "<input id=message" + id + ">" +
            "<button onclick=sendMessage(" + JSON.stringify(id) + ")></button>" +
            "</div>");

        getMessages(id);
    }

    function sendMessage(id) {
        $.post("Controller?action=SendMessage",
            {
                id: id,
                message: document.getElementById("message" + id).value
            },
            function (data, status) {
                alert("okay")
            });

        getMessages(id)
    }

    function getMessages(id) {
        $.ajax({
            type: "GET",
            url: "Controller?action=GetMessages&id=" + id,
            dataType: "json",

            success: response => {
                response.map((message) => {
                    document.getElementById("messages" + id).append(message + "\n")
                });
            }, error: () => {
                console.log("nope")
            }
        });
    }
</script>
</body>
</html>
