<jsp:include page="header.jsp"/>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	<form method="post" action="ListeCategory">
	<div id="bodyListeRecap">
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">Code</th>
		      <th scope="col">Nom</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td>Otto</td>
		      <td>@mdo</td>
		    </tr>
		    <tr>
		      <td>Thornton</td>
		      <td>@fat</td>
		    </tr>
		    <tr>
		      <td>Larry the Bird</td>
		      <td>@twitter</td>
		    </tr>
		  </tbody>
		</table>
			
<!-- 	<button id="btnAjoutCommande" type="button" class="btn btn-primary"> Ajout Commande </button>
 -->	
   <input id="btnAjoutCommande" class="button is-size-5 has-text-weight-bold" type="submit" value="Ajout Commande" style="background-color: #0063af; color:#fff;">
	</div>
  	</form>

<jsp:include page="footer.jsp"/>
