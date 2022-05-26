package src.pages.foodweb.userInterface.controller.admin.food;

import org.hibernate.HibernateException;
import src.pages.foodweb.userInterface.dao.admin.FoodDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteImgFood", value = "/removeImgFood")
public class DeleteImgFoodServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            request.setCharacterEncoding("UTF-8");
            long id = Long.parseLong(request.getParameter("foodIdUpdateImg"));

            System.out.println(id);

            response.sendRedirect("/admin/food");
        }
        catch (HibernateException ex){
            ex.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
