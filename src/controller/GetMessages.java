package controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import domain.Person;
import domain.PersonService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;


public class GetMessages extends RequestHandler implements AsynchronousRequest {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();

        HttpSession session = request.getSession();
        Person p = (Person) session.getAttribute("user");
        String p1 = p.getUserId();

        String p2 = request.getParameter("id");

        PersonService service = super.getPersonService();
        List<String> messages = service.getMessages(p1, p2);
        return mapper.writeValueAsString(messages);
    }
}
