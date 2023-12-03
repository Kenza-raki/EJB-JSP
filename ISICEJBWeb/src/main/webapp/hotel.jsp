<%@page import="entities.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotels Management</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-image: linear-gradient(to bottom right, #ffcccc, #b3e0ff);
	/* Light pink and blue gradient */
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
	background-color: transparent;
	/* Set table background to transparent */
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
	background-image: linear-gradient(to bottom right, #ff0066, #0044ff);
	/* Dark pink and blue gradient for buttons */
	color: white;
}

.btn:hover {
	opacity: 0.8;
}

.btn-primary {
	background-image: linear-gradient(to bottom right, #ff0066, #0044ff);
	/* Dark pink and blue gradient for primary buttons */
}

.btn-danger {
	background-image: linear-gradient(to bottom right, #ff0066, #0044ff);
	/* Dark pink and blue gradient for danger buttons */
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
	background-image: linear-gradient(to bottom right, #ff0066, #0044ff);
	/* Use the same gradient as the buttons */
	-webkit-background-clip: text; /* Clip the text to the gradient */
	color: transparent; /* Set the text color to transparent */
	font-size: 3em; /* Adjust the font size as needed */
	margin-top: 20px; /* Adjust the top margin for positioning */
}
</style>

<script>
    function showUpdatePopup(id, currentName, currentAdresse, currentPhone) {
        var newHotelName = prompt("Enter the new hotel name:", currentName);
        var newHotelAdresse = prompt("Enter the new hotel address:", currentAdresse);
        var newHotelPhone = prompt("Enter the new hotel phone:", currentPhone);

        if (newHotelName !== null && newHotelAdresse !== null && newHotelPhone !== null) {
            // Use AJAX to submit the form
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'HotelController', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                	 location.reload();
                }
            };

            // Prepare form data
            var formData = 'action=updateWithPopup&id=' + encodeURIComponent(id)
                + '&newHotelName=' + encodeURIComponent(newHotelName)
                + '&newHotelAdresse=' + encodeURIComponent(newHotelAdresse)
                + '&newHotelPhone=' + encodeURIComponent(newHotelPhone);
            xhr.send(formData);
        }
    }
</script>
<!-- ... your existing code ... -->

<script>
    function filterTableByVille() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("villeFilterInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("hotelsTable");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[4]; // Assuming Ville is the 4th column
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
</script>


<!-- ... your existing code ... -->

<script>
    function confirmDelete(id) {
        var result = confirm("Do you really want to delete this hotel?");
        return result;
    }
</script>

</head>
<body>

	<div class="center-form">
    <form action="HotelController" method="post">
        <!-- Your existing form fields -->
        <label for="nom"><strong>Nom :</strong></label> <input type="text" id="nom" name="nom" />
        <label for="adresse"><strong>Adresse :</strong></label> <input type="text" id="adresse" name="adresse" />
        <label for="telephone"><strong>Téléphone :</strong></label> <input type="text" id="telephone" name="telephone" />
        <label for="Ville"><strong>Ville :</strong></label>
        <select id="ville" name="ville">
            <c:forEach var="v" items="${villes}">
                <option value="${v.id}">${v.nom}</option>
            </c:forEach>
        </select>

       
        <!-- Your existing "Enregistrer" button -->
        <button type="submit" name="action" value="enregistrer" class="btn btn-primary">Enregistrer</button>
        
        
    </form>
    
    
</div>
<div class="center-form">
 <form>
  <!-- Ville filter input and Admit button -->
        <label for="VilleFilter"><strong>Ville Filter:</strong></label>
        <input type="text" id="villeFilterInput" placeholder="Filter by Ville..">
        <button type="button" onclick="filterTableByVille()" class="btn btn-primary">Admit</button>
        
</form>
</div>
	<h1 class="page-title">Liste des hotels :</h1>

	<table id="hotelsTable">
		<thead>
			<tr>
				<th>ID</th>
				<th>Nom</th>
				<th>Adresse</th>
				<th>Téléphone</th>
				<th>Ville</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${hotels}" var="h">
				<tr>
					<td>${h.id}</td>
					<td>${h.nom}</td>
					<td>${h.adresse}</td>
					<td>${h.telephone}</td>
					<td>${h.ville.nom}</td>
					<td>
						<form>
							<a href="javascript:void(0);"
								onclick="showUpdatePopup(${h.id}, '${h.nom}', '${h.adresse}', '${h.telephone}');"
								class="btn btn-primary">Modifier</a>
						</form>
						<form action="HotelController" method="post"
							onsubmit="return confirmDelete(${h.id});">
							<input type="hidden" name="action" value="delete"> <input
								type="hidden" name="id" value="${h.id}">
							<button type="submit" class="btn btn-danger">Supprimer</button>
						</form>
					</td>
				</tr>
			</c:forEach>
			
		</tbody>
	</table>

</body>
</html>
