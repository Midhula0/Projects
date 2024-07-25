<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Task" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weekly Tasks Chart</title>
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
        .form-group {
            margin-bottom: 20px;
        }
        .alert {
            margin-top: 20px;
        }
    </style>
    <script type="text/javascript">
        google.charts.load('current', {packages: ['corechart', 'bar']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Week', 'Hours'],
                <% 
                    List<Task> tasks = (List<Task>) request.getAttribute("tasks");
                    if (tasks != null) {
                        double[] weeklyHours = new double[52];
                        for (Task task : tasks) {
                            int week = task.getWeekNumber() - 1; // Adjust week number to zero-based index
                            weeklyHours[week] += task.getNumHours();
                        }
                        for (int i = 0; i < 52; i++) {
                            out.print("['Week " + (i + 1) + "', " + weeklyHours[i] + "],");
                        }
                    }
                %>
            ]);

            var options = {
                title: 'Weekly Tasks for the Year',
                chartArea: {width: '50%'},
                hAxis: {
                    title: 'Total Hours',
                    minValue: 0
                },
                vAxis: {
                    title: 'Week'
                }
            };

            var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-4">Weekly Tasks Chart</h1>
        <form action="WeeklyTasksChartServlet" method="get" class="mb-4">
            <div class="form-group">
                <label for="year">Select Year:</label>
                <input type="number" id="year" name="year" min="2000" max="2100" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary"><i class="bi bi-calendar"></i> Show Chart</button>
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
