package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model.Task;

public class TaskDao {

    // Method to insert a new task into the database
	public boolean insertTask(Task task) {
	    String query = "INSERT INTO tasks (emp_id, username, date, start_time, end_time, num_hours, category, project) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	    boolean isInserted = false;

	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(query)) {

	        stmt.setInt(1, task.getEmpId());
	        stmt.setString(2, task.getUsername());
	        stmt.setDate(3, task.getDate());
	        stmt.setTime(4, task.getStartTime());
	        stmt.setTime(5, task.getEndTime());
	        stmt.setDouble(6, task.getNumHours());
	        stmt.setString(7, task.getCategory());
	        stmt.setString(8, task.getProject());

	        int rowsAffected = stmt.executeUpdate();
	        isInserted = (rowsAffected > 0);

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return isInserted;
	}


    // Validate total hours per day for a user
	public boolean validateTotalHoursPerDay(String username, java.sql.Date date, double numHours) {
	    boolean isValid = true;
	    String query = "SELECT SUM(num_hours) FROM tasks WHERE username = ? AND date = ?";

	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(query)) {
	        
	        stmt.setString(1, username);
	        stmt.setDate(2, date);
	        
	        ResultSet rs = stmt.executeQuery();
	        
	        if (rs.next()) {
	            double totalHours = rs.getDouble(1);
	            if ((totalHours + numHours) > 8) {
	                isValid = false;
	            }
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	        isValid = false;
	    }

	    return isValid;
	}


    // Method to retrieve all tasks for a specific employee
    public List<Task> getAllTasksForEmployee(int empId) {
        List<Task> tasks = new ArrayList<>();
        String sql = "SELECT * FROM tasks WHERE emp_id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, empId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Task task = new Task();
                task.setId(resultSet.getInt("id"));
                task.setEmpId(resultSet.getInt("emp_id"));
                task.setUsername(resultSet.getString("username"));
                task.setDate(resultSet.getDate("date"));
                task.setStartTime(resultSet.getTime("start_time"));
                task.setEndTime(resultSet.getTime("end_time"));
                task.setNumHours(resultSet.getDouble("num_hours"));
                task.setCategory(resultSet.getString("category"));
                task.setProject(resultSet.getString("project"));

                tasks.add(task);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tasks;
    }


    // Method to retrieve a single task by ID
    public Task getTaskById(int taskId) {
        String sql = "SELECT * FROM tasks WHERE id = ?";
        Task task = null;

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, taskId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                task = new Task();
                task.setId(resultSet.getInt("id"));
                task.setEmpId(resultSet.getInt("emp_id"));
                task.setUsername(resultSet.getString("username"));
                task.setDate(resultSet.getDate("date"));
                task.setStartTime(resultSet.getTime("start_time"));
                task.setEndTime(resultSet.getTime("end_time"));
                task.setNumHours(resultSet.getDouble("num_hours"));
                task.setCategory(resultSet.getString("category"));
                task.setProject(resultSet.getString("project"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return task;
    }

    // Method to update an existing task in the database
    public boolean updateTask(Task task) {
        String sql = "UPDATE tasks SET date = ?, start_time = ?, end_time = ?, num_hours = ?, category = ?, project = ? WHERE id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setDate(1, task.getDate());
            statement.setTime(2, task.getStartTime());
            statement.setTime(3, task.getEndTime());
            statement.setDouble(4, task.getNumHours());
            statement.setString(5, task.getCategory());
            statement.setString(6, task.getProject());
            statement.setInt(7, task.getId());

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to delete a task from the database
    public boolean deleteTask(int taskId) {
        String sql = "DELETE FROM tasks WHERE id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, taskId);

            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to get total hours for a specific user on a given date
    public double getTotalHoursForDay(String username, Date date) {
        String sql = "SELECT SUM(num_hours) AS total_hours FROM tasks WHERE username = ? AND date = ?";
        double totalHours = 0.0;

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, username);
            statement.setDate(2, date);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                totalHours = resultSet.getDouble("total_hours");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalHours;
    }

    // Method to retrieve all tasks for a specific employee on a given date
    public List<Task> getAllTasksForEmployeeOnDate(int empId, Date date) {
        List<Task> tasks = new ArrayList<>();
        String sql = "SELECT * FROM tasks WHERE emp_id = ? AND date = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, empId);
            statement.setDate(2, date);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Task task = new Task();
                task.setId(resultSet.getInt("id"));
                task.setEmpId(resultSet.getInt("emp_id"));
                task.setUsername(resultSet.getString("username"));
                task.setDate(resultSet.getDate("date"));
                task.setStartTime(resultSet.getTime("start_time"));
                task.setEndTime(resultSet.getTime("end_time"));
                task.setNumHours(resultSet.getDouble("num_hours"));
                task.setCategory(resultSet.getString("category"));
                task.setProject(resultSet.getString("project"));
                tasks.add(task);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tasks;
    }
    
    
    public List<Task> getMonthlyTasksForEmployeeOnYear(int year) {
        List<Task> tasks = new ArrayList<>();
        String sql = "SELECT MONTH(date) AS month, SUM(num_hours) AS totalHours FROM tasks WHERE YEAR(date) = ? GROUP BY MONTH(date)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, year);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Task task = new Task();
                task.setMonth(resultSet.getInt("month"));
                task.setNumHours(resultSet.getDouble("totalHours"));
                tasks.add(task);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tasks;
    }
    public List<Task> getWeeklyTasksForEmployeeInMonth(int year, int month) {
        List<Task> tasks = new ArrayList<>();
        String sql = "SELECT WEEK(date) AS weekNumber, SUM(num_hours) AS totalHours FROM tasks WHERE YEAR(date) = ? AND MONTH(date) = ? GROUP BY WEEK(date)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, year);
            statement.setInt(2, month);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Task task = new Task();
                task.setWeekNumber(resultSet.getInt("weekNumber"));
                task.setNumHours(resultSet.getDouble("totalHours"));
                tasks.add(task);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tasks;
    }
    public List<Task> getAllTasksForEmployeeByYear(int empId, int year) {
        List<Task> tasks = new ArrayList<>();
        String sql = "SELECT * FROM tasks WHERE emp_id = ? AND YEAR(date) = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, empId);
            statement.setInt(2, year);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Task task = new Task();
                task.setId(resultSet.getInt("id"));
                task.setEmpId(resultSet.getInt("emp_id"));
                task.setUsername(resultSet.getString("username"));
                task.setDate(resultSet.getDate("date"));
                task.setStartTime(resultSet.getTime("start_time"));
                task.setEndTime(resultSet.getTime("end_time"));
                task.setNumHours(resultSet.getDouble("num_hours"));
                task.setCategory(resultSet.getString("category"));
                task.setProject(resultSet.getString("project"));
                
                // Set week number and month based on the date
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(task.getDate());
                task.setWeekNumber(calendar.get(Calendar.WEEK_OF_YEAR));
                task.setMonth(calendar.get(Calendar.MONTH) + 1);

                tasks.add(task);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tasks;
    }
    public List<Task> getTasksForMonth(int year, int month, Date startDate, Date endDate) {
        List<Task> tasks = new ArrayList<>();
        String sql = "SELECT * FROM tasks WHERE YEAR(date) = ? AND MONTH(date) = ? AND date BETWEEN ? AND ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, year);
            statement.setInt(2, month);
            statement.setDate(3, startDate);
            statement.setDate(4, endDate);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Task task = new Task();
                task.setId(resultSet.getInt("id"));
                task.setEmpId(resultSet.getInt("emp_id"));
                task.setUsername(resultSet.getString("username"));
                task.setDate(resultSet.getDate("date"));
                task.setStartTime(resultSet.getTime("start_time"));
                task.setEndTime(resultSet.getTime("end_time"));
                task.setNumHours(resultSet.getDouble("num_hours"));
                task.setCategory(resultSet.getString("category"));
                task.setProject(resultSet.getString("project"));

                tasks.add(task);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tasks;
    }

    public double getTotalHoursForDay(int empId, Date date) {
        double totalHours = 0;
        String query = "SELECT SUM(num_hours) AS total_hours FROM tasks WHERE emp_id = ? AND date = ?";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            
            preparedStatement.setInt(1, empId);
            preparedStatement.setDate(2, date);
            
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                totalHours = resultSet.getDouble("total_hours");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return totalHours;
    }
    public List<Task> getAllTasks() {
        List<Task> tasks = new ArrayList<>();
        String query = "SELECT empId, username, date, startTime, endTime, numHours, category, project FROM tasks";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
            	Task task = new Task();
                task.setEmpId(rs.getInt("empId"));
                task.setUsername(rs.getString("username"));  // This line might be causing the error
                task.setDate(rs.getDate("date"));
                task.setStartTime(rs.getTime("startTime"));
                task.setEndTime(rs.getTime("endTime"));
                task.setNumHours(rs.getDouble("numHours"));
                task.setCategory(rs.getString("category"));
                task.setProject(rs.getString("project"));
                tasks.add(task);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tasks;
    }
    public List<Task> getTasksByDate(Date date) {
        List<Task> tasks = new ArrayList<>();
        String sql = "SELECT * FROM tasks WHERE date = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setDate(1, date);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Task task = new Task();
                    task.setId(rs.getInt("id"));
                    task.setEmpId(rs.getInt("emp_id"));
                    task.setUsername(rs.getString("username"));
                    task.setDate(rs.getDate("date"));
                    task.setStartTime(rs.getTime("start_time"));
                    task.setEndTime(rs.getTime("end_time"));
                    task.setNumHours(rs.getDouble("num_hours"));
                    task.setCategory(rs.getString("category"));
                    task.setProject(rs.getString("project"));
                    tasks.add(task);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tasks;
    }

    public List<Task> getTasksByMonthAndYear(int month, int year) {
        List<Task> tasks = new ArrayList<>();
        String sql = "SELECT * FROM tasks WHERE MONTH(date) = ? AND YEAR(date) = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, month);
            stmt.setInt(2, year);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Task task = new Task();
                    task.setId(rs.getInt("id"));
                    task.setEmpId(rs.getInt("emp_id"));
                    task.setUsername(rs.getString("username"));
                    task.setDate(rs.getDate("date"));
                    task.setStartTime(rs.getTime("start_time"));
                    task.setEndTime(rs.getTime("end_time"));
                    task.setNumHours(rs.getDouble("num_hours"));
                    task.setCategory(rs.getString("category"));
                    task.setProject(rs.getString("project"));
                    tasks.add(task);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tasks;
    }

    public List<Task> getTasksByYear(int year) {
        List<Task> tasks = new ArrayList<>();
        String sql = "SELECT * FROM tasks WHERE YEAR(date) = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, year);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Task task = new Task();
                    task.setId(rs.getInt("id"));
                    task.setEmpId(rs.getInt("emp_id"));
                    task.setUsername(rs.getString("username"));
                    task.setDate(rs.getDate("date"));
                    task.setStartTime(rs.getTime("start_time"));
                    task.setEndTime(rs.getTime("end_time"));
                    task.setNumHours(rs.getDouble("num_hours"));
                    task.setCategory(rs.getString("category"));
                    task.setProject(rs.getString("project"));
                    tasks.add(task);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tasks;
    }
    public Map<String, Double> getProjectHoursForDate(LocalDate date) throws SQLException {
        String sql = "SELECT project, SUM(num_hours) as total_hours FROM tasks WHERE date = ? GROUP BY project";
        Map<String, Double> projectHours = new HashMap<>();

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setDate(1, java.sql.Date.valueOf(date));
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                projectHours.put(resultSet.getString("project"), resultSet.getDouble("total_hours"));
            }
        }

        return projectHours;
    }

    public Map<String, Double> getProjectHoursForMonth(int year, int month) throws SQLException {
        String sql = "SELECT project, SUM(num_hours) as total_hours FROM tasks WHERE YEAR(date) = ? AND MONTH(date) = ? GROUP BY project";
        Map<String, Double> projectHours = new HashMap<>();

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, year);
            statement.setInt(2, month);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                projectHours.put(resultSet.getString("project"), resultSet.getDouble("total_hours"));
            }
        }

        return projectHours;
    }

    public Map<String, Double> getProjectHoursForYear(int year) throws SQLException {
        String sql = "SELECT project, SUM(num_hours) as total_hours FROM tasks WHERE YEAR(date) = ? GROUP BY project";
        Map<String, Double> projectHours = new HashMap<>();

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, year);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                projectHours.put(resultSet.getString("project"), resultSet.getDouble("total_hours"));
            }
        }

        return projectHours;
    }
    public Map<String, Double> getEmployeeHoursForMonth(int year, int month) throws SQLException {
        Map<String, Double> employeeHours = new HashMap<>();
        String sql = "SELECT username, SUM(num_hours) as total_hours " +
                     "FROM tasks " +
                     "WHERE YEAR(date) = ? AND MONTH(date) = ? " +
                     "GROUP BY username";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, year);
            pstmt.setInt(2, month);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    String employeeName = rs.getString("username");
                    Double totalHours = rs.getDouble("total_hours");
                    employeeHours.put(employeeName, totalHours);
                }
            }
        }
        return employeeHours;
    }
    public Map<String, Double> getEmployeeHoursForYear(int year) throws SQLException {
        Map<String, Double> employeeHours = new HashMap<>();
        String sql = "SELECT username, SUM(num_hours) as total_hours " +
                     "FROM tasks " +
                     "WHERE YEAR(date) = ? " +
                     "GROUP BY username";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, year);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    String employeeName = rs.getString("username");
                    Double totalHours = rs.getDouble("total_hours");
                    employeeHours.put(employeeName, totalHours);
                }
            }
        }
        return employeeHours;
    }
}
