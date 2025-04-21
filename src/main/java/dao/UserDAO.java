package dao;

import utils.DatabaseUtil;
import org.mindrot.jbcrypt.BCrypt;
import java.sql.*;
import java.time.LocalDateTime;
import model.User;

public class UserDAO {

    public static int registerUser(User user) throws SQLException {
        int generatedId = -1;
        String query = "INSERT INTO user (firstName, lastName, email, password, createdAt, bio, profilePicture) VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        // Password hashing for security
        String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement pst = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            pst.setString(1, user.getFirstName());
            pst.setString(2, user.getLastName());
            pst.setString(3, user.getEmail());
            pst.setString(4, hashedPassword);
            pst.setObject(5, user.getCreatedAt());
            pst.setString(6, user.getBio());
            pst.setString(7, user.getProfilePicture());
            int affectedRows = pst.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating user failed!");
            }
            try (ResultSet rs = pst.getGeneratedKeys()) {
                if (rs.next()) {
                    generatedId = rs.getInt(1);
                } else {
                    throw new SQLException("Creating user failed, no ID obtained.");
                }
            }
        }
        return generatedId;
    }

    public User loginUser(String email, String password) throws SQLException {
        String query = "SELECT * FROM user WHERE email = ?";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement pst = connection.prepareStatement(query)) {
            pst.setString(1, email);
            
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    String storedHashPw = rs.getString("password");
                    if (BCrypt.checkpw(password, storedHashPw)) {
                        return new User(
                            rs.getInt("userId"),
                            rs.getString("firstName"),
                            rs.getString("lastName"),
                            rs.getString("email"),
                            storedHashPw,
                            rs.getString("role"),
                            rs.getObject("createdAt", LocalDateTime.class),
                            rs.getString("bio"),
                            rs.getString("profilePicture")
                        );
                    }
                }
            }
        }
        return null;
    }

    public User getUserById(int userId) throws SQLException {
        String query = "SELECT * FROM user WHERE userId = ?";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement pst = connection.prepareStatement(query)) {
            pst.setInt(1, userId);
            
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    return new User(
                        rs.getInt("userId"),
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("role"),
                        rs.getObject("createdAt", LocalDateTime.class),
                        rs.getString("bio"),
                        rs.getString("profilePicture")
                    );
                }
            }
        }
        return null;
    }
}