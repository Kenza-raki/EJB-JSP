<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>City Management</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-image: linear-gradient(to bottom right, #ffcccc, #b3e0ff); /* Light pink and blue gradient */
        margin: 0;
        padding: 20px;
    }

    h1 {
        text-align: center;
        color: #333;
    }

    form {
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background-color: transparent; /* Set table background to transparent */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid black;
        background-color: transparent; /* Set cell background to transparent */
    }

    th {
        background-color: #b19cd9;
    }

    td:last-child {
        text-align: center;
    }

    .btn {
        padding: 8px 16px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        text-decoration: none;
        background-image: linear-gradient(to bottom right, #ff0066, #0044ff); /* Dark pink and blue gradient for buttons */
        color: white;
    }

    .btn:hover {
        opacity: 0.8;
    }
    
    .btn-primary {
        background-image: linear-gradient(to bottom right, #ff0066, #0044ff); /* Dark pink and blue gradient for primary buttons */
    }

    .btn-danger {
        background-image: linear-gradient(to bottom right, #ff0066, #0044ff); /* Dark pink and blue gradient for danger buttons */
    }
    .center-form {
    text-align: center;
}

form {
    display: inline-block;
    text-align: left;
}

label strong {
    font-weight: bold;
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


    <script>
    function showUpdatePopup(id) {
        var newVilleName = prompt("Enter the new city name:");
        if (newVilleName !== null) {
            document.getElementById("newVilleName_" + id).value = newVilleName;
            document.getElementById("updateForm_" + id).submit();
        }
    }
</script>
  <script>
        function confirmDelete(id) {
            var result = confirm("Do you really want to delete this ville?");
            return result;
        }
    </script>
</head>
<body>

    
    <div class="center-form">
    <form action="VilleController" method="post">
        <label for="nom"><strong>Nom :</strong></label>
        <input type="text" id="nom" name="nom" />
        <button type="submit" name="action" value="enregistrer" class="btn btn-primary">Enregistrer</button> 
    </form>
</div>

    <h1 class="page-title">Liste des villes :</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${villes}" var="v">
    <tr>
        <td>${v.id}</td>
        <td>${v.nom}</td>
        <td>
            <a href="javascript:void(0);" onclick="showUpdatePopup(${v.id}, '${v.nom}');" class="btn btn-primary">Modifier</a>
            <div style="display: flex; align-items: center;">
                <!-- Update Form -->
               <div class="button-container">
    <form id="updateForm_${v.id}" action="VilleController" method="post" >
        <input type="hidden" name="action" value="updateWithPopup">
        <input type="hidden" name="id" value="${v.id}">
        <input type="hidden" id="newVilleName_${v.id}" name="newVilleName" value="">
        <!-- You can add a button here if needed -->
    </form>

    <!-- Delete Form -->
    <form action="VilleController" method="post" onsubmit="return confirmDelete(${v.id});" class="inline-form">
        <input type="hidden" name="action" value="delete">
        <input type="hidden" name="id" value="${v.id}">
        <button type="submit" class="btn btn-danger">Supprimer</button>
    </form>
</div>

            </div>
        </td>
    </tr>
</c:forEach>

            
          
        </tbody>
        
    </table>

</body>
</html>