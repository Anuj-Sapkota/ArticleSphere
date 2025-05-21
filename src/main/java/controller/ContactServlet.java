package controller;

import dao.ContactDAO;
import model.Contact;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String messageContent = request.getParameter("messageContent");

        HttpSession session = request.getSession(false);
        Integer userId = (session != null) ? (Integer) session.getAttribute("userId") : null;

        if (userId != null && messageContent != null && !messageContent.trim().isEmpty()) {
            Contact contact = new Contact(messageContent, LocalDateTime.now(), userId);
            ContactDAO.saveMessage(contact);
        }

        // Redirect or show success
        response.sendRedirect(request.getContextPath() + "/contact?success=true");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          
            request.getRequestDispatcher("/WEB-INF/view/contact.jsp").forward(request, response);
       
    }
}
