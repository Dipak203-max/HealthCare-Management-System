package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import model.User;
import java.io.IOException;

import dao.UserDao;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {
    
    public void init(FilterConfig fConfig) throws ServletException {}
    
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
            throws IOException, ServletException {
        
    	HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();
        
        HttpSession session = req.getSession(false);
        
        boolean loginRequest = uri.endsWith("login.jsp") || uri.endsWith("LoginServlet");
        boolean resourceRequest = uri.contains("/css/") || uri.contains("/js/") || 
                                uri.contains("/images/") || uri.contains("/assets/");
        boolean indexRequest = uri.endsWith("index.jsp") || uri.equals(contextPath + "/");
        boolean registerRequest = uri.endsWith("register.jsp") || uri.endsWith("RegisterPatientServlet");
        boolean passwordResetRequest = uri.endsWith("forgotPassword.jsp") || uri.endsWith("PasswordResetServlet");
        
        if (loginRequest || resourceRequest || indexRequest || registerRequest || passwordResetRequest) {
            chain.doFilter(request, response);
            return;
        }
        
        // Check if user is logged in via session
        if (session == null || session.getAttribute("user") == null) {
        	
            // Check for remember me cookies
            Cookie[] cookies = req.getCookies();
            String username = null;
            String role = null;
            
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("username".equals(cookie.getName())) {
                        username = cookie.getValue();
                    } else if ("role".equals(cookie.getName())) {
                        role = cookie.getValue();
                    }
                }
            }
            
            if (username != null && role != null) {
                // Auto-login with cookies
                UserDao userDao = new UserDao();
                User user = userDao.getUserByUsernameAndRole(username, role);
                
                if (user != null) {
                    HttpSession newSession = req.getSession();
                    newSession.setAttribute("user", user);
                    chain.doFilter(request, response);
                    return;
                }
            }
            
            res.sendRedirect(contextPath + "/LoginServlet");
            return;
        }
        
        // Get user role for authorization check
        User user = (User) session.getAttribute("user");
        String role = user.getRole();
        
        // Role-based access control
        if (isAccessDenied(uri, role)) {
            res.sendError(HttpServletResponse.SC_FORBIDDEN, "You don't have permission to access this page");
            return;
        }
        
        // Proceed with the request
        chain.doFilter(request, response);
    }
    
    private boolean isAccessDenied(String uri, String role) {
    	
        // Admin has access to everything except specific patient/doctor pages
        if ("admin".equals(role)) {
            return uri.contains("/patient/") && !uri.contains("PatientManagement") || 
                   uri.contains("/doctor/") && !uri.contains("DoctorManagement");
        }
        
        // Doctor-specific restrictions
        if ("doctor".equals(role)) {
            return uri.contains("/admin/") || 
                   uri.contains("/patient/") && !uri.contains("/patient/profile");
        }
        
        // Patient-specific restrictions
        if ("patient".equals(role)) {
            return uri.contains("/admin/") || 
                   uri.contains("/doctor/") || 
                   uri.contains("Management");
        }
        
        // Default deny for unknown roles
        return true;
    }
    
    public void destroy() {}
}