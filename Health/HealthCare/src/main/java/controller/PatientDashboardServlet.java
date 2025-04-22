package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dao.AppointmentDao;
import model.User;
import model.Appointment;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/PatientDashboardServlet")
public class PatientDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/view/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (!"patient".equals(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Only patients can access this page");
            return;
        }

        try {
            AppointmentDao appointmentDao = new AppointmentDao();
            
            // Get upcoming appointments count
            int upcomingCount = appointmentDao.getUpcomingPatientAppointmentsCount(user.getId());
            
            // Get upcoming appointments with details
            List<Appointment> upcomingAppointments = appointmentDao.getDoctorAppointmentsWithDetails(user.getId());
            
            request.setAttribute("upcomingAppointmentsCount", upcomingCount);
            request.setAttribute("upcomingAppointments", upcomingAppointments);
            request.setAttribute("activePage", "dashboard");
            request.getRequestDispatcher("/view/patientDashboard.jsp").forward(request, response);
            
        } catch (SQLException e) {
            session.setAttribute("error", "Database error: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/view/login.jsp");
        }
    }
}