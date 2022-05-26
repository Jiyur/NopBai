package src.pages.foodweb.userInterface.controller.cart;

import model.Food;
import model.Gallerie;
import src.pages.foodweb.userInterface.dao.FoodDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartServlet", value = "/CartServlet")
public class CartServlet extends HttpServlet {

    private FoodDAO foodDAO;
    public CartServlet() { foodDAO = new FoodDAO(); }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        String foodId = request.getParameter("foodId");
//        String quantityString = request.getParameter("quantity");
//        int quantity = Integer.parseInt(quantityString);
//
//        Food food = null;
//        food = foodDAO.getFood(Integer.parseInt(foodId));
//        LineItem lineItem = new LineItem();
//        lineItem.setFood(food);
//        lineItem.setQuantity(quantity);



        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ServletContext sc = getServletContext();

        // get current action
        String action = request.getParameter("action");
        if (action == null) {
            action = "cart";  // default action
        }

        String url = "/index.jsp";
        // perform action and set URL to appropriate page
        if (action.equals("shop")) {
            url = "/index.jsp";    // the "index" page
        }
        else if (action.equals("cart")) {

            String foodId = request.getParameter("foodId");
            String quantityString = request.getParameter("quantity");

            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
            }

            //if the user enters a negative or invalid quantity,
            //the quantity is automatically reset to 1.
            int quantity;
            try {
                quantity = Integer.parseInt(quantityString);
                if (quantity < 0) {
                    quantity = 1;
                }
            } catch (NumberFormatException nfe) {
                quantity = 1;
            }

            Food food = null;

            try {
                food = foodDAO.getFood(Integer.parseInt(foodId));
                LineItem lineItem = new LineItem();
                lineItem.setFood(food);
                lineItem.setQuantity(quantity);
                if (quantity > 0) {
                    cart.addItem(lineItem);
                } else if (quantity == 0) {
                    cart.removeItem(lineItem);
                }
                session.setAttribute("cart", cart);

                request.setAttribute("food", food);

                List<Food> listFood = new ArrayList<Food>();
                listFood = foodDAO.listAllFood();
                request.setAttribute("listFood", listFood);

                List<Gallerie> listGalleries = food.getGalleries();
                request.setAttribute("listGalleries", listGalleries);


                String isDetail = request.getParameter("isDetail");
                System.out.println(isDetail);
                if(isDetail.isEmpty() || isDetail == null || isDetail.length() == 0 ){
                    url = "/views/main_cart.jsp";
                    sc.getRequestDispatcher(url).forward(request, response);
                }
                if(isDetail.equals("yes")){
                    response.setStatus(HttpServletResponse.SC_NO_CONTENT);
                    sc.getRequestDispatcher(url).forward(request, response);
                }

            }catch (Exception e){
                System.out.println(e);
                session.setAttribute("cart", cart);
                url = "/views/main_cart.jsp";
                sc.getRequestDispatcher(url).forward(request, response);
            }
        }
    }
}
