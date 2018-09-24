let webSocket;

window.onload = () => {
    webSocket = new WebSocket("ws://localhost:8081/echo");
    webSocket.onmessage = event => {
        let message = JSON.parse(event.data);
        let nr = message.number;
        let text = message.value;
        let comments = document.getElementById("comments" + nr);
        comments.innerHTML += "<p  class=\"comment\">" + text + "</p>";
    };
};

function send(nr) {
    let text = document.getElementById("comment" + nr);
    let message = { number: nr, value : text.value };
    webSocket.send(JSON.stringify(message));
    text.value = "";
}

//window.onunload = () => webSocket.close();
