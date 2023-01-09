<jsp:include page="header.jsp"/>
<%@ page import="java.util.List" %>
<%@ page import="com.a2bsystem.models.histoClient" %>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	<form method="post" action="ListeCategory">
		<div id="bodyListeRecap">
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">Client</th>
			      <th scope="col">Total</th>
			      <th scope="col">Date</th>
			    </tr>
			  </thead>
			   <tbody>
			  <%
			  if(request.getAttribute("histoClients") != null){
		      		for (histoClient histo : (List<histoClient>) request.getAttribute("histoClients")) {
		        %>
			    <tr>
				      <td><%= histo.client %></td>
				      <td><%= histo.totalPrix %></td>
				      <td><%= histo.date %></td>
			    </tr>
			       <% }
			  }
				%>
			  </tbody> 
			</table>

	   <input id="btnAjoutCommande" class="button is-size-5 has-text-weight-bold" type="submit" value="Ajout Commande" style="background-color: #0063af; color:#fff;">
	   </div>
   </form>

<jsp:include page="footer.jsp"/>
