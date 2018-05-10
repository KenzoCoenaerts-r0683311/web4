package controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import domain.Person;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class GetStatus extends RequestHandler implements AsynchronousRequest {

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        String state = "offline";
        HttpSession session = request.getSession();
        Person p = (Person) session.getAttribute("user");

        if(p == null) {
            return this.JSON(state);
        } else {
            if (p.getState().equals("offline"))
                state = "online";
            else
                state = p.getState();
        }

        return this.JSON(state);
    }

    private String JSON(String state) {
        ObjectMapper mapper = new ObjectMapper();

        try {
            return mapper.writeValueAsString(state);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return null;
    }
}
