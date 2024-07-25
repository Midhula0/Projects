<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.UserDao" %>
<%@ page import="com.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Employees</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://images.pexels.com/photos/5412/water-blue-ocean.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
            background-size: cover;
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
    </style>
</head>
<body>
    <div class="container">
        <h1 class="my-4">View Employees</h1>
        <div class="card">
            <div class="card-body">
                <table class="table table-striped table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Role</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            UserDao userDao = new UserDao();
                            List<User> employees = userDao.getUsersByRole("employee");
                            for (User employee : employees) {
                        %>
                        <tr>
                            <td><%= employee.getEmpId() %></td>
                            <td><%= employee.getUsername() %></td>
                            <td><%= employee.getRole() %></td>
                            <td class="actions">
                                <a href="DeleteEmployeeServlet?empId=<%= employee.getEmpId() %>" class="btn btn-danger btn-sm" data-toggle="tooltip" title="Delete">
                                    <i class="fas fa-trash-alt"></i>
                                </a>
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
