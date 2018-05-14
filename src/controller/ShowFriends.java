package controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import domain.Person;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class ShowFriends extends RequestHandler implements AsynchronousRequest {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        HttpSession session = request.getSession();
        Person p = (Person) session.getAttribute("user");

        if (p != null) {
            List<Person> friends = p.getFriendList();
            return mapper.writeValueAsString(friends);
        }

        return "";
    }
}