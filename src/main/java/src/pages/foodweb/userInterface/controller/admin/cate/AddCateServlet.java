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
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@WebServlet("/admin/cate/add")
public class AddCateServlet extends HttpServlet  {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            insertCate(request, response);
            response.sendRedirect("/admin/cate");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }


    private void insertCate(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        String img = request.getParameter("urlImage");
        String name = request.getParameter("cateName");
        Date date = new Date();
        Catalog newCate = new Catalog(0, name, img, date, date);
        CateDao.saveCate(newCate);
        request.getRequestDispatcher("/views/admin/category.jsp");
    }

    public void destroy() {
    }
}
