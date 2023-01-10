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
    <!-- FOOTER -->
    <footer id="footer" class="footer-main" style="background-color: #72787e;">
    <div class="level p-1">
	
    	<div class="level-item"></div>
	    	<div class="level-item">
	    	<form method="post" action="Connect">
			  		<input type="submit" class="btn btn-light" value="Deconnexion" >
				</form> 
			    <div class="container has-text-centered">
				  <figure class="image container logo-footer is-centered image" style="height: 58px; width: 144px;">
			  	    <img src="inc/groupe-bellon.png">
				  </figure>
				  
				</div>

			</div>

	</div>
  </footer>

  	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
   	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
  	 
</body>
</html>
