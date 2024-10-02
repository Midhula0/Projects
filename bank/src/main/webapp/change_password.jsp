<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Change Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 50px;
        }
        form {
            max-width: 300px;
            margin: auto;
        }
        input[type=text], input[type=password] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 20px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            width: 100%;
        }
    </style>
</head>
<body>

<h2>Change Password</h2>

<form action="changePassword" method="post">
    <div class="container">
        <label for="accountNo"><b>Account Number</b></label>
        <input type="text" placeholder="Enter Account Number" name="accountNo" required>

        <label for="tempPassword"><b>Temporary Password</b></label>
        <input type="password" placeholder="Enter Temporary Password" name="tempPassword" required>

        <label for="newPassword"><b>New Password</b></label>
        <input type="password" placeholder="Enter New Password" name="newPassword" required>

        <button type="submit">Change Password</button>
    </div>
</form>


</body>
</html>