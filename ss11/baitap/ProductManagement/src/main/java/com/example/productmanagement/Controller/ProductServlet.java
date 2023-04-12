package com.example.productmanagement.Controller;

import com.example.productmanagement.Model.Product;
import com.example.productmanagement.Service.IProductService;
import com.example.productmanagement.Service.imp.ProductService;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "productServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService iProductService = new ProductService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String actionUser = req.getParameter("actionUser");
        if(actionUser == null){
            actionUser = "";
        }
        switch (actionUser){
            case "create" :
                int id = Integer.parseInt(req.getParameter("id"));
                String name = req.getParameter("name");
                int price = Integer.parseInt(req.getParameter("price"));
                Product product = new Product(id,name,price);
                iProductService.create(product);
                resp.sendRedirect("/product");
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String actionUser = req.getParameter("actionUser");
        if(actionUser == null){
            actionUser = "";
        }
        switch (actionUser){
            case "create" :
                req.getRequestDispatcher("/View/Product/create.jsp").forward(req,resp);
                break;
            default:
                req.setAttribute("product" , iProductService.findAll());
                req.getRequestDispatcher("/View/Product/list.jsp").forward(req,resp);
        }
    }
}