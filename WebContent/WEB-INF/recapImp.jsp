<jsp:include page="header.jsp"/>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	
	<p id="titleCardRecap" class="h4">Recapitulation Commande</p>
	

	<div id="cardRecap" class="card" >
	  <div id="cardHeader" class="card-header">
	    <h1 class="btn btn-outline-info btn-lg"><%= session.getAttribute("valCategory") %> </h1>
		<h1 class="btn btn-outline-info btn-lg"><%= session.getAttribute("valArticle") %> </h1>	
	  </div>
	  
	      <h5 id="titleCardRecap" class="card-title text-center"><%= session.getAttribute("articleClient") %></h5>

	  <table class="table">
		  
		  <tbody>
		    <tr>
		      <td>Lot</td>
		      <td><%= session.getAttribute("articleLot") %> </td>
		    </tr>
		    <tr>
		      <td>Quantite</td>
		      <td><%= session.getAttribute("articleQuantite") %></td>
		    </tr>
		    <tr>
		      <td>Unite</td>
		      <td><%= session.getAttribute("articleUnite") %></td>
		    </tr>
		    <tr>
		      <td>Commentaire</td>
		      <td><%= session.getAttribute("articleCommentaire") %></td>
		    </tr>
		    <tr>
		      <td>Origine</td>
		      <td><%= session.getAttribute("articleOrigine") %></td>
		    </tr>
		    <tr>
		      <td>Poids</td>
		      <td><%= session.getAttribute("articlePoids") %></td>
		    </tr>
		    <tr>
		      <td>Prix</td>
		      <td><%= session.getAttribute("articlePrix") %> Euros</td>
		    </tr>
		  </tbody>
		</table>
	</div>
	
	<form method="post" action="ConfirmationCde">
	
  		<input id="btnValiderCommande" class="button is-size-5 has-text-weight-bold" type="submit" value="Impression" style="background-color: #0063af; color:#fff;">

	</form>
<jsp:include page="footer.jsp"/>
