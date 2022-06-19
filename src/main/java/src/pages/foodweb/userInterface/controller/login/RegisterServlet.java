package src.pages.foodweb.userInterface.controller.login;

import model.User;
import src.pages.foodweb.userInterface.dao.UserDAO;
import util.EmailUtil;
import util.PasswordUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String msg = "";
        if(email.equals("") || pass.equals("")) {
            msg = "Email or password";
            response.getWriter().write(msg);
        }
        else {
            String random = String.valueOf((int)(Math.random() * 9000 + 1000));
            boolean send;
            try {
                send = EmailUtil.sendMail(email, "Email Verification",
                        "When prompted, enter this code to verify your account: " + random);
            } catch (Exception e) {
                e.printStackTrace();
                send = false;
            }
            if(send) {
                session.setAttribute("random", random);
                msg = "Check email";
                response.getWriter().write(msg);
            }
            else {
                msg = "Erro send mail";
                response.getWriter().write(msg);
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String rd = (String) session.getAttribute("random");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String code = request.getParameter("code");
        String action = request.getParameter("action");
        String msg = "";
        User user = new User(email,pass);
        if(action.equals("sendCode")) {
            User u = UserDAO.checkEmail(email);
            if(u == null) {
                doGet(request, response);
            }
            else {
                msg = "Fail";
                response.getWriter().write(msg);
            }
        }
        if(action.equals("Register")){
            if(email.equals("") || pass.equals("")) {
                msg = "Email or password";
                response.getWriter().write(msg);
            }
            else if(!PasswordUtil.checkStrengthOfPassword(pass)){
                msg="Password strength";
                response.getWriter().write(msg);
            }
            else {
                if(code.equals("")){
                    msg = "Code";
                    response.getWriter().write(msg);
                }else {
                    if(code.equals(rd)) {
                        if(UserDAO.insertUser(user)) {
                            msg = "Success";
                            response.getWriter().write(msg);
                        }
                        else
                        {
                            msg = "Fail";
                            response.getWriter().write(msg);
                        }
                    }
                    else {
                        msg = "Erro Code";
                        response.getWriter().write(msg);
                    }
                }
            }
        }
    }

}
