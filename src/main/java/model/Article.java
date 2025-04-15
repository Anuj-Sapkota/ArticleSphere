package model;

import java.time.LocalDateTime;

public class Article
{
	private int articleId;
	private String title;
	private String content;
	private int authorId;
	private LocalDateTime publishDate;
	private int category_id;
	//Constructor without the Id for data that will be sent to database
	public Article(String title, String content, int authorId, LocalDateTime publishDate,
			int category_id) {
		super();
		this.title = title;
		this.content = content;
		this.authorId = authorId;
		this.publishDate = publishDate;
		this.category_id = category_id;
	}
	// Constructor with id that will be retrieved from the database
	public Article(int articleId, String title, String content, int authorId, LocalDateTime publishDate,
			int category_id) {
		super();
		this.articleId = articleId;
		this.title = title;
		this.content = content;
		this.authorId = authorId;
		this.publishDate = publishDate;
		this.category_id = category_id;
	}
	//getters and setters methods
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getAuthorId() {
		return authorId;
	}
	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}
	public LocalDateTime getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(LocalDateTime publishDate) {
		this.publishDate = publishDate;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	
	
}