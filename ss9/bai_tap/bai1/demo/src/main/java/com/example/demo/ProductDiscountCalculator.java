//package com.example.demo;
//
//import java.io.*;
//import javax.servlet.ServletException;
//import javax.servlet.http.*;
//import javax.servlet.annotation.*;
//
//@WebServlet(name = "helloServlet", value = "/index")
//public class ProductDiscountCalculator extends HttpServlet {
//    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
//
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        int  price = Integer.parseInt(req.getParameter("price"));
//        int discount =Integer.parseInt(req.getParameter("discount"));
//        double discountAmount = price * discount * 0.01;
//        double discountPrice = price - discountAmount;
//            req.setAttribute("discountAmount" , discountAmount);
//            req.setAttribute("discountPrice" , discountPrice);
//            req.getRequestDispatcher("/result.jsp").forward(req,resp);
//    }
//
//    public void destroy() {
//    }
//}