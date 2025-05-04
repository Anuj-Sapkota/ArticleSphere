package controller;

import dao.UserDAO;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO;
    private static final String SECRET_KEY = "!)@(#*$&%^"; 

    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    // Utility method to create an HMAC signature
    private String createHMAC(String data) throws Exception {
        Mac mac = Mac.getInstance("HmacSHA256");
        SecretKeySpec secretKeySpec = new SecretKeySpec(SECRET_KEY.getBytes(), "HmacSHA256");
        mac.init(secretKeySpec);
        byte[] hmacBytes = mac.doFinal(data.getBytes());
        return Base64.getEncoder().encodeToString(hmacBytes);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");

        try {
            User user = userDAO.loginUser(email, password);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setMaxInactiveInterval(60*30);
                session.setAttribute("user", user);
                session.setAttribute("userId", user.getUserId());
                session.setAttribute("firstname", user.getFirstName());
                session.setAttribute("lastname",user.getLastName());
                session.setAttribute("role", user.getRole());
                // Set userToken cookie only if "Remember Me" is checked
                if ("on".equals(rememberMe)) {
                    String userId = String.valueOf(user.getUserId());
                    String signature = createHMAC(userId);
                    String userToken = userId + ":" + signature;

                    Cookie cookie = new Cookie("userToken", userToken);
                    cookie.setPath("/");
                    cookie.setMaxAge(7 * 24 * 60 * 60); // 7 days
                    cookie.setHttpOnly(true);
                    // cookie.setSecure(true); // Uncomment if using HTTPS
                    response.addCookie(cookie);
                }
                	
                // Redirecting based on the role
                if ("admin".equals(user.getRole())) {
                    response.sendRedirect(request.getContextPath() + "/dashboard");
                } else {
                    response.sendRedirect(request.getContextPath() + "/home");
                }
            } else {
                request.setAttribute("error", "Invalid email or password");
                request.getRequestDispatcher("/view/login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            request.setAttribute("error", "Login failed: " + e.getMessage());
            request.getRequestDispatcher("/view/login.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error creating cookie: " + e.getMessage());
            request.getRequestDispatcher("/view/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/view/login.jsp");
    }
}