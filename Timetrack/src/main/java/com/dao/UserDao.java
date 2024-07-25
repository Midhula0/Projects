package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.User;

public class UserDao {

    // Method to authenticate a user by username and password
    public User authenticate(String username, String password) {
        User user = null;
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        
        System.out.println("Authenticating user: " + username);
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                user = new User();
                user.setEmpId(resultSet.getInt("emp_id"));
                user.setUsername(resultSet.getString("username"));
                user.setRole(resultSet.getString("role"));
                System.out.println("User authenticated: " + user.getUsername());
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // Method to get user details by username
    public User getUserByUsername(String username) {
        String sql = "SELECT * FROM users WHERE username = ?";
        User user = null;

        System.out.println("Fetching user by username: " + username);
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                user = new User();
                user.setEmpId(resultSet.getInt("emp_id"));
                user.setUsername(resultSet.getString("username"));
                user.setRole(resultSet.getString("role"));
                System.out.println("User found: " + user.getUsername());
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // Method to validate user by username and password (not necessary with authenticate, but included if needed)
    public boolean validateUser(String username, String password) {
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";

        System.out.println("Validating user: " + username);
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();

            return resultSet.next();

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to retrieve all employees
    public List<User> getAllEmployees() {
        List<User> employees = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE role = 'employee'";

        System.out.println("Fetching all employees");
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                User user1 = new User();
                user1.setEmpId(resultSet.getInt("emp_id"));
                user1.setUsername(resultSet.getString("username"));
                user1.setRole(resultSet.getString("role"));
                employees.add(user1);
                System.out.println("Employee found: " + user1.getUsername());
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }

    // Method to add a new employee
    public boolean addEmployee(User employee) {
        String sql = "INSERT INTO users (username, password, role) VALUES (?, ?, 'employee')";

        System.out.println("Adding new employee: " + employee.getUsername());
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, employee.getUsername());
            statement.setString(2, employee.getPassword());

            int rowsInserted = statement.executeUpdate();
            System.out.println("Rows inserted: " + rowsInserted);
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to delete an employee by empId
    public boolean deleteEmployee(int empId) {
        String sql = "DELETE FROM users WHERE emp_id = ? AND role = 'employee'";

        System.out.println("Deleting employee with empId: " + empId);
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, empId);

            int rowsDeleted = statement.executeUpdate();
            System.out.println("Rows deleted: " + rowsDeleted);
            return rowsDeleted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
 // Method to update the user's password
    public boolean updatePassword(String username, String newPassword) {
        String sql = "UPDATE users SET password = ? WHERE username = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, newPassword);
            statement.setString(2, username);

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    // Method to get users by role
    public List<User> getUsersByRole(String role) {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE role = ?";

        System.out.println("Fetching users by role: " + role);
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, role);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                User user = new User();
                user.setEmpId(resultSet.getInt("emp_id"));
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                user.setRole(resultSet.getString("role"));
                users.add(user);
                System.out.println("User found: " + user.getUsername());
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
}
