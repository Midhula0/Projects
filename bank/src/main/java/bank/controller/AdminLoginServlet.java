package bank.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bank.dao.AdminDAO;


@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    // Handling POST requests from the login form
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieving username and password from the request parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Creating an instance of AdminDAO to interact with admin data
        AdminDAO adminDAO = new AdminDAO();

        // Validating admin credentials
        boolean valid = false;
		try {
			valid = adminDAO.validateAdmin(username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        if (valid) {
            // If credentials are valid, redirect to the admin dashboard
            response.sendRedirect("admindashboard.jsp");
        } else {
            // If credentials are invalid, redirect back to the login page with an error message
            response.sendRedirect("Adminlogin.jsp?error=Invalid credentials");
        }
    }
}
