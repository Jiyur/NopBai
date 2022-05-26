package src.pages.foodweb.userInterface.controller.admin.food;

import org.hibernate.HibernateException;
import src.pages.foodweb.userInterface.dao.admin.FoodDAO;
import src.pages.foodweb.userInterface.dao.admin.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "DeleteFood", value = "/removeFood")
public class DeleteFood extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            request.setCharacterEncoding("UTF-8");
            String id=request.getParameter("fid");
            long fid=Long.parseLong(id);
            FoodDAO.delete(fid);
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
