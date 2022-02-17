<%@ page import="java.util.List" %>
<%@ page import="com.a2bsystem.models.Constantes" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>2B ORDER</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/section.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/commun.css">
    <link rel="stylesheet" href="css/virtual-keyboard.css">
    <link rel="stylesheet" href="css/client.css">
    <link rel="stylesheet" href="css/article.css">
    <link rel="stylesheet" href="css/selection.css">
    <link rel="stylesheet" href="css/saisie.css">
    <link rel="stylesheet" href="css/commande.css">
    <link rel="stylesheet" href="css/lot.css">
    <link rel="stylesheet" href="css/remplacement-article.css">
    <link rel="stylesheet" href="css/order.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="icon" type="image/png" href="inc/logoIcon.png" />
  </head>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	<body class="body-flex" style="overflow:hidden;">
	  	<script src="js/virtual-keyboard.js"></script>
		    <section class="hero is-very-small" style="background-color: <%= Constantes.COULHF %>;">
			   <div class="level">
			   		<div class="level-left">
			      		<h1 class="title is-5 has-text-white">
			        		2Bsystem ORDER
			      		</h1>
		      		</div>
		      		<div class="title-header">
			      		<h1 id="title" class="title is-5 has-text-white"></h1>
		      		</div>
		      		<div class="level-right">
					    <h1 id="nomBorne" class="title is-5 has-text-white"></h1>
					</div>
		      	</div>
			</section>
		<script>
			string_nom_brone = "<%= session.getAttribute("param_borne") %>";
			document.getElementById("nomBorne").innerHTML = string_nom_brone.substring(5,7);
		</script>