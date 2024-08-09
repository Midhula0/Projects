<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Task" %>
<%@ page import="com.model.User" %>
<%@ page import="com.dao.TaskDao" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Task</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://images.unsplash.com/photo-1518655048521-f130df041f66?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            margin: 0;
            padding: 0;
            height: 100vh;
        }
        .container {
            margin: 20px auto;
            max-width: 900px;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }
        .navbar {
            margin-bottom: 20px;
            
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #dee2e6;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #f8f9fa;
            font-weight: bold;
        }
        .btn-delete {
            padding: 8px 12px;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-delete:hover {
            background-color: #c82333;
        }
        .no-tasks {
            text-align: center;
            margin: 20px 0;
            font-size: 18px;
            color: #555;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Task Tracker</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="employeeDashboard.jsp"><i class="fas fa-home"></i> Home</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <h1>View Task</h1>
        
        <%-- Retrieve tasks for the logged-in employee --%>
        <% User user = (User) session.getAttribute("user");
           if (user != null) {
               TaskDao taskDao = new TaskDao();
               List<Task> tasks = taskDao.getAllTasksForEmployee(user.getEmpId());
               
               // Check if tasks exist
               if (!tasks.isEmpty()) { %>
                   <table class="table table-hover">
                       <thead>
                           <tr>
                               <th>Date</th>
                               <th>Start Time</th>
                               <th>End Time</th>
                               <th>Number of Hours</th>
                               <th>Category</th>
                               <th>Project</th>
                               <th>Action</th>
                           </tr>
                       </thead>
                       <tbody>
                       <% for (Task task : tasks) { %>
                           <tr>
                               <td><%= task.getDate() %></td>
                               <td><%= task.getStartTime() %></td>
                               <td><%= task.getEndTime() %></td>
                               <td><%= task.getNumHours() %></td>
                               <td><%= task.getCategory() %></td>
                               <td><%= task.getProject() %></td>
                               <td>
                                   <form action="DeleteTaskServlet" method="POST" onsubmit="return confirm('Are you sure you want to delete this task?');">
                                       <input type="hidden" name="taskId" value="<%= task.getId() %>">
                                       <button type="submit" class="btn btn-sm btn-danger btn-delete">
                                           <i class="fas fa-trash-alt"></i> Delete
                                       </button>
                                   </form>
                               </td>
                           </tr>
                       <% } %>
                       </tbody>
                   </table>
               <% } else { %>
                   <div class="no-ttasks">No tasks found for the logged-in user.</div>
               <% }
           } else { %>
               <div class="no-tasks">User session not found.</div>
           <% } %>
        
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
