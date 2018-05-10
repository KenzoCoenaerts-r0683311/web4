package controller;

import domain.Person;
import domain.PersonService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddFriend extends RequestHandler implements AsynchronousRequest {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        PersonService personService = super.getPersonService();
        HttpSession session = request.getSession();
        Person p = (Person)session.getAttribute("user");

        if(p != null ) {
            if (personService.personExsits(name)) {
                Person friend = personService.getPerson(name);
                p.addFriend(friend);
                friend.addFriend(p);
            }
        }

        return "";
    }
}
