package bankcontrollers;

import bank.dao.DatabaseConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteAccountServlet")
public class DeleteAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNo = request.getParameter("accountNo");
        String password = request.getParameter("password");
        DatabaseConnection db;
        try {
            db = new DatabaseConnection();
            Connection conn = db.getConnection();

            // Validate account number and password
            PreparedStatement ps = conn.prepareStatement("SELECT balance FROM customer WHERE account_no = ? AND password = ?");
            ps.setString(1, accountNo);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                double balance = rs.getDouble("balance");
                if (balance != 0) {
                    response.sendRedirect("delete_account_error.jsp");
                } else {
                    // Delete transactions
                    ps = conn.prepareStatement("DELETE FROM transactions WHERE account_no = ?");
                    ps.setString(1, accountNo);
                    ps.executeUpdate();

                    // Delete account
                    ps = conn.prepareStatement("DELETE FROM customer WHERE account_no = ?");
                    ps.setString(1, accountNo);
                    int result = ps.executeUpdate();

                    if (result > 0) {
                        response.sendRedirect("account_deleted_success.jsp");
                    } else {
                        response.sendRedirect("delete_account_error.jsp");
                    }
                }
            } else {
                response.sendRedirect("delete_account_error.jsp");
            }

            db.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
