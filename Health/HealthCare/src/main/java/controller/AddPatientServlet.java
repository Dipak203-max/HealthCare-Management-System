package controller;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.PatientDao;
import model.Patient;

@WebServlet("/AddPatientServlet")
public class AddPatientServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password"); // Get password from form
        
        Patient patient = new Patient();
        patient.setName(name);
        patient.setPhone(phone);
        
        PatientDao patientDao = new PatientDao();
        try {
            boolean success = patientDao.addPatient(patient, password);
            if (success) {
                request.setAttribute("message", "Patient added successfully");
            } else {
                request.setAttribute("error", "Failed to add patient");
            }
        } catch (SQLException e) {
            request.setAttribute("error", "Database error: " + e.getMessage());
        }
        
        response.sendRedirect(request.getContextPath() + "/PatientListServlet");
    }
}