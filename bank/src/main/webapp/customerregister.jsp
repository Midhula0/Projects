<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Registration</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            
        }
        
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 600px;
        }
        
        h1 {
            text-align: center;
            color: #333;
        }
        
        form {
            display: flex;
            flex-direction: column;
        }
        
        label {
            font-weight: bold;
            margin-bottom: 8px;
        }
        
        input[type="text"], input[type="email"], input[type="number"], input[type="radio"], input[type="date"] {
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        select {
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        textarea {
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
            margin: 20px;
        }
        
        input[type="submit"]:hover {
            background-color: #45a049;
        }
</style>
</head>
<body>
<div class="container">
    <h1>Add User Detail</h1>
    <form action="CustomerRegisterServlet" method="post">
        <label for="name">Full Name:</label>
        <input type="text" id="name" name="fullname" required>
        
        <label for="address">Address:</label>
        <textarea id="w3review" name="address" rows="3" cols="50"></textarea>
        
        <label for="mobile">Mobile NO:</label>
        <input type="number" id="mobileno" name="mobileno">
        
        <label for="email">Email Id:</label>
        <input type="email" id="email" name="email" required>
        
        <label for="account">Account type:</label>
        <select name="type">
            <option value="Saving">Saving</option>
            <option value="Current">Current</option>
        </select>
        
        <label for="DOB">Date Of Birth:</label>
        <input type="date" id="DOB" name="DOB">
        
        <label for="id">Aadhar No:</label>
        <input type="text" id="aadharno" name="aadhar" required>
        
        <label for="accountno">Account No:</label>
        <input type="text" id="accountno" name="accountno" required>
       
        
        <input type="submit" value="Submit">
    </form>
</div>
</body>
</html>
