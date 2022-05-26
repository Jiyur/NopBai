package src.pages.foodweb.userInterface.controller.admin.user;

import org.hibernate.HibernateException;
import src.pages.foodweb.userInterface.dao.admin.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "DeleteUserServlet", value = "/removeUser")
public class DeleteUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            request.setCharacterEncoding("UTF-8");
            String id=request.getParameter("uid");
            UUID uuid=UUID.fromString(id);
            UserDao.delete(uuid);
            response.sendRedirect("/admin/user");
        }
        catch (HibernateException ex){
            ex.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
