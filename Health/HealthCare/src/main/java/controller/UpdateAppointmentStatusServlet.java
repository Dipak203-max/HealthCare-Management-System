package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dao.AppointmentDao;
import model.User;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/UpdateAppointmentStatusServlet")
public class UpdateAppointmentStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/view/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (!"doctor".equals(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Only doctors can update appointment status");
            return;
        }

        int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
        String status = request.getParameter("status").toUpperCase();

        try {
            AppointmentDao appointmentDao = new AppointmentDao();
            boolean success = appointmentDao.updateAppointmentStatus(appointmentId, status);
            
            if (success) {
                session.setAttribute("message", "Appointment status updated to " + status.toLowerCase());
            } else {
                session.setAttribute("error", "Failed to update appointment status");
            }
        } catch (SQLException e) {
            session.setAttribute("error", "Database error: " + e.getMessage());
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/DashboardServlet");
    }
}