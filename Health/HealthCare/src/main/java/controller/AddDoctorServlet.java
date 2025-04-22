package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Doctor;

import java.io.IOException;
import java.sql.SQLException;

import dao.DoctorDao;

/**
 * Servlet implementation class AddDoctorServlet
 */
//AddDoctorServlet.java
@WebServlet("/AddDoctorServlet")
public class AddDoctorServlet extends HttpServlet {
 protected void doPost(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {
     
     String name = request.getParameter("name");
     String specialization = request.getParameter("specialization");
     String password = request.getParameter("password");
     
     Doctor doctor = new Doctor();
     doctor.setName(name);
     doctor.setSpecialization(specialization);
     
     DoctorDao doctorDao = new DoctorDao();
     try {
         boolean success = doctorDao.addDoctor(doctor, password);
         if (success) {
             request.setAttribute("message", "Doctor added successfully");
         } else {
             request.setAttribute("error", "Failed to add doctor");
         }
     } catch (SQLException e) {
         request.setAttribute("error", "Database error: " + e.getMessage());
     }
     
     request.getRequestDispatcher("/view/doctorList.jsp").forward(request, response);
 }
}
