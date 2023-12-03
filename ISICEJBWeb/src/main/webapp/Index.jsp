<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion des Villes et Hôtels</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: linear-gradient(to bottom right, #ffcccc, #b3e0ff); /* Light pink and blue gradient */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

       .container {
            max-width: 800px; /* Increased max-width */
            width: 100%;
            background-color: rgba(255, 255, 255, 0.7); /* Transparent white (adjust alpha value for transparency) */
            padding: 30px; /* Increased padding */
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
            text-align: center;
        }

        h1 {
            text-align: center;
            color: #673AB7;
            font-size: 2.5em;
            margin-bottom: 20px;
            text-shadow: 2px 2px 2px #333;
        }

        input[type="submit"] {
            padding: 15px; /* Increased padding */
            text-decoration: none;
            color: white;
            border-radius: 5px; /* Increased border-radius */
            cursor: pointer;
            background-image: linear-gradient(to bottom right, #ff0066, #0044ff); 
            width: 100%; /* Make the button width 100% of the container */
            box-sizing: border-box;
            margin-top: 15px; /* Increased margin-top for spacing */
        }

        input[type="submit"]:hover {
            background-color: red;
        }

        .page-title {
            text-align: center;
            background-image: linear-gradient(to bottom right, #ff0066, #0044ff); /* Use the same gradient as the buttons */
            -webkit-background-clip: text; /* Clip the text to the gradient */
            color: transparent; /* Set the text color to transparent */
            font-size: 3em; /* Adjust the font size as needed */
            margin-top: 20px; /* Adjust the top margin for positioning */
        }
    </style>
</head>
<body>

    <div class="container">
        <h1 class="page-title">Gestion des Villes et Hôtels</h1>

        <form action="hotel.jsp" method="post">
            <input type="submit" value="Gérer les Hôtels">
        </form>

        <form action="ville.jsp" method="post">
            <input type="submit" value="Gérer les Villes">
        </form>

        <form action="hotelParVille.jsp" method="post">
            <input type="submit" value="Hotels par Ville">
        </form>
    </div>
</body>
</html>
