<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
    session = request.getSession(false);
    if (session != null) {
        session.invalidate();
    }

    Cookie cookie = new Cookie("userToken", "");
    cookie.setPath("/");
    cookie.setMaxAge(0);
    response.addCookie(cookie);

    response.sendRedirect(request.getContextPath() + "/view/login.jsp");
%>