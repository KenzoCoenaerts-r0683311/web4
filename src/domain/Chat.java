package domain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Chat {
    private Map<String, List<String>> DB = new HashMap<>();

    public Chat() {
    }

    public void addMessage(String p1, String p2, String message) {
        if (DB.containsKey(p1 + p2)) {
            DB.put(p1 + p2, this.getMessages(p1, p2));
            this.getMessages(p1, p2).add(p1 + ": " + message);
        } else if (DB.containsKey(p2 + p1)) {
            DB.put(p2 + p1, this.getMessages(p1, p2));
            this.getMessages(p1, p2).add(p1 + ": " + message);
        } else {
            List<String> messages = new ArrayList<>();
            messages.add(p1 + ": " + message);
            DB.put(p1 + p2, messages);
        }
    }

    public List<String> getMessages(String p1, String p2) {
        if (DB.containsKey(p1 + p2)) {
            return DB.get(p1 + p2);
        } else if (DB.containsKey(p2 + p1)) {
            return DB.get(p2 + p1);
        }

        return new ArrayList<>();
    }
}
