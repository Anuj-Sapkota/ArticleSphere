package model;
import java.time.LocalDateTime;

public class User
{
	private int userId;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private String role;
	private LocalDateTime createdAt;
	private String bio;
	private String profilePicture;
	// This is the constructor without the user_id 
	public User(String firstName, String lastName, String email, String password, String role, LocalDateTime createdAt,
			String bio, String profilePicture) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.role = "user";
		this.createdAt = createdAt;
		this.bio = bio;
		this.profilePicture = profilePicture;
	}
	// This is the constructor with the user_id
	public User(int userId, String firstName, String lastName, String email, String password, String role,
			LocalDateTime createdAt, String bio, String profilePicture) {
		super();
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.role = role;
		this.createdAt = createdAt;
		this.bio = bio;
		this.profilePicture = profilePicture;
	}

	// getter and setter methods
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
	public String getProfilePicture() {
		return profilePicture;
	}
	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}
}