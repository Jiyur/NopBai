package src.pages.foodweb.userInterface.controller.login;

import model.User;
import src.pages.foodweb.userInterface.dao.UserDAO;
import util.CookieUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "profile", value = "/Login2Servlet")
public class Login2Servlet extends HttpServlet {
    private UserDAO userDAO;
    public Login2Servlet() { userDAO = new UserDAO(); }

    @Override
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws IOException, ServletException {

        // get current action
        String action = request.getParameter("action");
        if (action == null) {
            action = "viewAlbums";  // default action
        }

        // perform action and set URL to appropriate page
        String url = "/Download/download_main.jsp";
        if (action.equals("viewAlbums")) {
            url = "/Download/download_main.jsp";
        } else if (action.equals("checkUser")) {
            url = checkUser(request, response);
        } else if (action.equals("viewCookies")) {
            url = "/Download/view_cookies.jsp";
        } else if (action.equals("deleteCookies")) {
            url = deleteCookies(request, response);
        }

        // forward to the view
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
            throws IOException, ServletException {

        String action = request.getParameter("action");

        HttpSession session=request.getSession();
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        User user = UserDAO.login(email, pass);
        String url ="/views/login.jsp";
        if(user != null) {
            url ="index.jsp";
            session.setAttribute("user",user);
            String role=user.getRole();
            if(role==null){
                role="member";
            }
            if(role.equals("admin")){
                url="/views/admin/index.jsp";
            }

            // add a cookie that stores the user's email as a cookie
            Cookie c1 = new Cookie("emailCookie", email);
            c1.setHttpOnly(true);
            c1.setMaxAge(60 * 60 * 24 * 365 * 2); // set age to 2 years
            c1.setPath("/");                      // allow entire app to access it
            response.addCookie(c1);
            request.getRequestDispatcher(url).forward(request, response);
        }
        else {
            request.setAttribute("message", "Fail");
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private String checkUser(HttpServletRequest request,
                             HttpServletResponse response) {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        String url;

        // if User object doesn't exist, check email cookie
        if (user == null) {
            Cookie[] cookies = request.getCookies();
            String emailAddress = CookieUtil.getCookieValue(cookies, "emailCookie");
            if (emailAddress == null || emailAddress.equals("")) {
                url = "/views/login.jsp";
            }
            else {
                user = UserDAO.checkEmail(emailAddress);
                session.setAttribute("user", user);
                url = "/views/profile.jsp";
            }
        }
        else {
            url = "/views/profile.jsp";
        }
        return url;
    }

    private String deleteCookies(HttpServletRequest request,
                                 HttpServletResponse response) {

        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            cookie.setMaxAge(0); //delete the cookie
            cookie.setPath("/"); //allow the download application to access it
            response.addCookie(cookie);
        }
        String url = "/views/login.jsp";
        return url;
    }

//    private String registerUser(HttpServletRequest request,
//                                HttpServletResponse response) {
//
//        // get the user data
//        String email = request.getParameter("email");
//        String pass = request.getParameter("password");
//
//        // store the data in a User object
//        User user = new User();
//        user.setEmail(email);
//        user.setPassword(pass);
//
//        // write the User object to a file
//        UserDAO.insertUser(user);
//
//        // store the User object as a session attribute
//        HttpSession session = request.getSession();
//        session.setAttribute("user", user);
//
//        // add a cookie that stores the user's email as a cookie
//        Cookie c1 = new Cookie("emailCookie", email);
//        c1.setMaxAge(60 * 60 * 24 * 365 * 2); // set age to 2 years
//        c1.setPath("/");                      // allow entire app to access it
//        response.addCookie(c1);
//
//        // create and return a URL for the appropriate Download page
//        String url = "/views/profile.jsp";
//        return url;
//    }
//@Override
//public void doPost(HttpServletRequest request,
//                   HttpServletResponse response)
//        throws IOException, ServletException {
//
//    String action = request.getParameter("action");
//
//    HttpSession session=request.getSession();
//    String email = request.getParameter("email");
//    String pass = request.getParameter("password");
//    User user = UserDAO.login(email, pass);
//    String url ="/views/login.jsp";
//    if(user != null) {
//        url ="/views/profile.jsp";
//        session.setAttribute("user",user);
//
//        // add a cookie that stores the user's email as a cookie
//        Cookie c1 = new Cookie("emailCookie", email);
//        c1.setMaxAge(60 * 60 * 24 * 365 * 2); // set age to 2 years
//        c1.setPath("/");                      // allow entire app to access it
//        response.addCookie(c1);
//        request.getRequestDispatcher(url).forward(request, response);
//    }
//    else {
//        request.setAttribute("message", "Fail");
//        request.getRequestDispatcher(url).forward(request, response);
//    }
//}
}
