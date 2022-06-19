package src.pages.foodweb.userInterface.controller.admin.cate;

import model.Catalog;
import model.User;
import src.pages.foodweb.userInterface.dao.admin.CateDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/cate")
public class CateAdminServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session=request.getSession();
            User user=(User)session.getAttribute("user");
            String url="";
            if(user.getRole().trim().equals("member")){
                url="../";
                response.sendRedirect(url);
            }
            else{
                listCate(request, response);
            }

        }
        catch(Exception e) {
            response.sendRedirect("/");
        }

    }

    protected void listCate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Catalog> listCate = CateDao.getAllCate();
        request.setAttribute("listCate", listCate);
        request.getServletContext().getRequestDispatcher("/views/admin/category.jsp").forward(request,response);
    }


    public void destroy() {
    }
}
