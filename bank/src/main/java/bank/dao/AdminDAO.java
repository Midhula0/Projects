package bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class AccountDAO {
    private Connection connection;

    public AccountDAO(Connection connection) {
        this.connection = connection;
    }

    public Map<String, Object> getAccountDetailsByNumber(String accountNo) throws SQLException {
        String sql = "SELECT * FROM customer WHERE account_no = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, accountNo);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            Map<String, Object> accountDetails = new HashMap<>();
            accountDetails.put("accountNo", resultSet.getString("account_no"));
            accountDetails.put("balance", resultSet.getDouble("balance"));
            // Add other account details as needed
            return accountDetails;
        }

        return null;
    }
}
