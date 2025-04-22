package controller;

import java.io.IOException;
import java.sql.SQLException;

import dao.PatientDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeletePatientServlet")
public class DeletePatientServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int patientId = Integer.parseInt(request.getParameter("id"));
        
        try {
            boolean success = new PatientDao().deletePatient(patientId);
            
            if (success) {
                request.getSession().setAttribute("message", "Patient deleted successfully");
            } else {
                request.getSession().setAttribute("error", "Failed to delete patient");
            }
        } catch (SQLException e) {
            request.getSession().setAttribute("error", 
                "Cannot delete patient: " + e.getMessage() + 
                ". The patient may have associated appointments or medical records.");
        }
        
        response.sendRedirect(request.getContextPath() + "/PatientListServlet");
    }
}