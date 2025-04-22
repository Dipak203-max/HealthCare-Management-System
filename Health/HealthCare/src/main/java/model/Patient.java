package model;

public class Patient {
    private int patientId;
    private int userId;
    private String name;
    private String phone;
    
    public Patient() {}
    
    public Patient(int patientId, int userId, String name, String phone) {
        this.patientId = patientId;
        this.userId = userId;
        this.name = name;
        this.phone = phone;
    }
    
    // Getters and Setters
    public int getPatientId() {
        return patientId;
    }
    
    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }
    
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getPhone() {
        return phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
}