package src.pages.foodweb.userInterface.controller.cart;

import model.Food;
import model.OrderDetails;
import model.Orders;
import model.User;
import src.pages.foodweb.userInterface.dao.OrderDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import src.pages.foodweb.userInterface.dao.UserDAO;
import util.CookieUtil;

@WebServlet(name = "PayServlet", value = "/payment")
public class PayServlet extends HttpServlet {
    private UserDAO userDAO;
    public PayServlet() { userDAO = new UserDAO(); }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        Cart cart=(Cart) session.getAttribute("cart");

        if(user == null){
            Cookie[] cookies = request.getCookies();
            String emailAddress = CookieUtil.getCookieValue(cookies, "emailCookie");
            if (emailAddress == null || emailAddress.equals("")) {
                response.sendRedirect("/Login2Servlet?action=checkUser");
            }
            else {
                user = UserDAO.checkEmail(emailAddress);
                session.setAttribute("user", user);

                String strdate=(String) session.getAttribute("curDate");
                DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
                Date date= null;
                try {
                    date = dateFormat.parse(strdate);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                Orders orders=new Orders(user.getId(),date, (int) cart.getTotalPrice());
                for (int i=0;i<cart.getItems().size();i++){
                    LineItem lineItem=cart.getItems().get(i);
                    orders.addOrderDetail(new OrderDetails(lineItem.getFood(),orders,lineItem.getQuantity(), (float) lineItem.getTotal()));
                }
                OrderDAO.insert(orders);
                request.setAttribute("order",orders);
                request.getServletContext().getRequestDispatcher("/bill").forward(request,response);
                session.removeAttribute("cart");
            }
        }
        else{
            String strdate=(String) session.getAttribute("curDate");
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            Date date= null;
            try {
                date = dateFormat.parse(strdate);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            Orders orders=new Orders(user.getId(),date, (int) cart.getTotalPrice());
            for (int i=0;i<cart.getItems().size();i++){
                LineItem lineItem=cart.getItems().get(i);
                orders.addOrderDetail(new OrderDetails(lineItem.getFood(),orders,lineItem.getQuantity(), (float) lineItem.getTotal()));
            }
            OrderDAO.insert(orders);
            request.setAttribute("order",orders);
            request.getServletContext().getRequestDispatcher("/bill").forward(request,response);
            session.removeAttribute("cart");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
