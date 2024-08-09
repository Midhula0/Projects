<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.User" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://images.unsplash.com/photo-1449247709967-d4461a6a6103?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            height: 100vh;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Employee Dashboard</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="addTask.jsp">Add Task</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="editTask.jsp">Edit Task</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="deleteTask.jsp">View Task</a>
                </li>
              <!-- 
            <li class="nav-item">
                    <a class="nav-link" href="empviewtask.jsp">View Tasks</a>
                </li> -->
                <li class="nav-item">
                    <a class="nav-link" href="viewCharts.jsp">View Charts</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="changePassword.jsp">Change Password</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="logout.jsp">Logout</a>
                </li>
                
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-4">
        <%
            User user = (User) session.getAttribute("user");
            if (user != null) {
        %>
        <h1 class="text-center">Welcome <%= user.getUsername() %></h1>
        <%
                String pageToInclude = request.getParameter("page");
                if (pageToInclude != null && !pageToInclude.isEmpty()) {
        %>
            <jsp:include page="<%= pageToInclude %>"></jsp:include>
        <%
                } else {
        %>
            <p class="text-center">Please select an option from the navigation menu.</p>
        <%
                }
            } else {
        %>
        <p class="text-center text-danger">You are not logged in. Please <a href="index.jsp">log in</a> to access the dashboard.</p>
        <%
            }
        %>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
