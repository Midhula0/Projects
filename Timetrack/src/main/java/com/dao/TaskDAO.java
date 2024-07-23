package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.modules.Task;

public class TaskDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/timetracker";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Sushma3134";

    private static final String INSERT_TASK_SQL = "INSERT INTO tasks (project, taskDate, startTime, endTime, category, description) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_TASK_BY_ID = "SELECT * FROM tasks WHERE taskId = ?";
    private static final String SELECT_ALL_TASKS = "SELECT * FROM tasks";
    private static final String DELETE_TASK_SQL = "DELETE FROM tasks WHERE taskId = ?";
    private static final String UPDATE_TASK_SQL = "UPDATE tasks SET project = ?, taskDate = ?, startTime = ?, endTime = ?, category = ?, description = ? WHERE taskId = ?";

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

    public void saveTask(Task task) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_TASK_SQL)) {
            preparedStatement.setString(1, task.getProject());
            preparedStatement.setString(2, task.getTaskDate());
            preparedStatement.setString(3, task.getStartTime());
            preparedStatement.setString(4, task.getEndTime());
            preparedStatement.setString(5, task.getCategory());
            preparedStatement.setString(6, task.getDescription());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Task selectTask(int taskId) {
        Task task = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TASK_BY_ID)) {
            preparedStatement.setInt(1, taskId);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String project = rs.getString("project");
                String taskDate = rs.getString("taskDate");
                String startTime = rs.getString("startTime");
                String endTime = rs.getString("endTime");
                String category = rs.getString("category");
                String description = rs.getString("description");
                task = new Task(taskId, project, taskDate, startTime, endTime, category, description);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return task;
    }

    public List<Task> getAllTasks() {
        List<Task> tasks = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TASKS)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int taskId = rs.getInt("taskId");
                String project = rs.getString("project");
                String taskDate = rs.getString("taskDate");
                String startTime = rs.getString("startTime");
                String endTime = rs.getString("endTime");
                String category = rs.getString("category");
                String description = rs.getString("description");
                tasks.add(new Task(taskId, project, taskDate, startTime, endTime, category, description));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return tasks;
    }

    public boolean updateTask(Task task) {
        boolean rowUpdated = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_TASK_SQL)) {
            preparedStatement.setString(1, task.getProject());
            preparedStatement.setString(2, task.getTaskDate());
            preparedStatement.setString(3, task.getStartTime());
            preparedStatement.setString(4, task.getEndTime());
            preparedStatement.setString(5, task.getCategory());
            preparedStatement.setString(6, task.getDescription());
            preparedStatement.setInt(7, task.getTaskId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowUpdated;
    }

    public boolean deleteTask(int taskId) {
        boolean rowDeleted = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_TASK_SQL)) {
            preparedStatement.setInt(1, taskId);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowDeleted;
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
