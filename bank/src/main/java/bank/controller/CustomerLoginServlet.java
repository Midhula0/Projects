package bankcontrollers;

import bank.dao.AccountDAO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

@WebServlet("/logincustomer")
public class CustomerLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/bankdb";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "Sushma3134";

    private Connection connection;
    private AccountDAO accountDAO;

    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            accountDAO = new AccountDAO(connection);
        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException("Database connection error", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNo = request.getParameter("accountNo");
        String password = request.getParameter("password");

        try {
            String sql = "SELECT * FROM customer WHERE account_no = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, accountNo);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("accountNo", accountNo);

                // Get account details and set as request attribute
                Map<String, Object> accountDetails = accountDAO.getAccountDetailsByNumber(accountNo);
                request.setAttribute("accountDetails", accountDetails);

                RequestDispatcher dispatcher = request.getRequestDispatcher("customer_dashboard.jsp");
                dispatcher.forward(request, response);
            } else {
                response.setContentType("text/html");
                response.getWriter().println("<html><body>");
                response.getWriter().println("<h3>Invalid account number or password.</h3>");
                response.getWriter().println("<a href='customer_login.jsp'>Try again</a>");
                response.getWriter().println("</body></html>");
            }

            resultSet.close();
        } catch (SQLException e) {
            throw new ServletException("Database access error", e);
        }
    }

    public void destroy() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
