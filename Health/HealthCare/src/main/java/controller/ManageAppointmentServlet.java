package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dao.AppointmentDao;
import dao.DoctorDao;
import model.Appointment;
import model.Doctor;
import model.User;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/ManageAppointmentServlet")
public class ManageAppointmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/view/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (!"doctor".equals(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Only doctors can perform this action");
            return;
        }

        try {
            int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
            String action = request.getParameter("action");
            
            AppointmentDao appointmentDao = new AppointmentDao();
            DoctorDao doctorDao = new DoctorDao();
            
            // Get the doctor record for this user
            Doctor doctor = doctorDao.getDoctorByUserId(user.getId());
            if (doctor == null) {
                session.setAttribute("error", "Doctor profile not found");
                response.sendRedirect(request.getContextPath() + "/DashboardServlet");
                return;
            }
            
            // Get the appointment and verify ownership
            Appointment appointment = appointmentDao.getAppointmentById(appointmentId);
            if (appointment == null || appointment.getDoctorId() != doctor.getDoctorId()) {
                session.setAttribute("error", "You can only manage your own appointments");
                response.sendRedirect(request.getContextPath() + "/DoctorAppointmentsServlet");
                return;
            }
            
            // Update the status
            String newStatus = "scheduled".equals(action) ? "scheduled" : "rejected";
            boolean success = appointmentDao.updateAppointmentStatus(appointmentId, newStatus);
            
            if (success) {
                session.setAttribute("message", "Appointment " + ("scheduled".equals(action) ? "accepted" : "rejected") + " successfully");
            } else {
                session.setAttribute("error", "Failed to update appointment status");
            }
            
        } catch (Exception e) {
            session.setAttribute("error", "Error managing appointment: " + e.getMessage());
        }
        
        response.sendRedirect(request.getContextPath() + "/DoctorAppointmentsServlet");
    }
}