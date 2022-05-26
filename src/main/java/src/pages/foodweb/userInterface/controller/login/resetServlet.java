package src.pages.foodweb.userInterface.controller.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import src.pages.foodweb.userInterface.dao.UserDAO;
import util.EmailUtil;

@WebServlet("/resetServlet")
public class resetServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public resetServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String acction = request.getParameter("action");
        String random = String.valueOf((int)(Math.random() * 9000 + 1000));
        if(acction.equals("emailReset")) {
            String email= request.getParameter("email");
            User user = UserDAO.checkEmail(email);
            if(user != null) {
                boolean send;
                try {
                    send = EmailUtil.sendMail(email, "Reset PassWord",
                            "When prompted, enter this code to verify your account: " + random);
                } catch (Exception e) {
                    e.printStackTrace();
                    send = false;
                }
                if(send) {
                    session.setAttribute("resetRandom", random);
                    session.setAttribute("resetEmail", email);
                    request.getRequestDispatcher("/views/codeReset.jsp").forward(request, response);
                }
                else {
                    request.setAttribute("message", "Error send mail");
                    request.getRequestDispatcher("/views/reset.jsp").forward(request, response);
                }
            }
            else {
                request.setAttribute("message", "Email is does not exist");
                request.getRequestDispatcher("/views/reset.jsp").forward(request, response);
            }
        }else {
            if(acction.equals("codeReset")) {
                String rd = (String) session.getAttribute("resetRandom");
                String code = request.getParameter("code");
                if(code.equals(rd)) {
                    request.getRequestDispatcher("/views/newPass.jsp").forward(request, response);
                }
                else {
                    request.setAttribute("message", "Code is not correct");
                    request.getRequestDispatcher("/views/codeReset.jsp").forward(request, response);
                }
            }
            else {
                if(acction.equals("resendCode")) {
                    session.setAttribute("resetRandom", random);
                    String emailReset = (String) session.getAttribute("resetEmail");
                    boolean send = sendMail(emailReset, random);
                    if(send) {
                        request.setAttribute("message", "sent");
                        request.getRequestDispatcher("/views/codeReset.jsp").forward(request, response);
                    }
                    else {
                        request.setAttribute("message", "Can not send");
                        request.getRequestDispatcher("/views/codeReset.jsp").forward(request, response);
                    }
                }
                else {
                    String email = (String) session.getAttribute("resetEmail");
                    String pass = request.getParameter("password");
                    String confirmPass = request.getParameter("confirmPass");
                    if(!pass.equals(confirmPass)) {
                        request.setAttribute("message", "unduplicated");
                        request.getRequestDispatcher("/views/newPass.jsp").forward(request, response);
                    }
                    else {
                        User user = UserDAO.checkEmail(email);;
                        UserDAO.reset(user,pass);
                        session.removeAttribute("resetEmail");
                        session.removeAttribute("resetRandom");
                        request.setAttribute("message", "success");
                        request.getRequestDispatcher("/views/newPass.jsp").forward(request, response);
                    }
                }
            }
        }
    }

    private boolean sendMail(String email, String random){
        boolean send;
        try {
            send = EmailUtil.sendMail(email, "Reset Password",
                    "When prompted, enter this code to verify your account: " + random);
        } catch (Exception e) {
            e.printStackTrace();
            send = false;
        }
        return send;
    }

}