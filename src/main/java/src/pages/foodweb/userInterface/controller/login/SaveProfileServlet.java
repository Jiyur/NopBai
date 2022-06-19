package src.pages.foodweb.userInterface.controller.login;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import model.User;
import src.pages.foodweb.userInterface.dao.UserDAO;

import java.io.PrintWriter;
import java.util.UUID;
import static org.apache.commons.text.StringEscapeUtils.escapeHtml4;
@WebServlet(name = "SaveProfileServlet", value = "/SaveProfileServlet")
public class SaveProfileServlet extends HttpServlet {
    private UserDAO userDAO;
    public SaveProfileServlet() { userDAO = new UserDAO(); }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        String id = request.getParameter("id");
        String address = request.getParameter("address");
        if(address.length()>50){
            address=address.substring(0,50);
        }

//        String address = escapeHtml4(request.getParameter("address"));
        String name = user.getName();
        String phone = request.getParameter("phone");
        if(phone.length()>10){
            phone=phone.substring(0,10);
        }
//        String phone = escapeHtml4(request.getParameter("phone"));

        UserDAO.update((UUID.fromString(id)), name, phone, address);

        user.setName(name);
        user.setAddress(address);
        user.setPhone(phone);

        session.setAttribute("user", user);

        System.out.println(user.getAddress());

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
