package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dao.AppointmentDao;
import dao.PatientDao;
import model.User;
import model.Appointment;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/PatientAppointmentsServlet")
public class PatientAppointmentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/view/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (!"patient".equals(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Only patients can access appointments");
            return;
        }

        try {
            // Get the patient ID from the logged-in user
            PatientDao patientDao = new PatientDao();
            int patientId = patientDao.getPatientByUserId(user.getId()).getPatientId();
            
            // Get all appointments for this patient
            AppointmentDao appointmentDao = new AppointmentDao();
            List<Appointment> appointments = appointmentDao.getPatientAppointments(patientId);
            
            request.setAttribute("appointments", appointments);
            request.setAttribute("activePage", "appointments");
            request.getRequestDispatcher("/view/patientAppointments.jsp").forward(request, response);
            
        } catch (SQLException e) {
            session.setAttribute("error", "Database error: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/PatientDashboardServlet");
        }
    }
}