<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Task</title>
    <!-- Load Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Load Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://images.unsplash.com/photo-1518655048521-f130df041f66?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            margin: 0;
            padding: 20px;
            height: 100vh;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input[type="text"],
        .form-group input[type="date"],
        .form-group input[type="time"],
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-group input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }
        .form-group input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .alert {
            margin-bottom: 20px;
        }
        .alert-danger {
            color: #721c24;
            background-color: #f8d7da;
            border-color: #f5c6cb;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><i class="fas fa-tasks"></i> Add Task</h1>
        
        <% 
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null && !errorMessage.isEmpty()) {
        %>
        <div class="alert alert-danger" role="alert">
            <i class="fas fa-exclamation-triangle"></i> <%= errorMessage %>
        </div>
        <% } %>
        
        <form action="AddTaskServlet" method="post">
            <div class="form-group">
                <label for="date">Date <i class="fas fa-calendar-day"></i></label>
                <input type="date" id="date" name="date" required>
            </div>
            <div class="form-group">
                <label for="startTime">Start Time <i class="fas fa-clock"></i></label>
                <input type="time" step="1" id="startTime" name="startTime" required>
            </div>
            <div class="form-group">
                <label for="endTime">End Time <i class="fas fa-clock"></i></label>
                <input type="time" step="1" id="endTime" name="endTime" required>
            </div>
            <!-- Display Num Hours (Read-only) -->
            <div class="form-group">
                <label for="numHours">Duration (Hours) <i class="fas fa-hourglass-half"></i></label>
                <input type="text" id="numHours" name="numHours" readonly>
            </div>
            <div class="form-group">
                <label for="category">Category <i class="fas fa-tags"></i></label>
                <input type="text" id="category" name="category" required>
            </div>
            <div class="form-group">
                <label for="project">Project <i class="fas fa-project-diagram"></i></label>
                <input type="text" id="project" name="project" required>
            </div>
            <input type="submit" value="Add Task">
        </form>
    </div>

    <!-- Load Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <!-- Script to calculate and display num_hours -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const startTimeInput = document.getElementById('startTime');
            const endTimeInput = document.getElementById('endTime');
            const numHoursInput = document.getElementById('numHours');

            startTimeInput.addEventListener('change', calculateNumHours);
            endTimeInput.addEventListener('change', calculateNumHours);

            function calculateNumHours() {
                const startTime = startTimeInput.value;
                const endTime = endTimeInput.value;

                if (startTime && endTime) {
                    const startParts = startTime.split(':');
                    const endParts = endTime.split(':');

                    const startHour = parseInt(startParts[0], 10);
                    const startMinute = parseInt(startParts[1], 10);
                    const startSecond = parseInt(startParts[2], 10);

                    const endHour = parseInt(endParts[0], 10);
                    const endMinute = parseInt(endParts[1], 10);
                    const endSecond = parseInt(endParts[2], 10);

                    const startDate = new Date(0, 0, 0, startHour, startMinute, startSecond);
                    const endDate = new Date(0, 0, 0, endHour, endMinute, endSecond);

                    let diff = (endDate.getTime() - startDate.getTime()) / 1000 / 60 / 60;
                    if (diff < 0) {
                        diff += 24;
                    }

                    numHoursInput.value = diff.toFixed(2);
                } else {
                    numHoursInput.value = '';
                }
            }
        });
    </script>
</body>
</html>
