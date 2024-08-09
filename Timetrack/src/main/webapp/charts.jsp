<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Task Charts</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
    <div class="container">
        <h1 class="my-4">Task Charts</h1>

        <div class="form-group">
            <label for="period">Select Period</label>
            <select id="period" class="form-control">
                <option value="daily">Daily</option>
                <option value="weekly">Weekly</option>
                <option value="monthly">Monthly</option>
            </select>
        </div>

        <canvas id="taskChart"></canvas>
    </div>

    <script>
        $(document).ready(function() {
            function fetchChartData(period) {
                $.post('ChartDataServlet', { employeeId: '121', period: period }, function(data) {
                    const labels = data.map(item => item.label);
                    const values = data.map(item => item.value);

                    const ctx = document.getElementById('taskChart').getContext('2d');
                    new Chart(ctx, {
                        type: period === 'daily' ? 'pie' : 'bar',
                        data: {
                            labels: labels,
                            datasets: [{
                                label: 'Hours',
                                data: values,
                                backgroundColor: period === 'daily' ? 'rgba(75, 192, 192, 0.2)' : 'rgba(153, 102, 255, 0.2)',
                                borderColor: period === 'daily' ? 'rgba(75, 192, 192, 1)' : 'rgba(153, 102, 255, 1)',
                                borderWidth: 1
                            }]
                        },
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    });
                });
            }

            $('#period').change(function() {
                fetchChartData($(this).val());
            });

            // Fetch default data
            fetchChartData('daily');
        });
    </script>
</body>
</html>
