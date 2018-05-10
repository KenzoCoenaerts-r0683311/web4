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
        PersonService service = super.getPersonService();
        service.addMessage(p, message);
        return "";
    }
}
