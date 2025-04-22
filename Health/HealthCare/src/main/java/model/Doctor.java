package model;

public class Doctor {
    private int doctorId;
    private int userId;
    private String name;
    private String specialization;
    
    public Doctor() {}
    
    public Doctor(int doctorId, int userId, String name, String specialization) {
        this.doctorId = doctorId;
        this.userId = userId;
        this.name = name;
        this.specialization = specialization;
    }
    
    // Getters and Setters
    public int getDoctorId() {
        return doctorId;
    }
    
    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
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
    
    public String getSpecialization() {
        return specialization;
    }
    
    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }
}