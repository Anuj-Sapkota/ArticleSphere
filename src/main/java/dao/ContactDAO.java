package dao;

import model.Contact;
import java.sql.*;
import utils.DatabaseUtil;


public class ContactDAO {
    private static final String INSERT_SQL = "INSERT INTO contactmessage (messageContent, submittedAt, userId) VALUES (?, ?, ?)";

    public static void saveMessage(Contact contact) {
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(INSERT_SQL)) {
            stmt.setString(1, contact.getMessageContent());
            stmt.setTimestamp(2, Timestamp.valueOf(contact.getSubmittedAt()));
            stmt.setInt(3, contact.getUserId());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
