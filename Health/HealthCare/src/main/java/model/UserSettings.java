package model;

public class UserSettings {
    private String currentUsername;
    private String newUsername;
    private String currentPassword;
    private String newPassword;
    private String confirmPassword;
    
    // Getters and Setters
    public String getCurrentUsername() {
        return currentUsername;
    }
    
    public void setCurrentUsername(String currentUsername) {
        this.currentUsername = currentUsername;
    }
    
    public String getNewUsername() {
        return newUsername;
    }
    
    public void setNewUsername(String newUsername) {
        this.newUsername = newUsername;
    }
    
    public String getCurrentPassword() {
        return currentPassword;
    }
    
    public void setCurrentPassword(String currentPassword) {
        this.currentPassword = currentPassword;
    }
    
    public String getNewPassword() {
        return newPassword;
    }
    
    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
    
    public String getConfirmPassword() {
        return confirmPassword;
    }
    
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
}