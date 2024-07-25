<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Task" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Monthly Tasks Chart</title>
    <!-- Load Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Load Google Charts API -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
        .form-group {
            margin-bottom: 20px;
        }
        .alert {
            margin-top: 20px;
        }
    </style>
    <script type="text/javascript">
        google.charts.load('current', {packages: ['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Month', 'Hours'],
                <% 
                    List<List<Task>> monthlyTasks = (List<List<Task>>) request.getAttribute("monthlyTasks");
                    if (monthlyTasks != null) {
                        double[] monthlyHours = new double[12];
                        for (int month = 0; month < monthlyTasks.size(); month++) {
                            List<Task> tasks = monthlyTasks.get(month);
                            for (Task task : tasks) {
                                monthlyHours[month] += task.getNumHours();
                            }
                        }
                        for (int i = 0; i < 12; i++) {
                            out.print("['Month " + (i + 1) + "', " + monthlyHours[i] + "],");
                        }
                    }
                %>
            ]);

            var options = {
                title: 'Monthly Tasks for the Year',
                pieHole: 0.4 // Makes it a donut chart; remove this line for a regular pie chart
            };

            var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-4">Monthly Tasks Chart</h1>
        <form action="MonthlyTasksChartServlet" method="get" class="mb-4">
            <div class="form-group">
                <label for="year">Select Year:</label>
                <input type="number" id="year" name="year" min="2000" max="2100" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Show Chart</button>
        </form>
        <div id="chart_div" class="chart-container"></div>
        <% 
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
        <div class="alert alert-info"><%= message %></div>
        <% 
            }
        %>
    </div>

    <!-- Load Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
