<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.model.Task" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project Tasks Chart</title>
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
        .chart-title {
            margin-bottom: 20px;
        }
    </style>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var chartData = [];
            var chartOptions = { title: '', is3D: true };
            var chart;

            <% 
                String chartType = (String) request.getAttribute("type");
                if ("daily".equals(chartType)) {
                    %>
                    chartData.push(['Project', 'Hours']);
                    <% 
                        List<Task> tasks = (List<Task>) request.getAttribute("tasks");
                        if (tasks != null && !tasks.isEmpty()) {
                            Map<String, Double> projectHours = new HashMap<>();
                            for (Task task : tasks) {
                                String project = task.getProject();
                                Double hours = task.getNumHours();
                                projectHours.put(project, projectHours.getOrDefault(project, 0.0) + hours);
                            }
                            for (Map.Entry<String, Double> entry : projectHours.entrySet()) {
                                %>
                                chartData.push(['<%= entry.getKey() %>', <%= entry.getValue() %>]);
                                <% 
                            }
                        } else {
                            %>
                            chartData.push(['No Data', 0]);
                            <% 
                        }
                        %>
                        chartOptions.title = 'Daily Project Tasks Distribution';
                        chart = new google.visualization.PieChart(document.getElementById('chart_div'));
                        <% 
                } else if ("weekly".equals(chartType) || "monthly".equals(chartType)) {
                    %>
                    chartData.push(['Project', 'Hours']);
                    <% 
                        Map<String, Double> projectHours = (Map<String, Double>) request.getAttribute("projectHours");
                        if (projectHours != null && !projectHours.isEmpty()) {
                            for (Map.Entry<String, Double> entry : projectHours.entrySet()) {
                                %>
                                chartData.push(['<%= entry.getKey() %>', <%= entry.getValue() %>]);
                                <% 
                            }
                        } else {
                            %>
                            chartData.push(['No Data', 0]);
                            <% 
                        }
                        if ("weekly".equals(chartType)) {
                            %>
                            chartOptions.title = 'Weekly Project Hours';
                            chart = new google.visualization.BarChart(document.getElementById('chart_div'));
                            <% 
                        } else if ("monthly".equals(chartType)) {
                            %>
                            chartOptions.title = 'Monthly Project Hours';
                            chart = new google.visualization.BarChart(document.getElementById('chart_div'));
                            <% 
                        }
                }
            %>

            var data = google.visualization.arrayToDataTable(chartData);
            chart.draw(data, chartOptions);
        }
    </script>
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-4">Project Tasks Chart</h1>
        <div id="chart_div" class="chart-container"></div>
    </div>

    <!-- Load Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
