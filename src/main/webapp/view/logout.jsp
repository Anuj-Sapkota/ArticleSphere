<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // Clear the userToken cookie by setting its maxAge to 0
    Cookie cookie = new Cookie("userToken", "");
    cookie.setPath("/");
    cookie.setMaxAge(0); // Expire the cookie immediately
    response.addCookie(cookie);

    // Redirect to login page
    response.sendRedirect(request.getContextPath() + "/view/login.jsp");
%>