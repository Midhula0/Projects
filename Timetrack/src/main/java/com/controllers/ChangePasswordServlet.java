package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.model.User;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String username = request.getParameter("username");
        String newPassword = request.getParameter("newPassword");

        // Update the user's password
        UserDao userDao = new UserDao();
        boolean isUpdated = userDao.updatePassword(username, newPassword);

        // Redirect with a success or error message
        if (isUpdated) {
            response.sendRedirect("changePassword.jsp?message=Password updated successfully");
        } else {
            response.sendRedirect("changePassword.jsp?error=Failed to update password");
        }
    }
}
