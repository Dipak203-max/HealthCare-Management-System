package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.DBUtil;

@WebServlet("/GenerateReportServlet")
public class GenerateReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Font styles for PDF
    private static final Font TITLE_FONT = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18);
    private static final Font HEADER_FONT = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);
    private static final Font NORMAL_FONT = FontFactory.getFont(FontFactory.HELVETICA, 12);
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int recordId = Integer.parseInt(request.getParameter("recordId"));
        
        try {
            // 1. Fetch the medical record from database
            MedicalRecord record = fetchMedicalRecord(recordId);
            
            if (record == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Medical record not found");
                return;
            }
            
            // 2. Generate PDF report
            response.setContentType("application/pdf");
            String fileName = "medical_report_" + recordId + "_" + 
                LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss")) + ".pdf";
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
            
            OutputStream out = response.getOutputStream();
            generatePdfReport(record, out);
            out.flush();
            out.close();
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error generating report");
        }
    }
    
    private MedicalRecord fetchMedicalRecord(int recordId) throws SQLException {
        String sql = "SELECT mr.*, p.name AS patient_name, d.name AS doctor_name " +
                     "FROM medical_records mr " +
                     "JOIN patients p ON mr.patient_id = p.patient_id " +
                     "JOIN doctors d ON mr.doctor_id = d.doctor_id " +
                     "WHERE mr.record_id = ?";
        
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setInt(1, recordId);
            
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    MedicalRecord record = new MedicalRecord();
                    record.setRecordId(resultSet.getInt("record_id"));
                    record.setPatientId(resultSet.getInt("patient_id"));
                    record.setDoctorId(resultSet.getInt("doctor_id"));
                    record.setDiagnosis(resultSet.getString("diagnosis"));
                    record.setTreatment(resultSet.getString("treatment"));
                    record.setCreatedAt(resultSet.getTimestamp("created_at"));
                    record.setPatientName(resultSet.getString("patient_name"));
                    record.setDoctorName(resultSet.getString("doctor_name"));
                    return record;
                }
            }
        }
        return null;
    }
    
    private void generatePdfReport(MedicalRecord record, OutputStream out) 
            throws DocumentException, IOException {
        
        Document document = new Document();
        PdfWriter.getInstance(document, out);
        document.open();
        
        // Add title
        Paragraph title = new Paragraph("MEDICAL RECORD REPORT", TITLE_FONT);
        title.setAlignment(Element.ALIGN_CENTER);
        title.setSpacingAfter(20f);
        document.add(title);
        
        // Add basic info table
        PdfPTable infoTable = new PdfPTable(2);
        infoTable.setWidthPercentage(100);
        infoTable.setSpacingBefore(10f);
        infoTable.setSpacingAfter(10f);
        
        addTableHeader(infoTable, "Field");
        addTableHeader(infoTable, "Value");
        
        addTableRow(infoTable, "Record ID", String.valueOf(record.getRecordId()));
        addTableRow(infoTable, "Patient", record.getPatientName());
        addTableRow(infoTable, "Doctor", "Dr. " + record.getDoctorName());
        addTableRow(infoTable, "Date", record.getCreatedAt().toString());
        
        document.add(infoTable);
        
        // Add diagnosis section
        Paragraph diagnosisTitle = new Paragraph("DIAGNOSIS", HEADER_FONT);
        diagnosisTitle.setSpacingBefore(15f);
        diagnosisTitle.setSpacingAfter(5f);
        document.add(diagnosisTitle);
        
        Paragraph diagnosisContent = new Paragraph(record.getDiagnosis(), NORMAL_FONT);
        diagnosisContent.setSpacingAfter(15f);
        document.add(diagnosisContent);
        
        // Add treatment section
        Paragraph treatmentTitle = new Paragraph("TREATMENT", HEADER_FONT);
        treatmentTitle.setSpacingAfter(5f);
        document.add(treatmentTitle);
        
        Paragraph treatmentContent = new Paragraph(record.getTreatment(), NORMAL_FONT);
        document.add(treatmentContent);
        
        // Add footer
        Paragraph footer = new Paragraph("\n\nGenerated on: " + 
            LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")), 
            FontFactory.getFont(FontFactory.HELVETICA_OBLIQUE, 10));
        footer.setAlignment(Element.ALIGN_RIGHT);
        document.add(footer);
        
        document.close();
    }
    
    private void addTableHeader(PdfPTable table, String header) {
        PdfPCell cell = new PdfPCell();
        cell.setPhrase(new Phrase(header, HEADER_FONT));
        table.addCell(cell);
    }
    
    private void addTableRow(PdfPTable table, String label, String value) {
        table.addCell(new Phrase(label, NORMAL_FONT));
        table.addCell(new Phrase(value, NORMAL_FONT));
    }
    
    // Inner class for medical record data
    private static class MedicalRecord {
        private int recordId;
        private int patientId;
        private int doctorId;
        private String diagnosis;
        private String treatment;
        private Timestamp createdAt;
        private String patientName;
        private String doctorName;
        
        // Getters and setters
        public int getRecordId() { return recordId; }
        public void setRecordId(int recordId) { this.recordId = recordId; }
        public int getPatientId() { return patientId; }
        public void setPatientId(int patientId) { this.patientId = patientId; }
        public int getDoctorId() { return doctorId; }
        public void setDoctorId(int doctorId) { this.doctorId = doctorId; }
        public String getDiagnosis() { return diagnosis; }
        public void setDiagnosis(String diagnosis) { this.diagnosis = diagnosis; }
        public String getTreatment() { return treatment; }
        public void setTreatment(String treatment) { this.treatment = treatment; }
        public Timestamp getCreatedAt() { return createdAt; }
        public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
        public String getPatientName() { return patientName; }
        public void setPatientName(String patientName) { this.patientName = patientName; }
        public String getDoctorName() { return doctorName; }
        public void setDoctorName(String doctorName) { this.doctorName = doctorName; }
    }
}