package dao;
import org.mindrot.jbcrypt.BCrypt;
import java.sql.*;
import java.time.LocalDateTime;

import model.User;

public class UserDAO 
{
	
	
	// database connection parameters
	private static final String URL = "jdbc:mysql://localhost:3306/articlesphere";
	private static final String USER = "root";
	private static final String PASSWORD = "";
	static 
	{
		//load the MYSql JDBC driver
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch(ClassNotFoundException e)
		{
			throw new RuntimeException("Failed to load MySQL driver", e);
		}
	}
	
	public static Connection getConnection(String url, String user, String password) throws SQLException
	{
		return DriverManager.getConnection(url, user, password);
	}
	public static int registerUser(User user) throws SQLException 
	{
		int generatedId = -1;
		String query = "INSERT INTO User (firstName, lastName, email, password, createdAt, bio, profilePicture) VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		// password hashing for security
		String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		try(Connection connection = getConnection(URL, USER, PASSWORD);
			PreparedStatement pst = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);) 
		{
			pst.setString(1, user.getFirstName());
			pst.setString(2, user.getLastName());
			pst.setString(3, user.getEmail());
			pst.setString(4, hashedPassword);
			pst.setObject(5, user.getCreatedAt());
			pst.setString(6, user.getBio());
			pst.setString(7,  user.getProfilePicture());
			int affectedRows = pst.executeUpdate();
			if (affectedRows == 0)
			{
				throw new SQLException("Creating user failed!");
			}
			try(ResultSet rs = pst.getGeneratedKeys())
			{
				if (rs.next())
				{
					generatedId = rs.getInt(1);
				}
				else 
				{
					throw new SQLException("Creating user failed, no ID obtained.");
				}
			}
			
		}
		return generatedId;
	}
	
	public User loginUser(String email, String password) throws SQLException
	{
		String query = "SELECT * FROM User WHERE email = ?";
		try(Connection connection = getConnection(URL, USER, PASSWORD);
			PreparedStatement pst = connection.prepareStatement(query))
		{
			pst.setString(1, email);
			
			try(ResultSet rs = pst.executeQuery())
			{
				if(rs.next())
				{
				String storedHashPw = rs.getString("password");
				if(BCrypt.checkpw(password, storedHashPw))
				{
					return new User
							(rs.getInt("userId"),
							 rs.getString("firstName"),
							 rs.getString("lastName"),
							 rs.getString("email"),
							 storedHashPw,
							 rs.getString("role"),
		                     rs.getObject("created_at", LocalDateTime.class),
		                     rs.getString("bio"),
		                     rs.getString("profile_picture")
									);
				}
				}
			}
		}
		return null;
	}
}