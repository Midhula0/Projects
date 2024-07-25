<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Task</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            padding-top: 20px;
            background-image: url('https://images.pexels.com/photos/5412/water-blue-ocean.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
        }
        .container {
            max-width: 600px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-control {
            margin-bottom: 10px;
        }
        .btn {
            margin-top: 20px;
        }
        h2 {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center"><i class="fas fa-tasks"></i> Add New Task</h2>
        <form action="AddTaskServlet" method="post">
            <div class="form-group">
                <label for="empId"><i class="fas fa-id-badge"></i> Employee ID:</label>
                <input type="text" class="form-control" id="empId" name="empId" required>
            </div>

            <div class="form-group">
                <label for="username"><i class="fas fa-user"></i> Username:</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>

            <div class="form-group">
                <label for="date"><i class="fas fa-calendar-alt"></i> Date:</label>
                <input type="date" class="form-control" id="date" name="date" required>
            </div>

            <div class="form-group">
                <label for="startTime"><i class="fas fa-clock"></i> Start Time:</label>
                <input type="time" class="form-control" id="startTime" name="startTime" required>
            </div>

            <div class="form-group">
                <label for="endTime"><i class="fas fa-clock"></i> End Time:</label>
                <input type="time" class="form-control" id="endTime" name="endTime" required>
            </div>

            <div class="form-group">
                <label for="numHours"><i class="fas fa-hourglass-half"></i> Number of Hours:</label>
                <input type="number" class="form-control" id="numHours" name="numHours" step="0.01" required>
            </div>

            <div class="form-group">
                <label for="category"><i class="fas fa-list"></i> Category:</label>
                <input type="text" class="form-control" id="category" name="category" required>
            </div>

            <div class="form-group">
                <label for="project"><i class="fas fa-project-diagram"></i> Project:</label>
                <input type="text" class="form-control" id="project" name="project" required>
            </div>

            <button type="submit" class="btn btn-primary btn-block"><i class="fas fa-plus"></i> Add Task</button>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
