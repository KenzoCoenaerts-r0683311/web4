package controller;

import domain.DomainException;
import domain.Person;
import domain.PersonService;
import domain.Role;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.ArrayList;

public class Register extends RequestHandler{
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        Person p = new Person();
        ArrayList<String> errors = new ArrayList<>();
        String name = request.getParameter("name");
        String firstName = request.getParameter("firstName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            p.setLastName(name);
        } catch(DomainException e) {
            errors.add(e.getMessage());
        }

        try {
            p.setFirstName(firstName);
        } catch(DomainException e) {
            errors.add(e.getMessage());
        }

        try {
            p.setUserId(email);
        } catch(DomainException e) {
            errors.add(e.getMessage());
        }

        try {
            p.setHashedPassword(password);
        } catch(DomainException e) {
            errors.add(e.getMessage());
        }

        try {
            p.setRole(Role.LID);
        } catch (DomainException e){
            errors.add(e.getMessage());
        }

        if(!errors.isEmpty())
            return "register.jsp";

        PersonService personService = super.getPersonService();
        personService.addPerson(p);
        System.out.println(personService.getPersons());
        return "index.jsp";
    }
}
