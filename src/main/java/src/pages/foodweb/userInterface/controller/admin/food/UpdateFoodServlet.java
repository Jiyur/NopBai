package src.pages.foodweb.userInterface.controller.admin.food;

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

@WebServlet("/admin/food/update")
public class UpdateFoodServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            updateFood(request, response);
            response.sendRedirect("/admin/food");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private void updateFood(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        String des = request.getParameter("foodDesDetail");
        String name = request.getParameter("foodNameDetail");
        long id = Long.parseLong(request.getParameter("foodIdUpdate"));

        float price = Float.parseFloat(request.getParameter("foodPriceDetail"));

        System.out.println(name);
        FoodDAO.updateFood(id, des, name, price);

        request.getRequestDispatcher("/views/admin/category.jsp");
    }

    public void destroy() {
    }
}
