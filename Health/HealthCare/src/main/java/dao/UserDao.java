package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.PasswordResetDTO;
import model.User;
import util.DBUtil;
import util.HashUtil;

public class UserDao {
	
	public User getUserByCredentials(String username, String password, String role) {
        User user = null;
        String sql = "SELECT * FROM users WHERE username= ? AND role = ?";
        
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement prepareStatement = connection.prepareStatement(sql)) {

            prepareStatement.setString(1, username);
            prepareStatement.setString(2, role);
            
            try (ResultSet resultSet = prepareStatement.executeQuery()) {
                if (resultSet.next()) {
                    String storedHash = resultSet.getString("password");
                    if (HashUtil.verifyPassword(password, storedHash)) {
                        user = new User();
                        user.setId(resultSet.getInt("id"));
                        user.setUsername(resultSet.getString("username"));
                        user.setPassword(storedHash); // Store the hash, not the plain password
                        user.setRole(resultSet.getString("role"));
                    }
                }
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        }
        return user;
    }
    
    public boolean resetUserPassword(int userId, String newPassword) throws SQLException {
        String hashedPassword = HashUtil.hashPassword(newPassword);
        String sql = "UPDATE users SET password = ? WHERE id = ?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, hashedPassword);
            statement.setInt(2, userId);
            return statement.executeUpdate() > 0;
        }
    }
	
	
	
    
    public List<PasswordResetDTO> getAllUsersForPasswordReset() throws SQLException {
        List<PasswordResetDTO> users = new ArrayList<>();
        String sql = "SELECT id, username, role FROM users ORDER BY username";
        
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            
            while (resultSet.next()) {
                PasswordResetDTO user = new PasswordResetDTO();
                user.setUserId(resultSet.getInt("id"));
                user.setUsername(resultSet.getString("username"));
                user.setRole(resultSet.getString("role"));
                users.add(user);
            }
        }
        return users;
    }
    
    public User getUserByUsernameAndRole(String username, String role) {
        User user = null;
        String sql = "SELECT * FROM users WHERE username = ? AND role = ?";
        
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement prepareStatement = connection.prepareStatement(sql)) {

            prepareStatement.setString(1, username);
            prepareStatement.setString(2, role);
            
            try (ResultSet resultSet = prepareStatement.executeQuery()) {
                if (resultSet.next()) {
                    user = new User();
                    user.setId(resultSet.getInt("id"));
                    user.setUsername(resultSet.getString("username"));
                    user.setPassword(resultSet.getString("password"));
                    user.setRole(resultSet.getString("role"));
                }
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        }
        return user;
    }


}
