package controller;

import dao.CategoryDAO;
import model.Category;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/category")
public class CategoryServlet extends HttpServlet {
    private CategoryDAO categoryDAO;

    @Override
    public void init() throws ServletException {
        categoryDAO = new CategoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // 1) fetch all categories
            List<Category> categories = categoryDAO.getAllCategories();
            request.setAttribute("categories", categories);
            // 2) forward to JSP
            request.getRequestDispatcher("/view/categoryAdd.jsp")
                   .forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // keep your create/delete logic here (unchanged)
        String action = request.getParameter("action");
        try {
            if ("create".equals(action)) {
                createCategory(request, response);
            } else if ("delete".equals(action)) {
                deleteCategory(request, response);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void createCategory(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String categoryName = request.getParameter("categoryName");
        String categoryDescription = request.getParameter("categoryDescription");

        if (categoryName == null || categoryName.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/category?error=Category name is required");
            return;
        }

        Category category = new Category(categoryName, categoryDescription);
        categoryDAO.createCategory(category);
        response.sendRedirect(request.getContextPath() + "/category?success=Category created successfully");
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("id"));
        categoryDAO.deleteCategory(categoryId);
        response.sendRedirect(request.getContextPath() + "/category?success=Category deleted successfully");
    }
}