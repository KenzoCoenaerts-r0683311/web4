package controller;

import domain.Person;
import domain.PersonService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChangeStatus extends RequestHandler implements AsynchronousRequest {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        String state = (String) request.getParameter("state");
        PersonService personService = super.getPersonService();
        HttpSession session = request.getSession();
        Person p  = (Person)session.getAttribute("user");

        if(p != null) {
            p.setState("online");

            if(state != null){
                System.out.println(state);
                p.setState(state);
            }
        } else {
            for( Person pe : personService.getPersons() ){
                pe.setState("offline");
            }
        }
        return "";
    }
}
