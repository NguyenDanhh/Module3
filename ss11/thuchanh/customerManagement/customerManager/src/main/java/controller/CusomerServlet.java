package controller;

import service.ICustomerService;
import service.implement.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "customerServlet", value = "/customer")
public class CusomerServlet extends HttpServlet {
    private ICustomerService iCustomerService = new CustomerService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("customerList" , iCustomerService.findAll());
        req.getRequestDispatcher("view/customer/list.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String actionUser = req.getParameter("actionUser");
        if(actionUser == null){
            actionUser = "";
        }
        switch (actionUser){
            case "create" :
                req.getRequestDispatcher("/view/customer/create.jsp").forward(req,resp);
                break;
            default:
                req.setAttribute("customerList" , iCustomerService.findAll());
                req.getRequestDispatcher("/view/customer/list.jsp");
        }
    }
}
