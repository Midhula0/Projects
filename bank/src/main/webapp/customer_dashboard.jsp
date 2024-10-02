<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #ece9e6, #ffffff);
            margin: 0;
            padding: 0;
            height: 100vh;
        }
        .container {
            padding: 40px;
            max-width: 800px;
            margin-top: 80px;
        }
        h1 {
            color: #333;
            margin-bottom: 30px;
            font-weight: 600;
            text-align: center;
        }
        .dashboard-link {
            display: block;
            margin-bottom: 15px;
            padding: 15px;
            text-decoration: none;
            background-color: #007bff;
            color: white;
            border-radius: 8px;
            transition: background-color 0.3s, transform 0.3s;
            font-size: 16px;
            font-weight: 500;
            text-align: center;
        }
        .dashboard-link:hover {
            background-color: #0056b3;
            transform: scale(1.05);
            color:white;
        }
        .dashboard-link i {
            margin-right: 8px;
        }
        form input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 12px 25px;
            border: none;
            cursor: pointer;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            transition: background-color 0.3s, transform 0.3s;
            display: block;
            width: 100%;
            margin-top: 20px;
        }
        form input[type="submit"]:hover {
            background-color: #0056b3;
            transform: scale(1.05);
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
                    <a class="nav-link" href="customer_login.jsp"><i class="bi bi-box-arrow-right"></i> Logout</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container">
        <h1>Welcome to Your Dashboard</h1>
        <a href="ViewBalanceServlet" class="dashboard-link"><i class="bi bi-wallet2"></i>View Balance</a>
        <a href="ViewTransactionsServlet" class="dashboard-link"><i class="bi bi-list-ul"></i>View Transactions</a>
        <a href="WithdrawServlet" class="dashboard-link"><i class="bi bi-cash-stack"></i>Withdraw Money</a>
        <a href="DepositServlet" class="dashboard-link"><i class="bi bi-bank"></i>Deposit Money</a>
        <a href="delete_account.jsp" class="dashboard-link"><i class="bi bi-x-circle"></i>Delete Account</a>
        <form action="customer_login.jsp">
            <input type="submit" value="Logout" class="btn btn-primary">
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
