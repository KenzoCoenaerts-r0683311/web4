package controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import domain.Person;
import domain.PersonService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SendMessage extends RequestHandler implements AsynchronousRequest {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
        String message = request.getParameter("message");
        HttpSession session = request.getSession();
        Person p = (Person) session.getAttribute("user");
        String p1 = p.getUserId();
        String p2 = request.getParameter("id");
        PersonService service = super.getPersonService();
        service.addMessage(p1, p2, message);
        return "";
    }
}
