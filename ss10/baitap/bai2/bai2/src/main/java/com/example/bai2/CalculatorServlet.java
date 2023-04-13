package com.example.bai2;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/calculator-servlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int firstOperand = Integer.parseInt(req.getParameter("first-operand"));
        int secondOperand = Integer.parseInt(req.getParameter("second-operand"));
        String operator = req.getParameter("operator");
        try{
            int result = Calculator.calculate(operator , firstOperand,secondOperand);
            req.setAttribute("result" , result);
            req.getRequestDispatcher("index.jsp").forward(req,resp);
        }catch (Exception e){
            req.getRequestDispatcher("exception.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}