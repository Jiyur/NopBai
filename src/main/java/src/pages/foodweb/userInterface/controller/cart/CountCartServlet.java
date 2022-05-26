package src.pages.foodweb.userInterface.controller.cart;

import src.pages.foodweb.userInterface.dao.FoodDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CountCartServlet", value = "/CountCartServlet")
public class CountCartServlet extends HttpServlet {
    private FoodDAO foodDAO;
    public CountCartServlet() { foodDAO = new FoodDAO(); }

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
        out.println("Danh sách sản phẩm (<span>"+cart.getCountItem()+"</span> sản phẩm)");
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
