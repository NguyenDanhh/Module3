package com.example.bai1;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class CustomerServlet extends HttpServlet {
    private List<Customer> customerList = new ArrayList<>();

    public void init(){
        customerList.add(new Customer(1 , "Danh" , "11/11/1111" , "Đà nẵng " , "https://bedental.vn/wp-content/uploads/2022/11/1e8063154fdf3dcbb07edf0ad2df326a.jpg"));
        customerList.add(new Customer(1 , "Hưng" , "22/22/2222" , "Quảng Nam " , "https://kenh14cdn.com/thumb_w/660/2020/7/17/brvn-15950048783381206275371.jpg"));
        customerList.add(new Customer(1 , "Toàn" , "33/33/3333" , "Huế " ,"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAPQ7rO1zigb3F_zAKtIJ6gwN-qvUYyZ6QHCl3dTaVZQ&s"));
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("customerList" , customerList);
        req.getRequestDispatcher("/index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}