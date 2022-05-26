package src.pages.foodweb.userInterface.controller.login;

import model.Orders;
import model.User;
import src.pages.foodweb.userInterface.dao.OrderDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "LoadInvoiceServlet", value = "/LoadInvoiceServlet")
public class LoadInvoiceServlet extends HttpServlet {

    private OrderDAO orderDAO;
    public LoadInvoiceServlet() { orderDAO = new OrderDAO(); }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        response.setContentType("text/html;charset=UTF-8");

        HttpSession session=request.getSession();
        User user=(User) session.getAttribute("user");

        ArrayList<Orders> invoice= OrderDAO.getInvoiceList(user.getId());
        request.setAttribute("invoice",invoice);
        request.setAttribute("count",invoice.size());

        PrintWriter out = response.getWriter();

        out.println("<h5 style=\"text-decorator: underline; font-size: 30px \" id=\"countCart\" class=\"mb-4 card-body\">Thông tin đơn hàng (<span>"+invoice.size()+"</span> đơn hàng)</h5>\n"+
                "                           ");

        for(Orders order : invoice){
            out.println("<div class=\"row mb-4 countItem\">\n" +
                    "                                        <div class=\"col-md-5 col-lg-3 col-xl-3\">\n" +
                    "                                            <div style=\"border: 1px solid rgba(0,0,0,0.300)\" class=\"view zoom overlay z-depth-1 rounded mb-3 mb-md-0\">\n" +
                    "                                                <img src=\"/assets/img/invoice-pic.jpg\" class=\"img-fluid w-100\" style=\"transform: scale(0.5)\"\n" +
                    "                                                     alt=\"Sample\">\n" +
                    "                                                <a href=\"#!\">\n" +
                    "                                                    <div class=\"mask waves-effect waves-light\">\n" +
                    "                                                        <img class=\"img-fluid w-100\" style=\"transform: scale(0.6)\"\n" +
                    "                                                             src=\"/assets/img/invoice-pic.jpg\" alt=\"none\">\n" +
                    "                                                        <div class=\"mask rgba-black-slight waves-effect waves-light\"></div>\n" +
                    "                                                    </div>\n" +
                    "                                                </a>\n" +
                    "                                            </div>\n" +
                    "                                        </div>\n" +
                    "                                        <div style=\"height: 174px\" class=\"col-md-7 col-lg-9 col-xl-9\">\n" +
                    "                                            <div>\n" +
                    "                                                <div style=\"height: 130px\" class=\"d-flex justify-content-between\">\n" +
                    "                                                    <div>\n" +
                    "                                                        <h5>Đơn hàng #"+order.getId()+"</h5>\n" +
                    "                                                        <p class=\"mb-3 text-muted text-uppercase small\">Ngày tạo: "+order.getCreated_at()+"</p>\n" +
                    "                                                        <p class=\"mb-0\"><span><strong>Tổng hoá đơn: "+order.getTotal()+"</strong></span></p>\n" +
                    "                                                    </div>\n" +
                    "                                                </div>\n" +
                    "                                                <div class=\"d-flex justify-content-between align-items-center\">\n" +
                    "                                                    <div>\n" +
                    "                                                        <a style=\"padding: 6px;\" class=\"btn-info btn-radius\" href=\"invoiceDetail?oid="+order.getId()+"\">Chi tiết đơn hàng</a>\n" +
                    "                                                    </div>\n" +
                    "                                                    <p class=\"totalSingle mb-0\"><span><strong></strong></span></p>\n" +
                    "                                                </div>\n" +
                    "                                            </div>\n" +
                    "                                        </div>\n" +
                    "                                    </div>\n" +
                    "                                    <hr style=\"background: black; \" class=\"mb-4\">");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
