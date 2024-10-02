<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Success</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.css">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f8ff;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
    }
    .container {
        text-align: center;
        background-color: #ffffff;
        padding: 40px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        border-radius: 10px;
        max-width: 600px;
        width: 100%;
    }
    h2 {
        color: #2c3e50;
        margin-bottom: 20px;
    }
    .dashboard-link {
        display: block;
        margin-bottom: 15px;
        padding: 10px;
        text-decoration: none;
        background-color: #007bff;
        color: white;
        border-radius: 8px;
        transition: background-color 0.3s, transform 0.3s;
        font-size: 16px;
        font-weight: 500;
    }
    .dashboard-link:hover {
        background-color: #0056b3;
        transform: scale(1.05);
        color: white;
    }
    .dashboard-link i {
        margin-right: 8px;
    }
    .navbar-nav .nav-link {
        color: #fff !important;
    }
</style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <a class="navbar-brand" href="#">Banking Application</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="bi bi-house-door"></i> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="bi bi-person-circle"></i> Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="bi bi-gear"></i> Settings</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp"><i class="bi bi-box-arrow-right"></i> Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <h2>Welcome!</h2>
        <a href="admin_register_customer.jsp" class="dashboard-link"><i class="bi bi-person-plus"></i> Register Customer</a>
        <a href="view_customers.jsp" class="dashboard-link"><i class="bi bi-eye"></i> View Customer</a>
        <a href="modify_customer.jsp" class="dashboard-link"><i class="bi bi-pencil"></i> Modify Customer</a>
        <a href="delete_customer.jsp" class="dashboard-link"><i class="bi bi-trash"></i> Delete Customer</a>
        <a href="index.jsp" class="dashboard-link"><i class="bi bi-house-door"></i> Go to Home</a>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
