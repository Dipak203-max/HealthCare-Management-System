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
import java.util.List;
import model.Appointment;

@WebServlet("/DoctorScheduleServlet")
public class DoctorScheduleServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/view/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (!"doctor".equals(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Only doctors can access schedule");
            return;
        }

        try {
            AppointmentDao appointmentDao = new AppointmentDao();
            List<Appointment> schedule = appointmentDao.getDoctorSchedule(user.getId());
            
            request.setAttribute("schedule", schedule);
            request.setAttribute("activePage", "schedule");
            request.getRequestDispatcher("/view/doctorSchedule.jsp").forward(request, response);
            
        } catch (SQLException e) {
            session.setAttribute("error", "Database error: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/DashboardServlet");
        }
    }
}