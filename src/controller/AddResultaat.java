package controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import domain.PersonService;
import domain.WkResultaat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddResultaat extends RequestHandler implements AsynchronousRequest  {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
        PersonService service = super.getPersonService();
        String resultaat = request.getParameter("resultaat");
        WkResultaat resultaat1 = new WkResultaat(resultaat);
        service.addWkResultaten(resultaat1);
        System.out.print(service.getWkResultaten().get(0).getScore());
        return "";
    }
}
