package bankcontrollers;

import bank.dao.DatabaseConnection;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNo = request.getParameter("accountNo");
        String tempPassword = request.getParameter("tempPassword");
        String newPassword = request.getParameter("newPassword");

        try {
            DatabaseConnection db = new DatabaseConnection();

            String sql = "SELECT * FROM customer WHERE account_no = ? AND password = ?";
            PreparedStatement statement = db.createPreparedStatement(sql);
            statement.setString(1, accountNo);
            statement.setString(2, tempPassword);

            ResultSet resultSet = db.executeQuery(statement);

            if (resultSet.next()) {
                sql = "UPDATE customer SET password = ? WHERE account_no = ?";
                statement = db.createPreparedStatement(sql);
                statement.setString(1, newPassword);
                statement.setString(2, accountNo);

                int rowsUpdated = db.executeUpdate(statement);
                if (rowsUpdated > 0) {
                    response.sendRedirect("customer_login.jsp");
                } else {
                    response.setContentType("text/html");
                    response.getWriter().println("<html><body>");
                    response.getWriter().println("<h3>Failed to change password. Please try again.</h3>");
                    response.getWriter().println("<a href='change_password.jsp'>Try again</a>");
                    response.getWriter().println("</body></html>");
                }
            } else {
                response.setContentType("text/html");
                response.getWriter().println("<html><body>");
                response.getWriter().println("<h3>Invalid account number or temporary password.</h3>");
                response.getWriter().println("<a href='change_password.jsp'>Try again</a>");
                response.getWriter().println("</body></html>");
            }

            db.closeConnection();
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Database access error", e);
        }
    }
}
