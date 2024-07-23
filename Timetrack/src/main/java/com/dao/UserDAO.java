package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.User;

public class UserDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/timetracker";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Sushma3134";

    private static final String INSERT_USERS_SQL = "INSERT INTO users (username, password, email, role) VALUES (?, ?, ?, ?)";
    private static final String SELECT_USER_BY_USERNAME_AND_PASSWORD = "SELECT * FROM users WHERE username = ? and password = ?";
	private static final String VALIDATE_ADMIN_SQL = null;

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void saveUser(User user) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getRole());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public User validate(String username, String password) {
        User user = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_USERNAME_AND_PASSWORD)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            String role = null;
			preparedStatement.setString(3, role);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                user = new User();
                
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }


	public User validateEmployee(String username, String password, String email) {
		 User user = null;
	        try (Connection connection = getConnection();
	             PreparedStatement statement = connection.prepareStatement(
	                     "SELECT * FROM users WHERE username = ? AND password = ? AND email = ?")) {
	            statement.setString(1, username);
	            statement.setString(2, password);
	            statement.setString(3, email);

	            ResultSet resultSet = statement.executeQuery();
	            if (resultSet.next()) {
	                user = new User();
	                user.setUsername(resultSet.getString("username"));
	                user.setPassword(resultSet.getString("password"));
	                user.setEmail(resultSet.getString("email"));
	                // Set other user properties as needed
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return user;
	    }
	
	public User validateAdmin(String username, String password) {
        User user = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(VALIDATE_ADMIN_SQL)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                user = new User();
            
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setRole("admin");
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

	}