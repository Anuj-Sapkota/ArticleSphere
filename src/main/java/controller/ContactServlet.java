package controller;

import dao.ContactDAO;
import jakarta.servlet.http.HttpServlet;
import model.Contact;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDateTime;

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
        response.sendRedirect(request.getContextPath() + "/view/contact.jsp?success=true");
    }
}
