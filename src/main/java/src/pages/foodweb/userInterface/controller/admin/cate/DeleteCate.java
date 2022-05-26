package src.pages.foodweb.userInterface.controller.admin.cate;

import src.pages.foodweb.userInterface.dao.admin.CateDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name="DeleteCateServlet", value = "/removeCate")
public class DeleteCate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            delete(request, response);
            response.sendRedirect("/admin/cate");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);

    }
    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException{
        request.setCharacterEncoding("UTF-8");
        String cate_id_str=request.getParameter("cateID");
        long cate_id=Long.parseLong(cate_id_str);
        CateDao.deleteCate(cate_id);


    }

}
