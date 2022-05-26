package src.pages.foodweb.userInterface.controller.admin.food;

import model.Catalog;
import model.Food;
import model.Gallerie;
import src.pages.foodweb.userInterface.dao.admin.FoodDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

@WebServlet("/admin/food/add-img")
public class AddImgFoodServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            addImgFood(request, response);
            response.sendRedirect("/admin/food");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private void addImgFood(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        String img = request.getParameter("urlImageadd");
        long cateID = Long.parseLong(request.getParameter("foodImageadd"));
        Gallerie gallerie = new Gallerie();
        Food newFood = new Food();
        newFood.setFid(cateID);
        gallerie.setFood(newFood);
        gallerie.setImg_url(img);
        FoodDAO.addImg(gallerie);
        request.getRequestDispatcher("/views/admin/food.jsp");
    }

    public void destroy() {
    }
}
