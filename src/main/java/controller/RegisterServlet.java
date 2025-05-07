package controller;

import dao.UserDAO;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;

@SuppressWarnings("serial")
@WebServlet("/register")
public class RegisterServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        
        // User Object
        User user = new User(firstName, lastName, email, password, role, LocalDateTime.now(), "", ""); // as the bio and profile pic are empty at first
        try 
        {
            int userId = UserDAO.registerUser(user);
            user.setUserId(userId);
            response.sendRedirect(request.getContextPath() + "/view/login.jsp?registration=success");
        }
        catch (SQLException e)
        {
            request.setAttribute("error", "Registration Failed: Email already registered.");
            request.getRequestDispatcher("view/register.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the registration form
        request.getRequestDispatcher("view/register.jsp").forward(request, response);
    }
}