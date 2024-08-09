<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select Project Chart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://images.unsplash.com/photo-1518655048521-f130df041f66?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            margin: 50px;
            padding: 0;
            height: 100vh;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 5px;
        }
        input[type="text"], input[type="date"], select {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 3px;
        }
        .btn {
            padding: 10px 20px;
            border-radius: 3px;
            color: white;
            background-color: #007bff;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s;
            border: none;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .hidden {
            display: none;
        }
    </style>
    <script>
        function showInputFields() {
            var type = document.getElementById("type").value;
            document.getElementById("dailyInputs").classList.add("hidden");
            document.getElementById("weeklyInputs").classList.add("hidden");
            document.getElementById("monthlyInputs").classList.add("hidden");
            
            document.getElementById("dailyDate").required = false;
            document.getElementById("weekMonth").required = false;
            document.getElementById("weekYear").required = false;
            document.getElementById("monthYear").required = false;
            
            if (type === "daily") {
                document.getElementById("dailyInputs").classList.remove("hidden");
                document.getElementById("dailyDate").required = true;
            } else if (type === "weekly") {
                document.getElementById("weeklyInputs").classList.remove("hidden");
                document.getElementById("weekMonth").required = true;
                document.getElementById("weekYear").required = true;
            } else if (type === "monthly") {
                document.getElementById("monthlyInputs").classList.remove("hidden");
                document.getElementById("monthYear").required = true;
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Select Project Chart</h1>
        <form action="GenerateProjectChartServlet" method="post">
            <label for="type">Select Time Period:</label>
            <select id="type" name="type" onchange="showInputFields()" required>
                <option value="" disabled selected>Select a time period</option>
                <option value="daily">Daily</option>
                <option value="weekly">Weekly</option>
                <option value="monthly">Monthly</option>
            </select>

            <label for="chartType">Select Chart Type:</label>
            <select id="chartType" name="chartType" required>
                <option value="" disabled selected>Select a chart type</option>
                <option value="pie">Pie Chart</option>
                <option value="bar">Bar Chart</option>
            </select>

            <div id="dailyInputs" class="hidden">
                <h2>Daily Chart (Pie Chart)</h2>
                <label for="dailyDate">Date:</label>
                <input type="date" id="dailyDate" name="dailyDate">
            </div>

            <div id="weeklyInputs" class="hidden">
                <h2>Weekly Chart (Bar Chart)</h2>
                <label for="weekMonth">Month:</label>
                <input type="text" id="weekMonth" name="weekMonth" placeholder="MM">
                
                <label for="weekYear">Year:</label>
                <input type="text" id="weekYear" name="weekYear" placeholder="YYYY">
            </div>

            <div id="monthlyInputs" class="hidden">
                <h2>Monthly Chart (Bar Chart)</h2>
                <label for="monthYear">Year:</label>
                <input type="text" id="monthYear" name="monthYear" placeholder="YYYY">
            </div>

            <input type="submit" value="Generate Chart" class="btn">
        </form>
    </div>
</body>
</html>
