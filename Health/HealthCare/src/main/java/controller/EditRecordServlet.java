package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dao.MedicalRecordDao;
import model.User;
import model.MedicalRecord;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/EditRecordServlet")
public class EditRecordServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/view/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (!"doctor".equals(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Only doctors can edit records");
            return;
        }

        int recordId = Integer.parseInt(request.getParameter("recordId"));
        
        try {
            MedicalRecordDao recordDao = new MedicalRecordDao();
            MedicalRecord record = recordDao.getMedicalRecordById(recordId);
            
            if (record != null) {
                request.setAttribute("record", record);
                request.getRequestDispatcher("/view/editRecord.jsp").forward(request, response);
            } else {
                session.setAttribute("error", "Record not found");
                response.sendRedirect(request.getContextPath() + "/PatientRecordsServlet");
            }
        } catch (SQLException e) {
            session.setAttribute("error", "Database error: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/PatientRecordsServlet");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/view/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (!"doctor".equals(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Only doctors can edit records");
            return;
        }

        int recordId = Integer.parseInt(request.getParameter("recordId"));
        String diagnosis = request.getParameter("diagnosis");
        String treatment = request.getParameter("treatment");
        
        try {
            MedicalRecordDao recordDao = new MedicalRecordDao();
            boolean success = recordDao.updateMedicalRecord(recordId, diagnosis, treatment);
            
            if (success) {
                session.setAttribute("message", "Record updated successfully");
            } else {
                session.setAttribute("error", "Failed to update record");
            }
            response.sendRedirect(request.getContextPath() + "/PatientRecordsServlet");
        } catch (SQLException e) {
            session.setAttribute("error", "Database error: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/PatientRecordsServlet");
        }
    }
}