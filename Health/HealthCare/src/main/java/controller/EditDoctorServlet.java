package controller;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.DoctorDao;
import model.Doctor;

@WebServlet("/EditDoctorServlet")
public class EditDoctorServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int doctorId = Integer.parseInt(request.getParameter("id"));
        
        try {
            DoctorDao doctorDao = new DoctorDao();
            Doctor doctor = doctorDao.getDoctorById(doctorId);
            
            request.setAttribute("doctor", doctor);
            request.getRequestDispatcher("/view/editDoctor.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int doctorId = Integer.parseInt(request.getParameter("doctorId"));
        String name = request.getParameter("name");
        String specialization = request.getParameter("specialization");
        
        Doctor doctor = new Doctor();
        doctor.setDoctorId(doctorId);
        doctor.setName(name);
        doctor.setSpecialization(specialization);
        
        try {
            DoctorDao doctorDao = new DoctorDao();
            boolean success = doctorDao.updateDoctor(doctor);
            
            if (success) {
                request.getSession().setAttribute("message", "Doctor updated successfully");
            } else {
                request.getSession().setAttribute("error", "Failed to update doctor");
            }
            
            response.sendRedirect(request.getContextPath() + "/DoctorListServlet");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}