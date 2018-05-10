let webSocket;

window.onload = function openSocket() {
    webSocket = new WebSocket("ws://localhost:8081/echo");
    webSocket.onmessage = function (event) {
        let msg = JSON.parse(event.data);
        let nr = msg.blognr;
        let text = msg.name + " (" + new Date(msg.date).toLocaleTimeString() + ")" + "<br>" + msg.comment;
        let comments = document.getElementById("comments" + nr);
        comments.innerHTML += "<p  class=\"comment\">" + text + "</p>";
    };
};

function send(nr) {
    let text = document.getElementById("comment" + nr).value;
    alert(text);
    //let msg = {comment: text, blognr: nr, date: Date.now(), name: username};
    webSocket.send(text);
}

window.onunload = function closeSocket() {
    webSocket.close();
};


