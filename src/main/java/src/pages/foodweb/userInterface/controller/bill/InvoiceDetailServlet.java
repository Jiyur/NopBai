package src.pages.foodweb.userInterface.controller.bill;

import model.OrderDetails;
import model.Orders;
import model.User;
import src.pages.foodweb.userInterface.dao.OrderDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Set;

@WebServlet(name = "InvoiceDetailServlet", value = "/invoiceDetail")
public class InvoiceDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String oid=request.getParameter("oid");
        HttpSession session=request.getSession();
        User user=(User) session.getAttribute("user");
        Set<OrderDetails> invoiceDetail= OrderDAO.getInvoiceDetail(Integer.parseInt(oid));
        Orders orders=OrderDAO.getOrder(Integer.parseInt(oid));
        String url=null;

        if(orders.getCustomer_id().equals(user.getId())){
            request.setAttribute("order",orders);
            request.setAttribute("detail",invoiceDetail);
            request.getRequestDispatcher("views/invoiceDetail.jsp").forward(request,response);

        }
        else{
            response.sendRedirect("../");
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
