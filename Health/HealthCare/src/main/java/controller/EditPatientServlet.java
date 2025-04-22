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

@WebServlet("/EditPatientServlet")
public class EditPatientServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int patientId = Integer.parseInt(request.getParameter("id"));
        
        try {
            PatientDao patientDao = new PatientDao();
            Patient patient = patientDao.getPatientById(patientId);
            
            request.setAttribute("patient", patient);
            request.getRequestDispatcher("/view/editPatient.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int patientId = Integer.parseInt(request.getParameter("patientId"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        
        Patient patient = new Patient();
        patient.setPatientId(patientId);
        patient.setName(name);
        patient.setPhone(phone);
        
        try {
            PatientDao patientDao = new PatientDao();
            boolean success = patientDao.updatePatient(patient);
            
            if (success) {
                request.getSession().setAttribute("message", "Patient updated successfully");
            } else {
                request.getSession().setAttribute("error", "Failed to update patient");
            }
            
            response.sendRedirect(request.getContextPath() + "/PatientListServlet");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}