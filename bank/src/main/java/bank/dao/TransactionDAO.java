package bank.dao;

import bank.models.Transaction;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TransactionDAO {
    private Connection connection;

    public TransactionDAO(Connection connection) {
        this.connection = connection;
    }

    public List<Transaction> getTransactionsByAccountNumber(String accountNumber, int limit) throws SQLException {
        List<Transaction> transactions = new ArrayList<>();
        String sql = "SELECT * FROM transactions WHERE account_number = ? ORDER BY transaction_date DESC LIMIT ?";
        
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, accountNumber);
            statement.setInt(2, limit);
            
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransactionId(resultSet.getInt("transaction_id"));
                transaction.setAccountNo(resultSet.getString("account_number"));
                transaction.setType(resultSet.getString("transaction_type"));
                transaction.setAmount(resultSet.getDouble("amount"));
                transaction.setDate(resultSet.getTimestamp("transaction_date"));
                transactions.add(transaction);
            }
        }
        
        return transactions;
    }
}
