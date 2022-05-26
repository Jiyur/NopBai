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
import java.util.Date;

@WebServlet("/admin/cate/update")
public class UpdateCateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            updateCate(request, response);
            response.sendRedirect("/admin/cate");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }


    private void updateCate(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        String img = request.getParameter("urlImageUpdate");
        String name = request.getParameter("cateNameUpdate");
        long id = Long.parseLong(request.getParameter("cateIdUpdate"));
        Date date = new Date();
        System.out.println(name);
        CateDao.updateCate(id, img, name, date);

        request.getRequestDispatcher("/views/admin/category.jsp");
    }

    public void destroy() {
    }

}
