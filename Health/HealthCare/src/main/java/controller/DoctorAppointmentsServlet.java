package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dao.AppointmentDao;
import dao.DoctorDao;
import model.User;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import model.Appointment;
import model.Doctor;

@WebServlet("/DoctorAppointmentsServlet")
public class DoctorAppointmentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/view/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (!"doctor".equals(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Only doctors can access this page");
            return;
        }

        try {
            AppointmentDao appointmentDao = new AppointmentDao();
            DoctorDao doctorDao = new DoctorDao();
            
            // Get the doctor record for this user
            Doctor doctor = doctorDao.getDoctorByUserId(user.getId());
            if (doctor == null) {
                session.setAttribute("error", "Doctor profile not found");
                response.sendRedirect(request.getContextPath() + "/DashboardServlet");
                return;
            }
            
            // Now use the doctor_id from doctors table
            List<Appointment> pendingAppointments = appointmentDao.getPendingAppointments(doctor.getDoctorId());
            List<Appointment> scheduledAppointments = appointmentDao.getDoctorAppointments(doctor.getDoctorId());
            
            request.setAttribute("pendingAppointments", pendingAppointments);
            request.setAttribute("scheduledAppointments", scheduledAppointments);
            request.setAttribute("activePage", "appointments");
            request.getRequestDispatcher("/view/doctorAppointments.jsp").forward(request, response);
            
        } catch (SQLException e) {
            session.setAttribute("error", "Database error: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/DashboardServlet");
        }
    }
}