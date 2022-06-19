package src.pages.foodweb.userInterface.controller.admin;

import model.User;
import src.pages.foodweb.userInterface.dao.admin.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/user")
public class UserAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> listUser= UserDao.getAllUser();
        request.setAttribute("listUser",listUser);
        try {
            HttpSession session=request.getSession();
            User user=(User)session.getAttribute("user");
            String url="";
            if(user.getRole().trim().equals("member")){
                url="../";
                response.sendRedirect(url);
            }
            else{
                request.getServletContext().getRequestDispatcher("/views/admin/user.jsp").forward(request,response);
            }

        }
        catch(Exception e) {
            response.sendRedirect("/");
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
