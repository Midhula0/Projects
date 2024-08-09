<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    // Invalidate the current session if one exists
    HttpSession sessions = request.getSession(false);
    if (sessions != null) {
        sessions.invalidate();
    }
    // Redirect to the login page
    response.sendRedirect("index.jsp");
%>
