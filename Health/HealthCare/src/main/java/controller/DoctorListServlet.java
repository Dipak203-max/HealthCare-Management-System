package controller;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.DoctorDao;
import model.Doctor;

@WebServlet("/DoctorListServlet")
public class DoctorListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        DoctorDao doctorDao = new DoctorDao();
        List<Doctor> doctors = doctorDao.getAllDoctors();
        
        request.setAttribute("doctors", doctors);
        request.getRequestDispatcher("/view/doctorList.jsp").forward(request, response);
    }
}