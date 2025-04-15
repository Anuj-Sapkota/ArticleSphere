package model;

import java.time.LocalDateTime;

public class Comment 
{
	private int commentId;
	private String content;
	private LocalDateTime commentDate;
	private int userId;
	private int atricleId;
	//Constructor without the Id for data that will be sent to database
	public Comment(String content, LocalDateTime commentDate, int userId, int atricleId) {
		super();
		this.content = content;
		this.commentDate = commentDate;
		this.userId = userId;
		this.atricleId = atricleId;
	}
	// Constructor with id that will be retrieved from the database
	public Comment(int commentId, String content, LocalDateTime commentDate, int userId, int atricleId) {
		super();
		this.commentId = commentId;
		this.content = content;
		this.commentDate = commentDate;
		this.userId = userId;
		this.atricleId = atricleId;
	}
	//getters and setters methods
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public LocalDateTime getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(LocalDateTime commentDate) {
		this.commentDate = commentDate;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getAtricleId() {
		return atricleId;
	}
	public void setAtricleId(int atricleId) {
		this.atricleId = atricleId;
	}
	
	
	
}