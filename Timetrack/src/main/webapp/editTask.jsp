<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Task</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Time Tracker</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"><a class="nav-link" href="dashboard.jsp">Dashboard</a></li>
                <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
            </ul>
        </div>
    </nav>
    <section class="container">
        <fieldset>
            <legend>Edit Task</legend>
            <form action="EditTaskServlet" method="post">
                <input type="hidden" name="taskId" value="${task.taskId}">
                <div class="form-group">
                    <label for="project">Project:</label>
                    <input type="text" class="form-control" id="project" name="project" value="${task.project}" required>
                </div>
                <div class="form-group">
                    <label for="taskDate">Date:</label>
                    <input type="date" class="form-control" id="taskDate" name="taskDate" value="${task.taskDate}" required>
                </div>
                <div class="form-group">
                    <label for="startTime">Start Time:</label>
                    <input type="time" class="form-control" id="startTime" name="startTime" value="${task.startTime}" required>
                </div>
                <div class="form-group">
                    <label for="endTime">End Time:</label>
                    <input type="time" class="form-control" id="endTime" name="endTime" value="${task.endTime}" required>
                </div>
                <div class="form-group">
                    <label for="category">Category:</label>
                    <input type="text" class="form-control" id="category" name="category" value="${task.category}" required>
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea class="form-control" id="description" name="description" required>${task.description}</textarea>
                </div>
                <button type="submit" class="btn btn-primary">Update Task</button>
            </form>
        </fieldset>
    </section>
</body>
</html>
