<jsp:include page="header.jsp"/>
<%@ page import="java.util.List" %>
<%@ page import="com.a2bsystem.models.Cli" %>
<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>

<div id="topSaisieArticle">
	<h1 class="btn btn-outline-info btn-lg"><%= session.getAttribute("valCategory") %> </h1>
	<h1 class="btn btn-outline-info btn-lg"><%= session.getAttribute("valArticle") %> </h1>	
</div>
		
<form id="articleForm" method="post" action="RecapImp">
	<div id="bodySaisieArticle">
	
		<div class="field">
			<label class="label">Choix du client</label>
			 <div class="control">
				 <div class="select is-danger" >
					 <select name="articleClient">
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
		
		<div class="control">
			<input class="input" type="number" placeholder="N° Lot" name="articleLot">
		</div>
		<div class="control">
			<input class="input is-danger" type="number" placeholder="Quantité" name="articleQuantite">
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
			<label class="label">Commentaire</label>
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

	</div>
  	<input id="btnValiderCommande" class="button is-size-5 has-text-weight-bold" type="submit" value="Valider" style="background-color: #0063af; color:#fff;">
	
</form>
<script>
	
/* 	function doForm () {
		
		var data = new FormData ();
		
		var all = document.querySelectorAll("#articleForm input, #articleForm select ");
		
		for (let field of all) {
			if(field.type != "submit" && field.type != "button") {
				data.append(field.name, field.value)
			}
		}
		
		for (let [k, v] of data.entries()) { console.log(k, v); }
		  return false;
		
	}
	

	doForm (); */
</script>
<jsp:include page="footer.jsp"/>
