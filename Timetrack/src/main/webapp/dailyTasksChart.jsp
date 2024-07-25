<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Task" %>
<%@ page import="com.dao.TaskDao" %>
<%@ page import="java.sql.Date" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daily Tasks Chart</title>
    <!-- Load Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Load Google Charts API -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <!-- Load Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 20px;
        }
        .container {
            max-width: 960px;
        }
        .chart-container {
            margin: 20px 0;
        }
        .task-list-item {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }
        .task-list-item:last-child {
            border-bottom: none;
        }
    </style>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            // Fetch data from the servlet
            var tasksData = [
                ['Category', 'Hours']
                <% 
                    if (request.getAttribute("tasks") != null) {
                        List<Task> tasks = (List<Task>) request.getAttribute("tasks");
                        for (Task task : tasks) {
                %>
                ,['<%= task.getCategory() %>', <%= task.getNumHours() %>]
                <%       }
                    }
                %>
            ];

            var data = google.visualization.arrayToDataTable(tasksData);

            var options = {
                title: 'Daily Tasks Distribution',
                is3D: true,
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

            chart.draw(data, options);
        }
    </script>
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-4">Daily Tasks Chart</h1>
        <form method="get" action="DailyTasksChartServlet" class="mb-4">
            <div class="form-group">
                <label for="date">Select Date:</label>
                <input type="date" id="date" name="date" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary"><i class="bi bi-calendar"></i> Generate Chart</button>
        </form>

        <div id="piechart" class="chart-container"></div>

        <% 
            if (request.getAttribute("tasks") != null) {
                List<Task> tasks = (List<Task>) request.getAttribute("tasks");
        %>
        <h2 class="mb-4">Tasks for <%= request.getParameter("date") %></h2>
        <ul class="list-unstyled">
            <% if (tasks.isEmpty()) { %>
                <li class="alert alert-info">No tasks found for <%= request.getParameter("date") %>.</li>
            <% } else { %>
                <% for (Task task : tasks) { %>
                    <li class="task-list-item">
                        <strong>Task ID:</strong> <%= task.getId() %> 
                        <br><strong>Category:</strong> <%= task.getCategory() %> 
                        <br><strong>Hours:</strong> <%= task.getNumHours() %>
                    </li>
                <% } %>
            <% } %>
        </ul>
        <% } %>
    </div>

    <!-- Load Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
