<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dao.UserDao" %>
<%@ page import="com.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('https://images.pexels.com/photos/5412/water-blue-ocean.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            max-width: 600px;
            background: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.15);
        }
        h1 {
            color: #343a40;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 700;
        }
        .form-group label {
            font-weight: 600;
            color: #495057;
        }
        .form-control {
            border-radius: 0.5rem;
        }
        .btn-custom {
            background-color: #28a745;
            border-color: #28a745;
            color: #fff;
            width: 100%;
            padding: 15px;
            font-size: 18px;
            margin-top: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 0.5rem;
        }
        .btn-custom:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
        .btn-custom i {
            margin-right: 10px;
        }
        .link-container {
            text-align: center;
            margin-top: 20px;
        }
        .link-container a {
            margin: 0 10px;
            color: white;
            text-decoration: none;
        }
        .link-container a:hover {
            text-decoration: underline;
        }
        .error-message {
            color: #dc3545;
            margin-top: 20px;
            text-align: center;
            font-weight: bold;
        }
        .input-group-text {
            background-color: #e9ecef;
            border-radius: 0.5rem 0 0 0.5rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add Employee</h1>
        <form action="AddEmployeeServlet" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-user-alt"></i></span>
                    </div>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
            </div>
            <div class="form-group">
                <label for="role">Role:</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-user-tag"></i></span>
                    </div>
                    <select class="form-control" id="role" name="role" required>
                        <option value="employee">Employee</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>
            </div>
            <button type="submit" class="btn btn-custom">
                <i class="fas fa-user-plus"></i> Add Employee
            </button>
        </form>

        <%-- Links to change password and home page --%>
        <div class="link-container">
           
            <a href="admin_dashboard.jsp" class="btn btn-secondary">
                <i class="fas fa-home"></i> Home
            </a>
        </div>

        <%-- Display error message if any --%>
        <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
        <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
            <p class="error-message"><%= errorMessage %></p>
        <% } %>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
</body>
</html>
