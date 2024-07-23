<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Time Tracker</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"><a class="nav-link" href="viewTasks.jsp">View Tasks</a></li>
                <li class="nav-item"><a class="nav-link" href="addTask.jsp">Add Task</a></li>
                <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
            </ul>
        </div>
    </nav>
    <section class="container">
        <h2>Dashboard</h2>
        <div class="row">
            <div class="col-md-6">
                <h3>Tasks Overview</h3>
                <canvas id="tasksChart"></canvas>
            </div>
            <div class="col-md-6">
                <h3>Time Overview</h3>
                <canvas id="timeChart"></canvas>
            </div>
        </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Sample data for charts
        const taskData = {
            labels: ['Meeting', 'Training', 'Development', 'Review'],
            datasets: [{
                label: 'Tasks',
                data: [5, 10, 3, 2],
                backgroundColor: ['red', 'blue', 'green', 'yellow']
            }]
        };

        const timeData = {
            labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'],
            datasets: [{
                label: 'Hours',
                data: [8, 7, 6, 5, 4],
                backgroundColor: 'blue'
            }]
        };

        const taskConfig = {
            type: 'pie',
            data: taskData
        };

        const timeConfig = {
            type: 'bar',
            data: timeData
        };

        const taskChart = new Chart(document.getElementById('tasksChart'), taskConfig);
        const timeChart = new Chart(document.getElementById('timeChart'), timeConfig);
    </script>
</body>
</html>
