package controller;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.DoctorDao;
import dao.PatientDao;

@WebServlet("/LoadAppointmentFormDataServlet")
public class LoadAppointmentFormDataServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            DoctorDao doctorDao = new DoctorDao();
            PatientDao patientDao = new PatientDao();
            
            request.setAttribute("doctors", doctorDao.getAllDoctors());
            request.setAttribute("patients", patientDao.getAllPatients());
            
            request.getRequestDispatcher("/view/appointmentForm.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}