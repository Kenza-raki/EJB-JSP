<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Hotels Par Ville</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: linear-gradient(to bottom right, #ffcccc, #b3e0ff);
        }

        .page-title {
           text-align: center;
	background-image: linear-gradient(to bottom right, #ff0066, #0044ff);
	/* Use the same gradient as the buttons */
	-webkit-background-clip: text; /* Clip the text to the gradient */
	color: transparent; /* Set the text color to transparent */
	font-size: 4em; /* Adjust the font size as needed */
	margin-top: 20px; /* Adjust the top margin for positioning */
	
        }

        .chart-container {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: row;
        }

        .chart-text {
            flex: 1;
            text-align: center;
            padding: 20px;
        }
    </style>
</head>

<body>
    <div class="page-title">Nombre des Hotels par Ville</div>
    
  

    <div class="chart-container">
        
        <canvas id="hotelChart" width="450" height="470"></canvas>
        
    </div>

    <script>
        var labels = ["El jadida", "Casablanca", "Rabat", "Marakech"];
        var data = [3, 2, 5, 1];

        var ctx = document.getElementById('hotelChart').getContext('2d');
        var hotelChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Number of Hotels',
                    data: data,
                    backgroundColor: [
                        'rgba(173, 216, 230, 0.7)',  // Light Blue
                        'rgba(70, 130, 180, 0.7)',   // Steel Blue
                        'rgba(255, 192, 203, 0.7)',  // Light Pink
                        'rgba(219, 112, 147, 0.7)',  // Pale Violet Red
                        'rgba(135, 206, 250, 0.7)'   // Light Sky Blue
                    ],
                    borderColor: [
                    	'rgba(0, 0, 0, 1)',   // Black border
                        'rgba(0, 0, 0, 1)',
                        'rgba(0, 0, 0, 1)',
                        'rgba(0, 0, 0, 1)',
                        'rgba(0, 0, 0, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                maintainAspectRatio: false,
                responsive: true,
                plugins: {
                    legend: {
                        display: true,
                        position: 'bottom'
                    }
                }
            }
        });
    </script>
</body>

</html>
