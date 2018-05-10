package controller;

import com.fasterxml.jackson.core.JsonProcessingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AsynchronousRequest {
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException;
}
