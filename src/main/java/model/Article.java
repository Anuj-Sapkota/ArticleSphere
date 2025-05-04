package model;

import java.sql.Date;
import java.time.LocalDateTime;
import java.time.ZoneId;

public class Article {
    private int articleId;
    private String title;
    private String content;
    private int authorId;
    private LocalDateTime publishDate;
    private int categoryId; // Changed from category_id to categoryId

    // Constructor without the Id for data that will be sent to database
    public Article(String title, String content, int authorId, LocalDateTime publishDate, int categoryId) {
        this.title = title;
        this.content = content;
        this.authorId = authorId;
        this.publishDate = publishDate;
        this.categoryId = categoryId;
    }

    // Constructor with id that will be retrieved from the database
    public Article(int articleId, String title, String content, int authorId, LocalDateTime publishDate, int categoryId) {
        this.articleId = articleId;
        this.title = title;
        this.content = content;
        this.authorId = authorId;
        this.publishDate = publishDate;
        this.categoryId = categoryId;
    }

    // Getters and setters
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

    public int getCategoryId() { // Changed from getCategory_id to getCategoryId
        return categoryId;
    }

    public void setCategoryId(int categoryId) { // Changed from setCategory_id to setCategoryId
        this.categoryId = categoryId;
    }
}
   