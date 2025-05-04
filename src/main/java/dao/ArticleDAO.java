package dao;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Article;
import utils.DatabaseUtil;

public class ArticleDAO {

    // Create a new article
    public void createArticle(Article article) throws SQLException {
        String query = "INSERT INTO article (title, content, authorId, publishDate, categoryId) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement pst = connection.prepareStatement(query)) {
            pst.setString(1, article.getTitle());
            pst.setString(2, article.getContent());
            pst.setInt(3, article.getAuthorId());
            pst.setObject(4, article.getPublishDate());
            pst.setInt(5, article.getCategoryId()); // Changed to categoryId
            pst.executeUpdate();
        }
    }

    // Retrieve an article by ID
    public Article getArticleById(int articleId) throws SQLException {
        String query = "SELECT * FROM article WHERE articleId = ?";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement pst = connection.prepareStatement(query)) {
            pst.setInt(1, articleId);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    return new Article(
                        rs.getInt("articleId"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getInt("authorId"),
                        rs.getObject("publishDate", LocalDateTime.class),
                        rs.getInt("categoryId") // Changed to categoryId
                    );
                }
            }
        }
        return null;
    }
    //Retrieve articles by Title
    public Article getArticleByTitle(String title) throws SQLException {
        String sql = "SELECT articleId, title, content, authorId, publishDate, categoryId FROM article WHERE title = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, title);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Article(
                    rs.getInt("articleId"),
                    rs.getString("title"),
                    rs.getString("content"),
                    rs.getInt("authorId"),
                    rs.getTimestamp("publishDate").toLocalDateTime(),
                    rs.getInt("categoryId")
                );
            }
            return null; // Return null if no article is found
        }
    }

    // Retrieve all articles
    public List<Article> getAllArticles() throws SQLException {
        List<Article> articles = new ArrayList<>();
        String query = "SELECT * FROM article";
        try (Connection connection = DatabaseUtil.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                articles.add(new Article(
                    rs.getInt("articleId"),
                    rs.getString("title"),
                    rs.getString("content"),
                    rs.getInt("authorId"),
                    rs.getObject("publishDate", LocalDateTime.class),
                    rs.getInt("categoryId")
                ));
            }
        }
        return articles;
    }

    
 // Retrieve articles by category
    public List<Article> getArticlesByCategory(int categoryId) throws SQLException {
        List<Article> articles = new ArrayList<>();
        String sql = "SELECT articleId, title, content, authorId, publishDate, categoryId FROM article WHERE categoryId = ? ORDER BY publishDate DESC";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, categoryId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                articles.add(new Article(
                    rs.getInt("articleId"),
                    rs.getString("title"),
                    rs.getString("content"),
                    rs.getInt("authorId"),
                    rs.getTimestamp("publishDate").toLocalDateTime(),
                    rs.getInt("categoryId")
                ));
            }
        }
        return articles;
    }

    // Retrieve articles by author
    public List<Article> getArticlesByAuthor(int authorId) throws SQLException {
        List<Article> articles = new ArrayList<>();
        String query = "SELECT * FROM article WHERE authorId = ?";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement pst = connection.prepareStatement(query)) {
            pst.setInt(1, authorId);
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    articles.add(new Article(
                        rs.getInt("articleId"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getInt("authorId"),
                        rs.getObject("publishDate", LocalDateTime.class),
                        rs.getInt("categoryId")
                    ));
                }
            }
        }
        return articles;
    }

    // Update an article
    public void updateArticle(Article article) throws SQLException {
        String query = "UPDATE article SET title = ?, content = ?, publishDate = ?, categoryId = ? WHERE articleId = ?";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement pst = connection.prepareStatement(query)) {
            pst.setString(1, article.getTitle());
            pst.setString(2, article.getContent());
            pst.setObject(3, article.getPublishDate());
            pst.setInt(4, article.getCategoryId());
            pst.setInt(5, article.getArticleId());
            pst.executeUpdate();
        }
    }

    // Delete an article
    public void deleteArticle(int articleId) throws SQLException {
        String query = "DELETE FROM article WHERE articleId = ?";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement pst = connection.prepareStatement(query)) {
            pst.setInt(1, articleId);
            pst.executeUpdate();
        }
    }
    //Count all the articles.
    public int getTotalArticles() throws SQLException {
        String query = "SELECT COUNT(*) FROM article";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement pst = connection.prepareStatement(query);
             ResultSet rs = pst.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
            return 0;
        }
    }
}