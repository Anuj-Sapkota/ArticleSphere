package controller;
import dao.UserDAO;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet
{
	private UserDAO userDAO;
	public void init() throws ServletException
	{
		userDAO = new UserDAO();
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		try
		{
			User user = userDAO.loginUser(email, password);
			if (user != null)
			{
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				session.setAttribute("userId", user.getUserId());
				response.sendRedirect("index.jsp");
			}
			else
			{
				request.setAttribute("error", "Invalid email or password");
				request.getRequestDispatcher("login.jsp").forward(request,  response);
			}
		}
		catch (SQLException e)
		{
			request.setAttribute("error", "Login failed: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the login form
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}