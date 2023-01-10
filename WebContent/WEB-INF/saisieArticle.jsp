<jsp:include page="header.jsp"/>
<%@ page import="java.util.List" %>
<%@ page import="com.a2bsystem.models.Cli" %>
<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
<style>
/* Permet de bloquer la vue paysage*/
@media screen and (orientation:landscape) {
	
	 html {
        /* Rotate the content container */
        transform: rotate(-90deg);
        transform-origin: left top;
        /* Set content width to viewport height */
        width: 100vh;
        /* Set content height to viewport width */
        height: 100vw;
        overflow-x: hidden;
        position: absolute;
        top: 100%;
        left: 0;
      }

}

</style>
<div id="topSaisieArticle">
	<h1 class="btn btn-outline-info btn-lg"><%= session.getAttribute("valCategory") %> </h1>
	 <%if(session.getAttribute("inputSaisieArticle") == null) { %>
		<h1 class="btn btn-outline-info btn-lg"><%= session.getAttribute("valArticle") %> </h1>	
	<%} else {%>
		<h1 class="btn btn-outline-info btn-lg"><%= session.getAttribute("inputSaisieArticle") %> </h1>	
	<% } %>	
</div>
		
<form id="articleForm" method="post" action="">
	<div id="bodySaisieArticle">
	
	<% if (session.getAttribute("articleClient") == null || session.getAttribute("articleClient") == "") { %>
		<div class="field">
			<div class="control">
				<div class="select is-danger" >
					<select id="selectClient" name="articleClient" required>
						<option value="">Choix du client</option>
					 
					 <%
				      	for (Cli client : (List<Cli>) request.getAttribute("clients")) {
				      %>
						 <option><%= client.nomAppel %></option>
						 
					 <% } 
					  %>
					 </select>
				 </div>
			 </div>
		</div>
		
		<% } else { %>
			<div class="control">
				<input class="input" type="text" placeholder="<%= session.getAttribute("articleClient") %>" name="articleClient" disabled>
			</div>
		<%} %>
		
		<div class="control">
			<input class="input" type="number" placeholder="N° Lot" name="articleLot">
		</div>
		<div class="control">
			<input class="input is-danger" type="number" placeholder="Quantité" name="articleQuantite" required>
		</div>
		<div class="field">
			<label class="label">Unité</label>
			<div class="control">
				<div class="select" >
					<select name="articleUnite">
						<option>Pièce</option>
						<option>Kg</option>
						<option>Cartons</option>
					</select>
				</div>
			</div>
		</div>
		<div class="field">
			<label class="label">Com</label>
			<div class="control">
				<div class="select" >
					<select name="articleCommentaire">
						<option>Frais</option>
						<option>SV</option>
						<option>Resserre</option>
						<option>Premier à passer</option>
						<option>Petit</option>
						<option>Grand</option>
					</select>
				</div>
			</div>
		</div>
		<div class="field">
			<label class="label">Origine</label>
			<div class="control">
				<div class="select" >
					<select name="articleOrigine">
						<option>FR</option>
						<option>UE</option>
					</select>
				</div>
			</div>
		</div>
		<div class="control">
			<input class="input" type="number" placeholder="Poids" name="articlePoids">
		</div>
		<div class="control">
			<input class="input" type="number" placeholder="Prix" name="articlePrix">
		</div>
		<div >
		  <div class="control">
		    <textarea id="textareaForm" class="textarea" placeholder="Commentaire" name="articleCommentaire2"></textarea>
		  </div>
		</div>

	</div>
  	<input id="btnSaisieArticle" class="button is-size-5 has-text-weight-bold" type="submit" value="Ajout Article" style="background-color: #0063af; color:#fff;">
  	<input id="btnValiderCommande" class="button is-size-5 has-text-weight-bold" type="submit" value="Valider Commande" style="background-color: #0063af; color:#fff;">
	
</form>

<script>
	let selectClient = document.getElementById('selectClient');
	let btnSaisieArticle = document.getElementById('btnSaisieArticle');
	let btnValiderCommande = document.getElementById('btnValiderCommande');
	let formSaisie = document.getElementById('articleForm');
	
	
	 btnSaisieArticle.onclick = function() {
		//selectClient.setAttribute("disabled", false); 
		formSaisie.action = 'AjoutArticle';
	    
	} 
	
	btnValiderCommande.onclick = function() {
		formSaisie.action = 'RecapImp';
	    
	} 

</script>

<jsp:include page="footer.jsp"/>
