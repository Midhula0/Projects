package bank.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bank.dao.CustomerDAO;
import bank.model.Customer;

@WebServlet("/CustomerRegisterServlet")
public class CustomerRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerDAO customerDAO;

    public void init() {
        customerDAO = new CustomerDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullname");
        String address = request.getParameter("address");
        String mobile = request.getParameter("mobileno");
        String email = request.getParameter("email");
        String accountType = request.getParameter("type"); // Ensure this matches ENUM 'Saving' or 'Current'
        String dobStr = request.getParameter("DOB");
        Date dob = Date.valueOf(dobStr);
        String idProof = request.getParameter("aadhar");
        String accountNo = request.getParameter("accountno");
        
        Customer newCustomer = new Customer();
        newCustomer.setFullName(fullName);
        newCustomer.setAddress(address);
        newCustomer.setMobile(mobile);
        newCustomer.setEmail(email);
        newCustomer.setAccountType(accountType);
        newCustomer.setDob(dob);
        newCustomer.setIdProof(idProof);
        newCustomer.setAccountNo(accountNo);
        

        try {
            customerDAO.insertCustomer(newCustomer);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException(e);
        }

        response.sendRedirect("adminDashboard.jsp");
    }
}
