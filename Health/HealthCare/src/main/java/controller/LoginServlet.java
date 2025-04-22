package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.UserDao;
import model.User;
import util.PropertyUtil;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public void init() throws ServletException {
        System.out.println(getClass().getSimpleName() + " initialized");
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Check for remember me cookies
        String username = null;
        String role = null;
        Cookie[] cookies = req.getCookies();
        
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("username".equals(cookie.getName())) {
                    username = cookie.getValue();
                }
                // Note: Removed role cookie for security reasons
            }
        }
        
        if (username != null) {
            req.setAttribute("rememberedUsername", username);
        }
        req.getRequestDispatcher("/view/login.jsp").forward(req, resp);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String rememberMe = request.getParameter("rememberMe");
        
        UserDao userDao = new UserDao();
        User user = userDao.getUserByCredentials(username, password, role);
        
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            if ("on".equals(rememberMe)) {
                Cookie usernameCookie = new Cookie("username", username);
                usernameCookie.setMaxAge(30 * 24 * 60 * 60); // 30 days
                usernameCookie.setHttpOnly(true);
                usernameCookie.setSecure(true); // Only send over HTTPS
                usernameCookie.setPath("/");
                response.addCookie(usernameCookie);
            } else {
                // Clear cookies if "Remember Me" was not checked
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if ("username".equals(cookie.getName())) {
                            cookie.setMaxAge(0);
                            cookie.setPath("/");
                            response.addCookie(cookie);
                        }
                    }
                }
            }
            
            String redirectPage;
            switch(user.getRole().toLowerCase()) {
                case "admin":
                    redirectPage = "/view/adminDashboard.jsp";
                    break;
                case "doctor":
                    redirectPage = "/view/doctorDashboard.jsp";
                    break;
                case "patient":
                    redirectPage = "/view/patientDashboard.jsp";
                    break;
                default:
                    redirectPage = "/view/error.jsp";
            }
            
            response.sendRedirect(request.getContextPath() + redirectPage);
        } else {
            request.setAttribute("errorMessage", "Invalid username or password");
            request.getRequestDispatcher("/view/login.jsp").forward(request, response);
        }
    }
}