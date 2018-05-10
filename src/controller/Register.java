package controller;

import domain.DomainException;
import domain.Person;
import domain.PersonService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class Register extends RequestHandler{
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        Person p = new Person();
        ArrayList<String> errors = new ArrayList<>();
        String naam = request.getParameter("naam");
        String voornaam = request.getParameter("voornaam");
        String email = request.getParameter("email");
        String geslacht = request.getParameter("geslacht");
        String password = request.getParameter("password");
        String passwordConfirmed = request.getParameter("passwordConfirmed");
        int age = Integer.parseInt(request.getParameter("age"));


        try {
            p.setLastName(naam);
        } catch(DomainException e) {
            errors.add(e.getMessage());
        }

        try {
            p.setFirstName(voornaam);
        } catch(DomainException e) {
            errors.add(e.getMessage());
        }

        try {
            p.setUserId(email);
        } catch(DomainException e) {
            errors.add(e.getMessage());
        }

        try {
            p.setPassword(password);
        } catch(DomainException e) {
            errors.add(e.getMessage());
        }

        if(!errors.isEmpty())
            return "register.jsp";

        PersonService personService = super.getPersonService();
        personService.addPerson(p);
        return "index.jsp";
    }
}
