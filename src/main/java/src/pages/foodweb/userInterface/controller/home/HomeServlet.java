package src.pages.foodweb.userInterface.controller.home;

import model.Food;
import src.pages.foodweb.userInterface.controller.cart.Cart;
import src.pages.foodweb.userInterface.dao.FoodDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HomeServlet", value = "")
public class HomeServlet extends HttpServlet {

    private FoodDAO foodDAO;
    public HomeServlet() { foodDAO = new FoodDAO(); }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Food> listFood = new ArrayList<Food>();
        listFood = foodDAO.list8Food();
        request.setAttribute("listFood", listFood);

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
//        request.getRequestDispatcher("index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
