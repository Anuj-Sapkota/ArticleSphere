package dao;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;
import model.Category;
import utils.DatabaseUtil;

public class CategoryDAO {

    // Create a new category
    public void createCategory(Category category) throws SQLException {
        String query = "INSERT INTO category (categoryName, categoryDescription) VALUES (?, ?)";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement pst = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            pst.setString(1, category.getCategoryName());
            pst.setString(2, category.getCategoryDescription());
            pst.executeUpdate();

            // Get the generated categoryId
            try (ResultSet rs = pst.getGeneratedKeys()) {
                if (rs.next()) {
                    category.setCategoryId(rs.getInt(1));
                }
            }
        }
    }

    // Retrieve all categories
    public List<Category> getAllCategories() throws SQLException {
        List<Category> categories = new ArrayList<>();
        String query = "SELECT * FROM category";
        try (Connection connection = DatabaseUtil.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                categories.add(new Category(
                    rs.getInt("categoryId"),
                    rs.getString("categoryName"),
                    rs.getString("categoryDescription")
                ));
            }
        }
        return categories;
    }

    // Retrieve category by ID
    public Category getCategoryById(int categoryId) throws SQLException {
        String query = "SELECT * FROM category WHERE categoryId = ?";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement pst = connection.prepareStatement(query)) {
            pst.setInt(1, categoryId);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    return new Category(
                        rs.getInt("categoryId"),
                        rs.getString("categoryName"),
                        rs.getString("categoryDescription")
                    );
                }
            }
        }
        return null;
    }

    // Update a category by ID
    public boolean updateCategory(Category category) throws SQLException {
        String query = "UPDATE category SET categoryName = ?, categoryDescription = ? WHERE categoryId = ?";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement pst = connection.prepareStatement(query)) {
            pst.setString(1, category.getCategoryName());
            pst.setString(2, category.getCategoryDescription());
            pst.setInt(3, category.getCategoryId());
            int affectedRows = pst.executeUpdate();
            return affectedRows > 0;
        }
    }

    // Delete a category by ID
    public void deleteCategory(int categoryId) throws SQLException {
        // Delete all articles associated with the category
        String deleteArticlesQuery = "DELETE FROM article WHERE categoryId = ?";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement pst = connection.prepareStatement(deleteArticlesQuery)) {
            pst.setInt(1, categoryId);
            pst.executeUpdate();
        }

        // Delete the category itself
        String deleteCategoryQuery = "DELETE FROM category WHERE categoryId = ?";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement pst = connection.prepareStatement(deleteCategoryQuery)) {
            pst.setInt(1, categoryId);
            pst.executeUpdate();
        }
    }
}
