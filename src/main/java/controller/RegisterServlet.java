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
	
//@Override
//public void init() throws ServletException
//{
//	userDAO = new UserDAO();
//}

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
{
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
    String role = request.getParameter("role");
    
    //User Object
    User user = new User(firstName, lastName, email, password, role, LocalDateTime.now(),"", ""); // as the bio and profile pic are empty at first
    try 
    {
    	int userId = UserDAO.registerUser(user);
    	user.setUserId(userId);
    	
    }
    catch (SQLException e)
    {
    	request.setAttribute("error", "Registratin Failed: "+ e.getMessage());
    	request.getRequestDispatcher("view/register.jsp").forward(request, response);
    }
}
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Forward to the registration form
    request.getRequestDispatcher("view/register.jsp").forward(request, response);
}
}