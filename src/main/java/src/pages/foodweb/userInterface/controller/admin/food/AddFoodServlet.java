package src.pages.foodweb.userInterface.controller.admin.food;

import model.Catalog;
import model.Food;
import model.Gallerie;
import src.pages.foodweb.userInterface.dao.admin.CateDao;
import src.pages.foodweb.userInterface.dao.admin.FoodDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

@WebServlet("/admin/food/add")
public class AddFoodServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            insertFood(request, response);
            response.sendRedirect("/admin/food");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }


    private void insertFood(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        String img = request.getParameter("urlImage");
        String name = request.getParameter("foodName");
        String des = request.getParameter("foodDes");
        long cateID = Long.parseLong(request.getParameter("cateList"));
        float price = Float.parseFloat(request.getParameter("foodPrice"));
        Date date = new Date();
        Catalog cate = new Catalog();
        cate.setId(cateID);
        Food newFood = new Food(name, des, price);
        newFood.setCatalog(cate);
        Gallerie gallerie = new Gallerie();
        gallerie.setImg_url(img);
        gallerie.setFood(newFood);
        FoodDAO.saveFood(newFood, gallerie);
        request.getRequestDispatcher("/views/admin/food.jsp");
    }

    public void destroy() {
    }
}
