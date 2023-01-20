<%@page import="com.a2bsystem.models.histoClient"%>
<jsp:include page="header.jsp"/>
<%@ page import="java.util.List" %>
<%@ page import="com.a2bsystem.models.Historique" %>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	
	<p id="titleCardRecap" class="h4"><%= session.getAttribute("nomAppelClientModifCommande") %></p>
		<div id="bodyListeRecap">
		<form method="post" action="modifSaisieArticle">
		      <table class="table">
				  <thead>
				    <tr>
				      <th scope="col">Article</th>
				      <th scope="col">Quantite</th>
				      <th scope="col">Modif</th>
				    </tr>
				  </thead>
				  <tbody>
					  <%
					  if(request.getAttribute("historiques") != null){
				      		for (Historique histo : (List<Historique>) request.getAttribute("historiques")) {
				        %>
					    <tr>
					      <td><%= histo.article %> <strong><%= histo.categorie %></strong></td>
					      <td><%= histo.quantite %> <%= histo.unite %></td>
					      <td> 
				      		 <button type="submit" class="btn btn-outline-secondary btn-lg" name="recapArticleModif" 
					      			   value="<%= histo.client %>//
					      			   		  <%= histo.quantite %>//
					      			   		  <%= histo.unite %>//
					      			   		  <%= histo.categorie %>//
					      			   		  <%= histo.article %>//
					      			   		  <%= histo.origine %>//
					      			   		  <%= histo.commentaire %>//
					      			   		  <%= histo.commentaire2 %>//
					      			   		  <%= histo.prix %>//
					      			   		  <%= histo.idArticle %>" >
					      			   		  
		      			   		<span style="z-index: 2" class="icon is-small">
							  		<i class="fas fa-pen"></i> 
							    </span>
	      			   		  </button> 
      			   		  </td>
					    </tr>
					       <% } 
					  }
						%> 
				  </tbody>
			 </table>
		</form>
		<form method="post" action="ListeCategoryModifAddArticle">
			<input id="btnAjoutArticleModif" class="button is-size-5 has-text-weight-bold" type="submit" name="ajoutArticleCmdModif" value="Ajout Article" style="background-color: #0063af; color:#fff;">	
		</form>

		<form method="post" action="ConfCommandeModif">
			<div id ="btnImpressionsDetailCmd">
		  		<input id="btnValiderImpression" name="impression1" class="button is-size-5 has-text-weight-bold" type="submit" value="<%= session.getAttribute("Imprimante1") %>" style="background-color: #0063af; color:#fff;">
		  		<input id="btnValiderImpression2" name="impression2" class="button is-size-5 has-text-weight-bold" type="submit" value="<%= session.getAttribute("Imprimante2") %>" style="background-color: #0063af; color:#fff;">
		  	</div>	
		</form>
	</div>
		<footer id="footer" class="d-flex flex-wrap justify-content-between align-items-center py-3 border-top bg-light">
			<form method="post" action="Connect">
		  		<input type="submit" class="btn btn btn-outline-dark" value="Deconnexion" >
			</form>
			    <div class="col-md-4 d-flex align-items-center">
			        <img src="inc/groupe-bellon.png" class="d-inline-block align-top" width="100" height="100" >
			    </div>
			<form method="post" action="ListeRecap">
		  		<input type="submit" class="btn btn btn-outline-dark" value="Accueil" >
			</form>
		</footer>
	  	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	   	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	  	 
	</body>
</html>
