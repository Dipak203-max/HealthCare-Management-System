package controller;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.DoctorDao;

@WebServlet("/DeleteDoctorServlet")
public class DeleteDoctorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int doctorId = Integer.parseInt(request.getParameter("id"));
        
        try {
            DoctorDao doctorDao = new DoctorDao();
            boolean success = doctorDao.deleteDoctor(doctorId);
            
            if (success) {
                request.getSession().setAttribute("message", "Doctor deleted successfully");
            } else {
                request.getSession().setAttribute("error", "Failed to delete doctor");
            }
        } catch (SQLException e) {
            request.getSession().setAttribute("error", 
                "Cannot delete doctor: " + e.getMessage() + 
                ". The doctor may have associated appointments or medical records.");
        }
        
        response.sendRedirect(request.getContextPath() + "/DoctorListServlet");
    }
}