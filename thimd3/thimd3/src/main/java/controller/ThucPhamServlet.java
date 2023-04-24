package controller;

import repository.IThucPhamRepository;
import repository.ThucPhamRepository;
import service.IThucPhamService;
import service.ThucPhamService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ThucPhamServlet", value = "/thucpham")
public class ThucPhamServlet extends HttpServlet {
    IThucPhamService iThucPhamService = new ThucPhamService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                break;
            case "delete":
                break;
            default:
                showList(request , response);
                break;
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("list" , iThucPhamService.findAll());
        request.getRequestDispatcher("/view/list.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
