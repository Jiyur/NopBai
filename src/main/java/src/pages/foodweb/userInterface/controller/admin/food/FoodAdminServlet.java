package src.pages.foodweb.userInterface.controller.admin.food;

import model.Catalog;
import model.Food;
import model.User;
import src.pages.foodweb.userInterface.dao.admin.CateDao;
import src.pages.foodweb.userInterface.dao.admin.FoodDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/food")
public class FoodAdminServlet extends HttpServlet {

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
            }
            else{
                url="/admin/cate";
            }
            response.sendRedirect(url);
        }
        catch(Exception e) {
            response.sendRedirect("/");
        }
        listFood(request,response);
    }

    protected void listFood(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Food> listFood =  FoodDAO.listAllFood();
        List<Catalog> listCate = CateDao.getAllCate();
        request.setAttribute("listFood", listFood);
        request.setAttribute("listCate", listCate);
        request.getServletContext().getRequestDispatcher("/views/admin/food.jsp").forward(request,response);
    }

    public void destroy() {
    }
}
