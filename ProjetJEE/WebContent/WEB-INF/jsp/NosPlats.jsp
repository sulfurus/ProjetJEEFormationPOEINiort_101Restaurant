<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList,java.util.List"%>
<%@ page import="fr.Eni.javaee.restaurant.bll.PlatManager"%>
<%@ page import="fr.Eni.javaee.restaurant.bo.Plat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nos plats</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

</head>
<body class="container">
	<div id ="PlatCarousel" class="col-8 offset-md-2 mt-4">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<%
					PlatManager platManager = new PlatManager();
					List<Plat> listePlat = new ArrayList<Plat>();
					listePlat = (List<Plat>) request.getAttribute("listePlat");

					Boolean isActif = true;
					for (Plat plat : listePlat) {
				%><div id="<%=plat.getId()%>"
					class="carousel-item <%if (isActif) {
					isActif = false;%>active<%}%>"
					onclick="AfficherDetail(<%=plat.getId()%>)">
					<img class="d-block w-100"
						src="<%=request.getContextPath()%>/image/<%=plat.getImageURL()%>"
						alt="<%=plat.getNom()%>">
					<div class="carousel-caption d-none d-md-block">
						<h5><%=plat.getNom()%></h5>
					</div>
				</div>


				<%
					}
				%>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<script src="jquery/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		function AfficherDetail(idPlat) {
			
			console.log(idPlat);
			
			
			
			
			$.getJSON("${pageContext.request.contextPath}"+"/rest/plats/"+idPlat, function(data){
				
				$.each(data, function(){
					ajouterBaliseNote(this);
				});
			});
			
		}
		
		
		function ajouterBaliseNote(plat) {
			var newContent = '<div class="col-md-4 note" id="card' + plat.id + '">' +
			'	<div class="card">' +
			'	<div class="card-header">' +
			'	<h3>' + plat.nom + '</h3>' +
			'	</div>' +
			'	<div class="card-body">' +
			'	<textarea id="txt' + plat.id + '" class="col-12" onkeyup="updateNote(' + plat.id + ')">'  + plat.presentation + '</textarea>' +
			'	</div>' +
			'	<div class="card-footer">' +
			'	</div>' +
			'	</div>' +
			'</div>';

			$("#PlatCarousel").append(newContent);
			}


		// grace a l'id IDELEMENT
		// REquete Javascript pour recuperer les informations du plats
		// + RFecuperation de ses avis, note moyenne
	</script>
</body>
</html>