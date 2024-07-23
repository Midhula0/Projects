package bank.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import bank.model.Customer;

public class CustomerDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/bankdb";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Sushma3134";
    private Connection jdbcConnection;

    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
        }
    }

    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    public void insertCustomer(Customer customer) throws SQLException {
        String sql = "INSERT INTO customer (full_name, address, mobile_no, email_id, account_type, dob, id_proof, account_no) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setString(1, customer.getFullName());
        statement.setString(2, customer.getAddress());
        statement.setString(3, customer.getMobile());
        statement.setString(4, customer.getEmail());
        statement.setString(5, customer.getAccountType());
        statement.setDate(6, customer.getDob());
        statement.setString(7, customer.getIdProof());
        statement.setString(8, customer.getAccountNo());
        

        statement.executeUpdate();

        statement.close();
        disconnect();
    }
}
