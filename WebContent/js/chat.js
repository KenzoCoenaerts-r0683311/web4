let showFriends = true;

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
    $("#chats").append("<div id="+id+" class='chatScreen'>" +
        "<p onclick=closeChat("+ JSON.stringify(id) +")>" + id + "<p>" +
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
            //alert("test")
        });
}

function getMessages(id) {
    $.ajax({
        type: "GET",
        url: "Controller?action=GetMessages&id=" + id,
        dataType: "json",

        success: response => {
            document.getElementById("messages" + id).innerHTML = "";

            response.map((message) => {
                document.getElementById("messages" + id).append(message + "\n\n");
            });

            setTimeout(getMessages(id), 2000)
        }, error: () => {
            console.log("nope")
        }
    });
}

function closeChat(id) {
    document.getElementById(id).remove();
}

function hideFriends(){
    if(showFriends) {
        $('ul#friends').slideUp();
        $('ul#friends > li').click(function () {
            $(this).next('ul').slideToggle();

        });

        $('#toggle').html("show");
        showFriends = false;
    } else {
        $('ul#friends').slideDown();
        $('ul#friends > li').click(function () {
            $(this).next('ul').slideToggle();
        });

        $('#toggle').html("hide");
        showFriends = true;
    }
}