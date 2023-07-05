<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>User Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="Accueil.jsp" class="navbar-brand">Acceuil</a>
			</div>

			<ul class="navbar-nav">
				<li><a href="Table.jsp"
					class="nav-link">Salles</a></li>
					<li><a href="AfficheContact.jsp"
					class="nav-link">Boîte email</a></li>
			</ul>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
	            <caption>
					<h2>Ajouter Nouveau Salles</h2>
				</caption>
				  <form action="uploadImage" method="post" enctype="multipart/form-data">
					<input type="hidden" name="id" value="<c:out value='${salle.idSalles}'/>" />
				<fieldset class="form-group">
					<label>Nom Salle</label> <input type="text"
						value="<c:out value='${salle.NomSalle}'/>" class="form-control"
						name="NomSalle" required="required">
				</fieldset>
				<fieldset class="form-group">
					<label>Etage Salle</label> <input type="text"
						value="<c:out value='${salle.NomEtage}' />" class="form-control"
						name="NomEtage">
				</fieldset>
				<fieldset class="form-group" >
					<label>Description</label>
					<input type="text"
						value="<c:out value='${salle.Description}' />" class="form-control"
						name="Description" placeholder="Ecrire Les Description de la salle ...">
				</fieldset>
				 <b>Upload | <a href="Table.jsp">View</a></b><br/><br/>
             
				 <input type="file" name="image" required="required"/><br/><br/>
				 <button type="submit" class="btn btn-success" >Save</button>
        </form>
			</div>
		</div>
	</div>
</body>
</html>
