<jsp:include page="header.jsp"/>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	
	<p id="titleCardRecap" class="h4">Recapitulatif Commande</p>
	
	<div id="cardRecap" class="card" >
	  <div id="cardHeader" class="card-header">
	    <h1 class="btn btn-outline-info btn-lg"><%= session.getAttribute("valCategory") %> </h1>
	    <%if(session.getAttribute("inputSaisieArticle") == null) { %>
			<h1 class="btn btn-outline-info btn-lg"><%= session.getAttribute("valArticle") %> </h1>	
		<%} else {%>
			<h1 class="btn btn-outline-info btn-lg"><%= session.getAttribute("inputSaisieArticle") %> </h1>	
		<% } %>
	  </div>
	  
	      <h5 id="titleCardRecap" class="card-title text-center"><%= session.getAttribute("articleClient") %></h5>

	  <table class="table">
		  <tbody>
		    <tr>
		      <td>Lot</td>
		      <td id="articleLot" value="<%= session.getAttribute("articleLot") %>"><%= session.getAttribute("articleLot") %> </td>
		    </tr>
		    <tr>
		      <td>Quantite</td>
		      <td id="articleQuantite" value="<%= session.getAttribute("articleQuantite") %>"><%= session.getAttribute("articleQuantite") %></td>
		    </tr>
		    <tr>
		      <td>Unite</td>
		      <td id="articleUnite" value="<%= session.getAttribute("articleUnite") %>"><%= session.getAttribute("articleUnite") %></td>
		    </tr>
		    <tr>
		      <td>Com</td>
		      <td id="articleCom" value="<%= session.getAttribute("articleCommentaire") %>"><%= session.getAttribute("articleCommentaire") %></td>
		    </tr>
		    <tr>
		      <td>Origine</td>
		      <td id="articleOrigine" value="<%= session.getAttribute("articleOrigine") %>"><%= session.getAttribute("articleOrigine") %></td>
		    </tr>
		    <tr>
		      <td>Poids</td>
		      <td id="articlePoids" value="<%= session.getAttribute("articlePoids") %>" ><%= session.getAttribute("articlePoids") %></td>
		    </tr>
		    <tr>
		      <td>Prix</td>
		      <td id="articlePrix" value="<%= session.getAttribute("articlePrix") %>" ><%= session.getAttribute("articlePrix") %> Euros</td>
		    </tr>
		  </tbody>
		</table>
	</div>	
	<div id="cardCommentaire" class="card" >
	  <div class="card-body">
	    <h5 class="card-title">Commentaire</h5>
	    <p class="card-text" id="articleCommentaire2" value="<%= session.getAttribute("articleCommentaire2") %>" ><%= session.getAttribute("articleCommentaire2") %></p>
	  </div>
	</div>
	<form method="post" action="ConfirmationCde">
  		<input id="btnValiderCommande" class="button is-size-5 has-text-weight-bold" type="submit" value="Impression" style="background-color: #0063af; color:#fff;">
	</form>
	<script>
		//let articleLot = document.getElementById('articleLot');
		
	
	</script>
	
<jsp:include page="footer.jsp"/>
