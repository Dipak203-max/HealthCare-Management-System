package controller;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.MedicalRecordDao;
import model.MedicalRecord;

@WebServlet("/MedicalRecordListServlet")
public class MedicalRecordListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        MedicalRecordDao recordDao = new MedicalRecordDao();
        List<MedicalRecord> records = recordDao.getAllMedicalRecords();
        
        request.setAttribute("records", records);
        request.getRequestDispatcher("/view/medicalRecordList.jsp").forward(request, response);
    }
}