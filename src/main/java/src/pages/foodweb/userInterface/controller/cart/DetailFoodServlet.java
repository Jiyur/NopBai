package src.pages.foodweb.userInterface.controller.cart;

import model.Food;
import model.Gallerie;
import src.pages.foodweb.userInterface.dao.FoodDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

@WebServlet(name = "DetailFoodServlet", value = "/DetailFoodServlet")
public class DetailFoodServlet extends HttpServlet {

    private FoodDAO foodDAO;
    public DetailFoodServlet() { foodDAO = new FoodDAO(); }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Food> listFood = new ArrayList<Food>();
        listFood = foodDAO.listAllFood();
        request.setAttribute("listFood", listFood);

        String foodId = request.getParameter("foodId");
        if(foodId == null){
            foodId = request.getParameter("relativeFoodId");
        }
        if(foodId.length()>30){
            foodId=foodId.substring(0,30);
            System.out.println(foodId);
        }
        Food food = null;
        food = foodDAO.getFood(Integer.parseInt(foodId));
        request.setAttribute("food", food);


        List<Gallerie> listGalleries = new ArrayList<Gallerie>();
        listGalleries = food.getGalleries();
        request.setAttribute("listGalleries", listGalleries);


        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/detailFood.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
