<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Customer Management</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 20px;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1, h2 {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .btn {
            padding: 5px 10px;
            margin: 2px;
            border-radius: 4px;
        }

        .btn-edit {
            background-color: #4CAF50;
            color: white;
        }

        .btn-delete {
            background-color: #f44336;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Dashboard - Customer Management</h1>
        <div class="d-flex justify-content-between">
            <h2>All Customers</h2>
            <a href="customerregister.jsp" class="btn btn-primary">Add New Customer</a>
            <a href="LogoutServlet" class="btn btn-secondary">Logout</a>
        </div>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Address</th>
                    <th>Email</th>
                    <th>Mobile Number</th>
                    <th>ID Proof</th>
                    <th>Account Type</th>
                    <th>Date of Birth</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="customer" items="${customers}">
                    <tr>
                        <td>${customer.id}</td>
                        <td>${customer.fullName}</td>
                        <td>${customer.address}</td>
                        <td>${customer.email}</td>
                        <td>${customer.mobile}</td>
                        <td>${customer.idProof}</td>
                        <td>${customer.accountType}</td>
                        <td>${customer.dob}</td>
                        <td>
                            <a href="CustomerRegisterServlet?action=edit&id=${customer.id}" class="btn btn-edit">Edit</a>
                            <a href="CustomerRegisterServlet?action=delete&id=${customer.id}" class="btn btn-delete">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
