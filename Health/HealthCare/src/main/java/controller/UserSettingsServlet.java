package controller;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.UserSettingsDao;
import model.User;

@WebServlet("/UserSettingsServlet")
public class UserSettingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/view/login.jsp");
            return;
        }

        request.getRequestDispatcher("/view/userSettings.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/view/login.jsp");
            return;
        }

        String action = request.getParameter("action");
        UserSettingsDao settingsDao = new UserSettingsDao();
        String errorMessage = null;
        String successMessage = null;

        try {
            if ("updatePassword".equals(action)) {
                String currentPassword = request.getParameter("currentPassword");
                String newPassword = request.getParameter("newPassword");
                String confirmPassword = request.getParameter("confirmPassword");

                if (newPassword == null || newPassword.trim().isEmpty()) {
                    errorMessage = "New password cannot be empty.";
                } else if (!newPassword.equals(confirmPassword)) {
                    errorMessage = "New passwords do not match.";
                } else {
                    String storedPassword = settingsDao.getStoredPassword(user.getId());

                    if (storedPassword == null || storedPassword.trim().isEmpty()) {
                        errorMessage = "Unable to fetch current password. Please contact support.";
                    } else if (!settingsDao.verifyCurrentPassword(user.getId(), currentPassword)) {
                        errorMessage = "Current password is incorrect.";
                    } else {
                        boolean success = settingsDao.updatePassword(user.getId(), newPassword);
                        successMessage = success ? "Password updated successfully!" : "Failed to update password.";
                    }
                }
            }
        } catch (SQLException e) {
            errorMessage = "Database error: " + e.getMessage();
            e.printStackTrace();
        }

        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
        }
        if (successMessage != null) {
            request.setAttribute("successMessage", successMessage);
        }
        System.out.println("DEBUG: Logged in user ID = " + user.getId());


        doGet(request, response); // Reload settings page with message
    }
}
