package src.pages.foodweb.userInterface.controller.cart;

import src.pages.foodweb.userInterface.dao.FoodDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateTotalCartServlet", value = "/UpdateTotalCartServlet")
public class UpdateTotalCartServlet extends HttpServlet {
    private FoodDAO foodDAO;
    public UpdateTotalCartServlet() { foodDAO = new FoodDAO(); }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }

        session.setAttribute("cart", cart);

        System.out.println(cart.getTotalCurrencyFormat());

        PrintWriter out = response.getWriter();
        out.println("<div class=\"card mb-4\">\n" +
                "                            <div class=\"card-body\">\n" +
                "                                <h5 class=\"mb-3\">THANH TOÁN</h5>\n" +
                "                                <ul class=\"list-group list-group-flush\">\n" +
                "                                    <li class=\"list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0\">\n" +
                "                                        Tạm tính\n" +
                "                                        <span id=\"totalCart\">"+cart.getTotalCurrencyFormat()+"</span>\n" +
                "                                    </li>\n" +
                "                                    <li class=\"list-group-item d-flex justify-content-between align-items-center px-0\">\n" +
                "                                        Shipping\n" +
                "                                        <span>asd</span>\n" +
                "                                    </li>\n" +
                "                                    <li\n" +
                "                                            class=\"list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3\">\n" +
                "                                        <div>\n" +
                "                                            <strong>Tổng thanh toán</strong>\n" +
                "                                            <strong>\n" +
                "                                                <p class=\"mb-0\">(Bao gồm VAT)</p>\n" +
                "                                            </strong>\n" +
                "                                        </div>\n" +
                "                                        <span><strong>"+cart.getTotalCurrencyFormat()+"</strong></span>\n" +
                "                                    </li>\n" +
                "                                </ul>\n" +
                "                                <a onclick=\"openModal()\" class=\"js-buy-ticket btn btn-primary btn-block waves-effect waves-light\">Thanh toán</a>\n" +
                "                            </div>\n" +
                "                        </div>");

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
