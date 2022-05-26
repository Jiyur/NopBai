package src.pages.foodweb.userInterface.controller.admin.food;

import src.pages.foodweb.userInterface.dao.admin.FoodDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin/food/update-img")
public class UpdateImgFoodServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            updateImg(request, response);
            response.sendRedirect("/admin/food");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private void updateImg(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        String url = request.getParameter("urlAddUpdateImage");
        long id = Long.parseLong(request.getParameter("foodIdUpdateImg"));

        System.out.println(url);
        System.out.println(id);
        FoodDAO.updateImg(id, url);

        request.getRequestDispatcher("/views/admin/category.jsp");
    }
}
