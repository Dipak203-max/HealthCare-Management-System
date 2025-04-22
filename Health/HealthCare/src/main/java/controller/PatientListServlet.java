package controller;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.PatientDao;
import model.Patient;

@WebServlet("/PatientListServlet")
public class PatientListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        PatientDao patientDao = new PatientDao();
        List<Patient> patients = patientDao.getAllPatients();
        
        request.setAttribute("patients", patients);
        request.getRequestDispatcher("/view/patientList.jsp").forward(request, response);
    }
}