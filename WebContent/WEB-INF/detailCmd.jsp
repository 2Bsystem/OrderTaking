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
					      <td> <button type="submit" class="btn btn-outline-secondary btn-lg" name="recapArticleModif" 
					      			   value="<%= histo.client %>//
					      			   		  <%= histo.quantite %>//
					      			   		  <%= histo.unite %>//
					      			   		  <%= histo.categorie %>//
					      			   		  <%= histo.article %>//
					      			   		  <%= histo.origine %>//
					      			   		  <%= histo.commentaire %>//
					      			   		  <%= histo.commentaire2 %>//
					      			   		  <%= histo.prix %>" >
	      			   		  </button> </td>
					    </tr>
					       <% } 
					  }
						%> 
				  </tbody>
			 </table>
		</form>
		<form method="post" action="ListeCategory">
			<input id="btnSaisieArticle" class="button is-size-5 has-text-weight-bold" type="submit" name="ajoutArticleCmdModif" value="Ajout Article" style="background-color: #0063af; color:#fff;">	
		</form>

		<form method="post" action="ConfCommande">
			<div id ="btnImpressions">
		  		<input id="btnValiderImpression" name="impression1" class="button is-size-5 has-text-weight-bold" type="submit" value="<%= session.getAttribute("Imprimante1") %>" style="background-color: #0063af; color:#fff;">
		  		<input id="btnValiderImpression2" name="impression2" class="button is-size-5 has-text-weight-bold" type="submit" value="<%= session.getAttribute("Imprimante2") %>" style="background-color: #0063af; color:#fff;">
		  	</div>	
		</form>
	</div>
<jsp:include page="footer.jsp"/>
