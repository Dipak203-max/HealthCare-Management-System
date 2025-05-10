package controller;

// Import required Java and Jakarta Servlet packages
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.PatientDao;   // DAO class to handle database operations for patients
import model.Patient;    // Patient model class

// Define servlet URL mapping
@WebServlet("/PatientListServlet")
public class PatientListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;  // Version ID for serialization

    // Handles HTTP GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Create an instance of PatientDao to access patient data
        PatientDao patientDao = new PatientDao();
        
        // Retrieve the list of all patients from the database
        List<Patient> patients = patientDao.getAllPatients();
        
        // Set the list of patients as a request attribute to be accessed in JSP
        request.setAttribute("patients", patients);
        
        // Forward the request to the JSP page to display the patient list
        request.getRequestDispatcher("/view/patientList.jsp").forward(request, response);
    }
}
