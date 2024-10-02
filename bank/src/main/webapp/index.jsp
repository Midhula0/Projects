<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Banking Application - Choose Role</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('https://images.unsplash.com/photo-1521540216272-a50305cd4421') no-repeat center center fixed; /* Banking-related image */
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #ffffff;
        }
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6); /* Darker overlay */
            backdrop-filter: blur(5px); /* Blur effect */
        }
        .container {
            position: relative;
            z-index: 1;
            background-color: rgba(255, 255, 255, 0.2);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }
        h1 {
            color: #ffffff;
            margin-bottom: 20px;
            font-size: 24px;
        }
        p {
            color: #e0e0e0;
            font-size: 18px;
            margin-bottom: 30px;
        }
        .btn-custom {
            display: inline-block;
            padding: 12px 25px;
            margin: 10px;
            color: #ffffff;
            background-color: #007bff;
            border: none;
            border-radius: 50px;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, box-shadow 0.3s;
        }
        .btn-custom:hover {
            background-color: #0056b3;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="overlay"></div>
    <div class="container">
        <h1>Banking Application</h1>
        <p>Please choose your role to continue:</p>
        <a href="admin_login.jsp" class="btn btn-custom">Admin Login</a>
        <a href="customer_login.jsp" class="btn btn-custom">Customer Login</a>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
