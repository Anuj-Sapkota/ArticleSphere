package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/view/adminPage.jsp"})
public class RoleFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("RoleFilter initialized");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        // Checks if user is logged in or not
        if (session == null || session.getAttribute("user") == null) {
            System.out.println("RoleFilter: User not logged in, redirecting to login.jsp");
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/view/login.jsp");
            return;
        }

     // Check the user's role
        String role = (String) session.getAttribute("role");
        if (role == null) {
            System.out.println("RoleFilter: Role not found in session, redirecting to index.jsp");
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/view/index.jsp");
            return;
        }

        System.out.println("RoleFilter: Role found in session: " + role);
        if ("admin".equalsIgnoreCase(role)) {
            System.out.println("RoleFilter: Admin access granted to " + httpRequest.getRequestURI());
            chain.doFilter(request, response); 
        } else {
            System.out.println("RoleFilter: Non-admin user, redirecting to index.jsp");
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/view/index.jsp");}
        }

    @Override
    public void destroy() {
        System.out.println("RoleFilter destroyed");
    }
}