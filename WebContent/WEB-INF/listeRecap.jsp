<jsp:include page="header.jsp"/>
<%@ page import="java.util.List" %>
<%@ page import="com.a2bsystem.models.histoClient" %>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	
		<div id="bodyListeRecap">
			<form id="detailCmd" method="post" action="detailCommande">
				 <table class="table">
				  <thead>
				    <tr>
				      <th scope="col">Client</th>
				      <th scope="col">Total</th>
				      <th scope="col">Date</th>
				      <th scope="col">Modif</th>
				      
				    </tr>
				  </thead>
				   <tbody> 
				   <div class="btn-group-vertical">
				  <%
				  if(request.getAttribute("histoClients") != null){
			      		for (histoClient histo : (List<histoClient>) request.getAttribute("histoClients")) {
			        %>
			        <tr>
				         <td> <%= histo.client %>  </td>
				         <td> <%= histo.totalPrix %> </td>
				         <td> <%= histo.date %>  </td>
	
						 <td> 
						 	<button type="submit" class="btn btn-outline-secondary btn-lg" name="idCmd" value="<%= histo.id %>//<%= histo.client %>//<%= histo.codeClient %>" >
							 	<span style="z-index: 2" class="icon is-small">
							  		<i class="fas fa-pen"></i> 
							    </span>
						   	</button> 
					   	 </td>
			       </tr>
				       <% }
				  }
					%>
					</div>
				  </tbody> 
				</table> 
			</form>
	<form method="post" action="ListeCategory">
	   <input id="btnAjoutCommande" class="button is-size-5 has-text-weight-bold" type="submit" value="Ajout Commande" style="background-color: #0063af; color:#fff;">
   </form>
	   </div>
   <script>
/*    var formDetailCmd = document.getElementById("detailCmd");

   function myFunction(x) {
	    //alert("Row index is: " + x.rowIndex);
	    formDetailCmd.submit();
	    
	    
	} */

   </script>
   
    <!-- FOOTER -->
  
   <footer id="footer" class="d-flex flex-wrap justify-content-between align-items-center py-3 border-top bg-light">
		<form method="post" action="Connect">
	  		<input type="submit" class="btn btn btn-outline-dark" value="Deconnexion" >
		</form>
		    <div class="col-md-4 d-flex align-items-center">
		        <img src="inc/groupe-bellon.png" class="d-inline-block align-top" width="100" height="100" >
		    </div>
	</footer>

  	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
   	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
  	 
</body>
</html>
