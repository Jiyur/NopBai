package src.pages.foodweb.userInterface.controller.login;

import model.User;
import src.pages.foodweb.userInterface.dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoadInfoServlet", value = "/LoadInfoServlet")
public class LoadInfoServlet extends HttpServlet {
    private UserDAO userDAO;
    public LoadInfoServlet() { userDAO = new UserDAO(); }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        response.setContentType("text/html;charset=UTF-8");

        HttpSession session=request.getSession();
        User user = (User) session.getAttribute("user");

        request.setAttribute("user",user);

        PrintWriter out = response.getWriter();

        out.println("<div class=\"img mb-4\" style=\"background-image:url(/assets/img/profile-ava.jpg)\"></div>\n" +
                "                        <div class=\"desc\">\n" +
                "                            <h1 class=\"mb-4\">"+user.getName()+"</h1>\n" +
                "\n" +
                "                            <h4 class=\"theme-color\" style=\"margin-bottom: 28px\">Email: "+user.getEmail()+"</h4>\n" +
                "                            <input id=\"userId\" type=\"hidden\" value=\""+user.getId()+"\" name=\"uid\">\n" +
                "\n" +
                "                            <label style=\"padding: 20px\">Số điện thoại</label>\n" +
                "                            <input id=\"userPhone\" type=\"text\" name=\"phone\" placeholder=\"Phone\" value=\""+user.getPhone()+"\"\n" +
                "                                   style=\"padding:6px;margin-left: 0px;opacity: 80%\">\n" +
                "                            <br>\n" +
                "\n" +
                "                            <label style=\"padding: 20px\">Địa chỉ</label>\n" +
                "                            <input id=\"userAddress\" type=\"text\" name=\"address\" placeholder=\"Address\"\n" +
                "                                   value=\""+user.getAddress()+"\" style=\"padding: 6px;margin-left: 50px; margin-top: 12px;opacity: 80% \">\n" +
                "                            <br>\n" +
                "\n" +
                "                            <button class=\"js-buy-ticket px-btn theme btn btn-success\" style=\"margin-top: 26px ;margin-right: 20px; border: solid black 1px\" type=\"\"\n" +
                "                                    onclick=\"updateProfile()\">Sửa thông tin\n" +
                "                            </button>\n" +
                "                        </div>");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
