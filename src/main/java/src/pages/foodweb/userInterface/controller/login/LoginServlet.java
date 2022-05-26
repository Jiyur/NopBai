package src.pages.foodweb.userInterface.controller.login;

import model.User;
import src.pages.foodweb.userInterface.dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session=request.getSession();
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        User user = UserDAO.login(email, pass);
        String url ="/views/login.jsp";
        if(user != null) {
            url ="/index.jsp";
            session.setAttribute("user",user);
            request.getRequestDispatcher(url).forward(request, response);
        }
        else {
            request.setAttribute("message", "Fail");
            request.getRequestDispatcher(url).forward(request, response);
        }
    }
}
