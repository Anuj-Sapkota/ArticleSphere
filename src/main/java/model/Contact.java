package model;

import java.time.LocalDateTime;

public class Contact
{
	private int messageId;
	private String messageContent;
	private LocalDateTime submittedAt;
	private int userId;
	public Contact(String messageContent, LocalDateTime submittedAt, int userId) {
		super();
		this.messageContent = messageContent;
		this.submittedAt = submittedAt;
		this.userId = userId;
	}
	public Contact(int messageId, String messageContent, LocalDateTime submittedAt, int userId) {
		super();
		this.messageId = messageId;
		this.messageContent = messageContent;
		this.submittedAt = submittedAt;
		this.userId = userId;
	}
	public int getMessageId() {
		return messageId;
	}
	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public LocalDateTime getSubmittedAt() {
		return submittedAt;
	}
	public void setSubmittedAt(LocalDateTime submittedAt) {
		this.submittedAt = submittedAt;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
	
	
}