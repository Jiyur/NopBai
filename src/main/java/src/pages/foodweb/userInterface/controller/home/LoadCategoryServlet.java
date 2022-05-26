package src.pages.foodweb.userInterface.controller.home;

import model.*;
import src.pages.foodweb.userInterface.dao.FoodDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LoadCategoryServlet", value = "/LoadCategoryServlet")
public class LoadCategoryServlet extends HttpServlet {
    private FoodDAO foodDAO;
    public LoadCategoryServlet() { foodDAO = new FoodDAO(); }


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        List<Food> listFood = new ArrayList<Food>();
        String cateId = request.getParameter("cateId");
        int icateId = Integer.parseInt(cateId);

        if(icateId == 0){
            listFood = foodDAO.list8Food();
        }
        else {
            listFood = foodDAO.getList8FoodByCate(icateId);
        }

        PrintWriter out = response.getWriter();

        for(Food food : listFood){
            out.println("<form style=\"cursor: pointer\" action=\"DetailFoodServlet\" method=\"post\">\n" +
                    "                <input type=\"hidden\" name=\"foodId\" value=\""+food.getFid()+"\">\n" +
                    "                <a style=\"text-decoration: none; color: black;\" onclick=\"this.parentNode.submit()\">\n" +
                    "                    <div class=\"box count-food\">\n" +
                    "                        <div class=\"image\">\n" +
                    "                            <img src=\""+food.getGalleries().get(0).getImg_url()+"\" alt=\"\">\n" +
                    "                        </div>\n" +
                    "                        <div class=\"content\">\n" +
                    "                            <div class=\"stars\">\n" +
                    "                                <i class=\"fas fa-star\"></i>\n" +
                    "                                <i class=\"fas fa-star\"></i>\n" +
                    "                                <i class=\"fas fa-star\"></i>\n" +
                    "                                <i class=\"fas fa-star\"></i>\n" +
                    "                                <i class=\"fas fa-star-half-alt\"></i>\n" +
                    "                            </div>\n" +
                    "                            <h3>"+food.getF_name()+"</h3>\n" +
                    "                            <span class=\"price\">"+food.getPriceCurrencyFormat()+"</span>\n" +
                    "                        </div>\n" +
                    "                    </div>\n" +
                    "                </a>\n" +
                    "            </form>");
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
