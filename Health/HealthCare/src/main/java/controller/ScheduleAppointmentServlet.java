package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dao.DoctorDao;
import model.User;
import model.Doctor;
import java.io.IOException;
import java.util.List;

@WebServlet("/ScheduleAppointmentServlet")
public class ScheduleAppointmentServlet extends HttpServlet {
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
            // Get list of all doctors for the dropdown
            DoctorDao doctorDao = new DoctorDao();
            List<Doctor> doctors = doctorDao.getAllDoctors();
            
            request.setAttribute("doctors", doctors);
            request.setAttribute("activePage", "make-appointment");
            request.getRequestDispatcher("/view/scheduleAppointment.jsp").forward(request, response);
            
        } catch (Exception e) {
            session.setAttribute("error", "Error loading appointment form: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/PatientDashboardServlet");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // This will be handled by AddAppointmentServlet which already exists
        response.sendRedirect(request.getContextPath() + "/AddAppointmentServlet");
    }
}