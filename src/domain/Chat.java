package domain;


import java.util.ArrayList;
import java.util.List;

public class Chat {
    private List<List<String>> messages = new ArrayList<>();

    public Chat() {}

    public void addMessage(Person p, String message){
        List<String> u = new ArrayList<>();
        u.add(p.getUserId());
        u.add(message);
        messages.add(u);
    }

    public List<List<String>> getMessages() {
        return this.messages;
    }
}
