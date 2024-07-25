package com.controller;

import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.TaskDao;
import com.model.Task;
import com.model.User;

@WebServlet("/AddTaskServlet")
public class AddTaskServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TaskDao taskDao = new TaskDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve session user
        User sessionUser = (User) request.getSession().getAttribute("user");

        // Check if sessionUser is null
        if (sessionUser == null) {
            // Redirect to login page or handle unauthorized access
            response.sendRedirect("admin_dashboard.jsp");
            return;
        }

        // Retrieve form parameters
        String dateStr = request.getParameter("date");
        String startTimeStr = request.getParameter("startTime");
        String endTimeStr = request.getParameter("endTime");
        String category = request.getParameter("category");
        String project = request.getParameter("project");

        // Validate form data
        if (dateStr == null || startTimeStr == null || endTimeStr == null || category == null || project == null) {
            // Handle invalid or missing parameters
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("addTask.jsp").forward(request, response);
            return;
        }

        // Parse date and times
        SimpleDateFormat inputDateFormat = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
        Date date;
        Time startTime;
        Time endTime;
        double numHours = 0.0;

        try {
            // Parse input date string and format it to the required database format
            date = inputDateFormat.parse(dateStr);
            String formattedDateStr = outputDateFormat.format(date);

            // Parse time strings into Time objects
            startTime = new Time(timeFormat.parse(startTimeStr).getTime());
            endTime = new Time(timeFormat.parse(endTimeStr).getTime());

            // Calculate num_hours
            long durationInMillis = endTime.getTime() - startTime.getTime();
            numHours = durationInMillis / (1000.0 * 60 * 60); // Convert milliseconds to hours

            // Validate total hours per day
            boolean isValid = taskDao.validateTotalHoursPerDay(sessionUser.getUsername(), java.sql.Date.valueOf(formattedDateStr), numHours);
            if (!isValid) {
                request.setAttribute("errorMessage", "Total hours for the day exceed 8 hours.");
                request.getRequestDispatcher("addTask.jsp").forward(request, response);
                return;
            }

            // Create Task object
            Task task = new Task();
            task.setEmpId(sessionUser.getEmpId());
            task.setUsername(sessionUser.getUsername());
            task.setDate(java.sql.Date.valueOf(formattedDateStr));
            task.setStartTime(startTime);
            task.setEndTime(endTime);
            task.setNumHours(numHours);
            task.setCategory(category);
            task.setProject(project);

            // Insert task into the database
            boolean isInserted = taskDao.insertTask(task);
            if (isInserted) {
                response.sendRedirect("task_success.jsp");
            } else {
                request.setAttribute("errorMessage", "Error adding task. Please try again.");
                request.getRequestDispatcher("addTask.jsp").forward(request, response);
            }

        } catch (ParseException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Invalid date or time format.");
            request.getRequestDispatcher("addTask.jsp").forward(request, response);
        }
    }
}
