package src.pages.foodweb.userInterface.controller.admin.cate;

import model.Catalog;
import src.pages.foodweb.userInterface.dao.admin.CateDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        listCate(request, response);
    }

    protected void listCate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Catalog> listCate = CateDao.getAllCate();
        request.setAttribute("listCate", listCate);
        request.getServletContext().getRequestDispatcher("/views/admin/category.jsp").forward(request,response);
    }


    public void destroy() {
    }
}
