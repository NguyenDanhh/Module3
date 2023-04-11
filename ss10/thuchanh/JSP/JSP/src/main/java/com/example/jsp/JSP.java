package com.example.jsp;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class JSP extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float rate = Float.parseFloat(request.getParameter("rate"));
        float usd = Float.parseFloat(request.getParameter("usd"));

        float vnd = usd * rate;
        request.setAttribute("vnd" , vnd);
        request.setAttribute("rate" , rate);
        request.setAttribute("usd" , usd);
        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }
}