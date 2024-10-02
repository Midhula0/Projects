<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.TaskDao" %>
<%@ page import="com.model.Task" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Tasks</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
           background-image: url('https://images.unsplash.com/photo-1518655048521-f130df041f66?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
            background-size: fit content;
            background-repeat: no-repeat;
            background-position: center center;
            height: 100vh;
        }
        .container {
            margin-top: 20px;
        }
        .card {
            margin-bottom: 20px;
        }
        .actions a {
            margin-right: 10px;
        }
        .navbar-nav a {
            color: #ffffff !important;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <a class="navbar-brand" href="admin_dashboard.jsp">Admin Dashboard</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                
                <li class="nav-item">
                    <a class="nav-link" href="addTask.jsp">Add Task</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <h1 class="my-4">View Tasks</h1>
        <div class="card">
            <div class="card-body">
                <table class="table table-striped table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Date</th>
                            <th>Start Time</th>
                            <th>End Time</th>
                            <th>Hours</th>
                            <th>Category</th>
                            <th>Project</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            TaskDao taskDao = new TaskDao();
                            List<Task> tasks = taskDao.getAllTasks();
                            for (Task task : tasks) {
                        %>
                        <tr>
                            <td><%= task.getEmpId() %></td>
                            <td><%= task.getUsername() %></td>
                            <td><%= task.getDate() %></td>
                            <td><%= task.getStartTime() %></td>
                            <td><%= task.getEndTime() %></td>
                            <td><%= task.getNumHours() %></td>
                            <td><%= task.getCategory() %></td>
                            <td><%= task.getProject() %></td>
                            <td class="actions">
                                <a href="adminEditTask.jsp?taskId=<%= task.getId() %>" class="btn btn-warning btn-sm" data-toggle="tooltip" title="Edit">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <form action="AdminDeleteTaskServlet" method="post" style="display:inline;">
                                    <input type="hidden" name="taskId" value="<%= task.getEmpId() %>">
                                    <button type="submit" class="btn btn-danger btn-sm" data-toggle="tooltip" title="Delete">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })
        </script>
    </div>
</body>
</html>
