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

@WebServlet("/CancelAppointmentServlet")
public class CancelAppointmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/view/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (!"patient".equals(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Only patients can cancel appointments");
            return;
        }

        int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
        
        try {
            AppointmentDao appointmentDao = new AppointmentDao();
            boolean success = appointmentDao.updateAppointmentStatus(appointmentId, "CANCELLED");
            
            if (success) {
                session.setAttribute("message", "Appointment cancelled successfully");
            } else {
                session.setAttribute("error", "Failed to cancel appointment");
            }
        } catch (SQLException e) {
            session.setAttribute("error", "Database error: " + e.getMessage());
        }

        response.sendRedirect(request.getContextPath() + "/PatientAppointmentsServlet");
    }
}