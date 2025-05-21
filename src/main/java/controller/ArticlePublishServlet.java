package controller;

import java.io.IOException;
import java.util.List;

import dao.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;

@WebServlet("/publishArticle")
public class ArticlePublishServlet extends HttpServlet {
    private CategoryDAO categoryDAO;

    @Override
    public void init() {
        categoryDAO = new CategoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try {
            List<Category> categories = categoryDAO.getAllCategories();
            System.out.println("Fetched categories: " + categories); // Debug output
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("/WEB-INF/view/Articlepublishing.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("Error in ArticlePublishServlet: " + e.getMessage()); // Debug error
            throw new ServletException(e);
        }
    }
}