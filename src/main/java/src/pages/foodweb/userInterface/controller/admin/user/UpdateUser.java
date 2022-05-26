package src.pages.foodweb.userInterface.controller.admin.user;

import src.pages.foodweb.userInterface.dao.admin.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "UpdateUserServlet", value = "/updateUser")
public class UpdateUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name=request.getParameter("name");
        String phone=request.getParameter("phone");
        String address=request.getParameter("address");
        String email=request.getParameter("email");
        String uid=request.getParameter("uid");
        UUID uuid=UUID.fromString(uid);
        UserDao.update(uuid,email,name,phone,address);
        response.sendRedirect("/admin/user");
    }
}
