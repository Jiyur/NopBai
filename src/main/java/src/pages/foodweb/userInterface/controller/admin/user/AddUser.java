package src.pages.foodweb.userInterface.controller.admin.user;

import model.User;
import src.pages.foodweb.userInterface.dao.admin.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddUserServlet", value = "/addUser")
public class AddUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String username=request.getParameter("username");
        String phone=request.getParameter("phone");
        String address=request.getParameter("address");
        User user=new User(username,email,phone,password,address,"member");
        UserDao.insert(user);
        response.sendRedirect("/admin/user");
    }
}
