package src.pages.foodweb.userInterface.controller.admin;

import model.User;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "admin", value = "/admin")
public class AdminServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session=request.getSession();
            User user=(User)session.getAttribute("user");
            String url="";
            if(user.getRole().trim().equals("member")){
                url="../";
            }
            else{
                url="/admin/cate";
            }
            response.sendRedirect(url);
        }
        catch(Exception e) {
            response.sendRedirect("/");
        }

    }

    public void destroy() {
    }
}