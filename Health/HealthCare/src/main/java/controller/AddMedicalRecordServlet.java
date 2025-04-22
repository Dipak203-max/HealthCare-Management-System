package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dao.AppointmentDao;
import dao.MedicalRecordDao;
import model.User;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/AddMedicalRecordServlet")
public class AddMedicalRecordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/view/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (!"doctor".equals(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Only doctors can add medical records");
            return;
        }

        int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
        int patientId = Integer.parseInt(request.getParameter("patientId"));
        int doctorId = user.getId();
        String diagnosis = request.getParameter("diagnosis");
        String treatment = request.getParameter("treatment");

        try {
            MedicalRecordDao recordDao = new MedicalRecordDao();
            boolean success = recordDao.addMedicalRecord(patientId, doctorId, diagnosis, treatment);
            
            if (success) {
                // Update appointment status to completed
                AppointmentDao appointmentDao = new AppointmentDao();
                appointmentDao.updateAppointmentStatus(appointmentId, "COMPLETED");
                
                session.setAttribute("message", "Medical record added successfully");
            } else {
                session.setAttribute("error", "Failed to add medical record");
            }
        } catch (SQLException e) {
            session.setAttribute("error", "Database error: " + e.getMessage());
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/DashboardServlet");
    }
}