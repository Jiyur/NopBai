package src.pages.foodweb.userInterface.controller.bill;

import model.Orders;
import model.User;
import src.pages.foodweb.userInterface.dao.OrderDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "InvoiceServlet", value = "/invoice")
public class InvoiceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        User user=(User) session.getAttribute("user");
        if(user==null){
            response.sendRedirect("/Login2Servlet?action=checkUser");
        }
        else{
            ArrayList<Orders> invoice= OrderDAO.getInvoiceList(user.getId());
            request.setAttribute("invoice",invoice);
            request.setAttribute("count",invoice.size());
            request.getRequestDispatcher("views/invoice.jsp").forward(request,response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
