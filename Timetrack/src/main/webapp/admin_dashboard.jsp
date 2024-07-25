<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
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
            font-family: 'Arial', sans-serif;
        }
        .container {
            margin-top: 50px;
        }
        .navbar-nav .nav-item + .nav-item {
            margin-left: 15px;
        }
        .card {
            margin-bottom: 20px;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .btn-custom {
            background-color: #6c757d;
            color: white;
        }
        .btn-custom:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <a class="navbar-brand" href="admin_dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Admin Dashboard</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp"><i class="fas fa-eye"></i> Logout</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href=""><i class="fas fa-chart-bar"></i> Home</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <div class="jumbotron">
            <h1 class="display-4">Welcome to the Admin Dashboard</h1>
            <p class="lead">Select an option from the navigation menu to get started.</p>
            <hr class="my-4">
            <p>Manage employees, tasks, and view analytics with ease.</p>
            <a class="btn btn-primary btn-lg" href="addEmployee.jsp" role="button">Add Employees</a>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-users fa-3x"></i></h5>
                        <p class="card-text">View and manage employees.</p>
                        <a href="viewEmployees.jsp" class="btn btn-primary">Go to Employees</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-tasks fa-3x"></i></h5>
                        <p class="card-text">Add and view tasks.</p>
                        <a href="viewTasks.jsp" class="btn btn-primary">Go to Tasks</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-chart-bar fa-3x"></i></h5>
                        <p class="card-text">View performance charts.</p>
                        <a href="viewCharts.jsp" class="btn btn-primary">Go to Charts</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
