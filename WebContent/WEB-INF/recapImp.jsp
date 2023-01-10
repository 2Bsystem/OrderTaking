<jsp:include page="header.jsp"/>
<%@ page import="java.util.List" %>
<%@ page import="com.a2bsystem.models.Historique" %>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	
	<p id="titleCardRecap" class="h4">Recapitulatif Commande</p>
		<div id="bodyListeRecap">
	      <table class="table">
			  <thead>
			    <tr>
			      <th scope="col">Client</th>
			      <th scope="col">Article</th>
			      <th scope="col">Quantite</th>
			    </tr>
			  </thead>
			  <tbody>
			  <%
			  if(request.getAttribute("historiques") != null){
		      		for (Historique histo : (List<Historique>) request.getAttribute("historiques")) {
		        %>
			    <tr>
					  <td><%= histo.client %></td>
				      <td><%= histo.article %></td>
				      <td><%= histo.quantite %></td>
			    </tr>
			       <% } 
			  }
				%>
			  </tbody>
			</table>
	
		<form method="post" action="ConfCommande">
			<div id ="btnImpressions">
		  		<input id="btnValiderImpression" name="impression1" class="button is-size-5 has-text-weight-bold" type="submit" value="<%= session.getAttribute("Imprimante1") %>" style="background-color: #0063af; color:#fff;">
		  		<input id="btnValiderImpression2" name="impression2" class="button is-size-5 has-text-weight-bold" type="submit" value="<%= session.getAttribute("Imprimante2") %>" style="background-color: #0063af; color:#fff;">
		  	</div>	
		</form>
	</div>
<jsp:include page="footer.jsp"/>
