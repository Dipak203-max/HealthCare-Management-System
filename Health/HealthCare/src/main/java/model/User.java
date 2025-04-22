package model;

public class User {
    private int id;
    private String username;
    private String password;
    private String role;
    
    // Constructors
    public User() {}
    
    public User(String username, String password, String role) {
        this.username = username;
        this.password = password;
        this.role = role;
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getRole() {
        return role;
    }
    
    public void setRole(String role) {
        this.role = role;
    }
    
    // Helper methods
    public boolean isAdmin() {
        return "admin".equals(this.role);
    }
    
    public String getRoleBadgeClass() {
        switch(this.role) {
            case "admin": return "badge-admin";
            case "doctor": return "badge-doctor";
            case "patient": return "badge-patient";
            default: return "badge-secondary";
        }
    }
}