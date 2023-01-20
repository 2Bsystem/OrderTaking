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

	<div id="titleContainer" class="card">
		<div id="titleCategoryArticle" class="card-body">
	
		    <% if(session.getAttribute("recapCategorie") == null) { %>
				<h1 ><%= session.getAttribute("valCategory") %> </h1>
			<%} else if(session.getAttribute("valCategory") == null){ %>
				<form method="post" action="ListeCategory">
						<button class="btn btn-outline-secondary btn-lg" type="submit">
						
							<span style="z-index: 2" class="icon is-small">
						  		<i class="fas fa-pen"></i> 
						    </span> 
					    </button>
						
				</form>
				<h1><%= session.getAttribute("recapCategorie") %> </h1>
				
			<%} else { %>
			
				<form method="post" action="ListeCategory">
						<button class="btn btn-outline-secondary btn-lg" type="submit">
						
							<span style="z-index: 2" class="icon is-small">
						  		<i class="fas fa-pen"></i> 
						    </span> 
					    </button>						
				</form>
				<h1><%= session.getAttribute("valCategory") %> </h1>
				
			<% }%>
				
			<%if(session.getAttribute("recapArticle") == null) {%>	
				<%if(session.getAttribute("inputSaisieArticle") == null) { %>
					<h1 ><%= session.getAttribute("valArticle") %> </h1>	
				<%} else {%>
					<h1 ><%= session.getAttribute("inputSaisieArticle") %> </h1>	
				<%}
		
			 }else if (session.getAttribute("valArticle") == null ) {%>
			 	<%if(session.getAttribute("inputSaisieArticle") == null) { %>
			 		
		 			<h1 id="articleModif" ><%= session.getAttribute("recapArticle") %> </h1>	
				 <% } else { %>
					<h1 id="articleModif" ><%= session.getAttribute("inputSaisieArticle") %> </h1>	
					
				<%} %>
					 
			<%} else { %>
				<%if(session.getAttribute("inputSaisieArticle") == null) { %>
					<h1 id="articleModif" ><%= session.getAttribute("valArticle") %> </h1>	
				<% } else { %>
					<h1 id="articleModif" ><%= session.getAttribute("inputSaisieArticle") %> </h1>	
					
				<%} %>
				
			<%} %>
		</div>
	</div>
</div>
<div id="formSaisieArticle">		
	<form id="articleForm" method="post" action="">
		<div id="bodySaisieArticle">
			
	<% if (session.getAttribute("articleClient") == null && session.getAttribute("nomAppelClientModifCommande") == null) { %>
			<div class="field">
				<div class="control">
					<div class="select is-danger" >
						<select id="selectClient" name="articleClient" required>
							<option value="">Choix du client</option>
						 
						 <%
					      	for (Cli client : (List<Cli>) request.getAttribute("clients")) {
					      %>
							 <option value="<%=client.code %>//<%= client.nomAppel %>"><%= client.nomAppel %></option>
							
						 <% } 
						  %>
						 </select>
					 </div>
				 </div>
			</div>
			
			<% } else if (session.getAttribute("articleClient") != null){ %>
				<div class="control">
					<input class="input" type="text" placeholder="<%= session.getAttribute("nomAppelClient") %>" name="articleClient" disabled>
				</div>
			<%} else { %>
				<div class="control">
					<input class="input" type="text" placeholder="<%= session.getAttribute("nomAppelClientModifCommande") %>" name="articleClient" disabled>
				</div>
			<% } %>
			
			<div class="control">
				<input class="input" type="number" placeholder="N° Lot" name="articleLot">
			</div>
			
			<% 			
			if(session.getAttribute("recapQuantite") == null ) { %>
			
				<div class="control">
					<input class="input is-danger" type="number" placeholder="Quantité" name="articleQuantite" required>
				</div>
			
			<% } else { %>
				
				<div class="control">
					<input class="input is-danger" type="number" value="<%= session.getAttribute("recapQuantite").toString().trim() %>" placeholder="Quantité" name="articleQuantite" required>
				</div>
				
			<% } %>
				
			<div class="field">
				<label class="label">Unité</label>
				<div class="control">
					<div class="select" >
						<select name="articleUnite">
						<% if (session.getAttribute("recapUnite") != null) { %>
							<option selected> <%= session.getAttribute("recapUnite") %></option>
						<%} %>
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
						<% if (session.getAttribute("recapCommentaire") != null) { %>
							<option selected> <%= session.getAttribute("recapCommentaire") %></option>
						<%} %>
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
						<% if (session.getAttribute("recapOrigine") != null) { %>
							<option selected> <%= session.getAttribute("recapOrigine") %></option>
						<%} %>
							<option>FR</option>
							<option>UE</option>
						</select>
					</div>
				</div>
			</div>
			<div class="control">
				<input class="input" type="number" placeholder="Poids" name="articlePoids">
			</div>
			<%if(session.getAttribute("recapPrix") == null ) { %>
				<div class="control">
					<input class="input" type="number" placeholder="Prix" name="articlePrix">
				</div>
				
			<% } else { %>
				
				<div class="control">
					<input class="input" type="number" value="<%= session.getAttribute("recapPrix").toString().trim() %>" placeholder="Prix" name="articlePrix">
				</div>
				
			<% } %>
			
			
			<%if(session.getAttribute("recapCommentaire2") == null ) { %>
			  <div class="control">
			    <textarea id="textareaForm" class="textarea" placeholder="Commentaire" name="articleCommentaire2"></textarea>
			  </div>
			<% } else { %>
			  <div class="control">
			    <textarea id="textareaForm" class="textarea" value="<%= session.getAttribute("recapCommentaire2").toString().trim() %>" placeholder="Commentaire" name="articleCommentaire2"></textarea>
			  </div>
			<% } %>
	<input type="hidden" value="<%= session.getAttribute("recapIdArticle").toString().trim()%>" />
		</div>
		<% if(session.getAttribute("nomAppelClientModifCommande") == null || session.getAttribute("nomAppelClientModifCommande") == "") { %>

		  	<input id="btnSaisieArticle" class="button is-size-5 has-text-weight-bold" type="submit" value="Ajout Article" style="background-color: #0063af; color:#fff;">
		  	<input id="btnValiderCommande" class="button is-size-5 has-text-weight-bold" type="submit" value="Valider Commande" style="background-color: #0063af; color:#fff;">
	  	
	  	<%} else if(session.getAttribute("recapQuantite") == null) { %>
	  		<input id="btnAjoutArtModif" class="button is-size-5 has-text-weight-bold" type="submit" value="Ajout Article" style="background-color: #0063af; color:#fff;">
	  	
		<% } else { %>
	  		<input id="btnModifArt" class="button is-size-5 has-text-weight-bold" type="submit" value="Modification Article" style="background-color: #0063af; color:#fff;">
		
		<% } %>
	</form>
</div>
<script>
	let selectClient = document.getElementById('selectClient');
	let btnSaisieArticle = document.getElementById('btnSaisieArticle');
	let btnValiderCommande = document.getElementById('btnValiderCommande');
	let formSaisie = document.getElementById('articleForm');
	let btnAjoutArtModif = document.getElementById('btnAjoutArtModif');
	let btnModifArt = document.getElementById('btnModifArt');


	if( btnSaisieArticle !== null) {
		btnSaisieArticle.onclick = function() {
			//selectClient.setAttribute("disabled", false); 
			formSaisie.action = 'AjoutArticle';   
		} 
		
		btnValiderCommande.onclick = function() {
			formSaisie.action = 'RecapImp';
		}
		
	}
	
	if(btnAjoutArtModif !== null ) {
		btnAjoutArtModif.onclick = function() {
			formSaisie.action = 'AjoutArticleModif';   
		}
	}
	
	if(btnModifArt !== null) {
		console.log("bonjour");
		btnModifArt.onclick = function() {
			formSaisie.action = 'ModifArticle';   
		} 

	}
	

</script>

<jsp:include page="footer.jsp"/>
