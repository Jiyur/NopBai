package src.pages.foodweb.userInterface.controller.cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

import model.Food;
import src.pages.foodweb.userInterface.dao.FoodDAO;

@WebServlet(name = "UpdateCartServlet", value = "/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
    private FoodDAO foodDAO;
    public UpdateCartServlet() { foodDAO = new FoodDAO(); }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        response.setContentType("text/html;charset=UTF-8");
//        String action = request.getParameter("action");
//        if (action == null) {
//            action = "cart";  // default action
//        }

//        String url = "/index.jsp";
//        if (action.equals("shop")) {
//            url = "/index.jsp";    // the "index" page
//        }
//        else if (action.equals("cart"))
//        {

            String foodId = request.getParameter("IdFood");
            String quantityString = request.getParameter("FoodQuantity");

            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
            }

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

            food = foodDAO.getFood(Integer.parseInt(foodId));
            LineItem lineItem = new LineItem();
            lineItem.setFood(food);

            String typeBtn = request.getParameter("typeBtn");
            if(typeBtn.equals("plus")){
                quantity += 1;
            }
            else{
                quantity -= 1;
            }
            lineItem.setQuantity(quantity);
            if (quantity > 0) {
                cart.addItem(lineItem);
            } else if (quantity == 0 || quantity < 0) {
                cart.removeItem(lineItem);
            }
            session.setAttribute("cart", cart);

            request.setAttribute("food", food);

        PrintWriter out = response.getWriter();
        for(LineItem item : cart.getItems()){
            out.println("<div class=\"row mb-4 countItem\">\n" +
                    "                                            <div class=\"col-md-5 col-lg-3 col-xl-3\">\n" +
                    "                                                <div style=\"border: 1px solid rgba(0,0,0,0.3)\" class=\"view zoom overlay z-depth-1 rounded mb-3 mb-md-0\">\n" +
                    "                                                    <img class=\"img-fluid w-100\"\n" +
                    "                                                         src=\""+item.getFood().getGalleries().get(0).getImg_url()+"\"\n" +
                    "                                                         alt=\"Sample\">\n" +
                    "                                                    <a href=\"#!\">\n" +
                    "                                                        <div class=\"mask waves-effect waves-light\">\n" +
                    "                                                            <img class=\"img-fluid w-100\"\n" +
                    "                                                                 src=\""+item.getFood().getGalleries().get(0).getImg_url()+"\">\n" +
                    "                                                            <div class=\"mask rgba-black-slight waves-effect waves-light\"></div>\n" +
                    "                                                        </div>\n" +
                    "                                                    </a>\n" +
                    "                                                </div>\n" +
                    "                                            </div>\n" +
                    "                                            <div style=\"height: 174px\" class=\"col-md-7 col-lg-9 col-xl-9\">\n" +
                    "                                                <div>\n" +
                    "                                                    <div style=\"height: 130px\" class=\"d-flex justify-content-between\">\n" +
                    "                                                        <div>\n" +
                    "                                                            <h5>"+item.getFood().getF_name()+"</h5>\n" +
                    "                                                            <p class=\"mb-3 text-muted text-uppercase small\">"+item.getFood().getDesciprtion()+"</p>\n" +
                    "                                                        </div>\n" +
                    "                                                        <div>\n" +
                    "                                                            <div class=\"def-number-input number-input safari_only mb-0 w-100\">\n" +
                    "                                                                <input type=\"hidden\" name=\"foodId\" value=\""+item.getFood().getFid()+"\">\n" +
                    "\n" +
                    "                                                                <input style=\"font-weight: bold; padding-left: 10px; width: 2.5rem; border: none; background-color: transparent\" onclick=\"this.parentNode.querySelector('input[type=number]').stepDown(); updateCart("+item.getFood().getFid()+", "+item.getQuantity()+", 'minus')\"\n" +
                    "                                                                       type=\"submit\" value=\"-\">\n" +
                    "\n" +
                    "                                                                <input name=\"quantity\" class=\"quantity\" min=\"0\" value=\""+item.getQuantity()+"\"\n" +
                    "                                                                       type=\"number\">\n" +
                    "\n" +
                    "                                                                <input id=\"btnPlus\" style=\"font-weight: bold; padding-right: 10px; width: 2.5rem; border: none; background-color: transparent\" onclick=\"this.parentNode.querySelector('input[type=number]').stepUp(); updateCart("+item.getFood().getFid()+", "+item.getQuantity()+", 'plus');\"\n" +
                    "                                                                       type=\"submit\" value=\"+\">\n" +
                    "\n" +
                    "                                                            </div>\n" +
                    "                                                        </div>\n" +
                    "                                                    </div>\n" +
                    "                                                    <div class=\"d-flex justify-content-between align-items-center\">\n" +
                    "                                                        <div>\n" +
                    "                                                            <input type=\"hidden\" name=\"foodId\"\n" +
                    "                                                                   value=\""+item.getFood().getFid()+"\">\n" +
                    "                                                            <input type=\"hidden\" name=\"quantity\" value=\"0\">\n" +
                    "                                                            <input style=\"font-family: Roboto; padding: 5px; color: white\" class=\"btn-danger card-link-secondary small text-uppercase mr-3 fas fa-trash-alt mr-1\"\n" +
                    "                                                                   type=\"submit\" value=\"GỠ SẢN PHẨM\" onclick=\"updateCart("+item.getFood().getFid()+", '0','minus' )\">\n" +
                    "\n" +
                    "                                                        </div>\n" +
                    "                                                        <p class=\"mb-0\"><span><strong>"+item.getFood().getPriceCurrencyFormat()+"</strong></span></p>\n" +
                    "                                                        <p class=\"totalSingle mb-0\"><span><strong>"+item.getTotalCurrencyFormat()+"</strong></span></p>\n" +
                    "                                                    </div>\n" +
                    "                                                </div>\n" +
                    "                                            </div>\n" +
                    "                                        </div>\n" +
                    "                                        <hr style=\"background: rgba(0,0,0,0.3)\" class=\"mb-4\">");
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
