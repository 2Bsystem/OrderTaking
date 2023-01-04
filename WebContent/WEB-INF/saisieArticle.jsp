<jsp:include page="header.jsp"/>
<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>

<div id="topSaisieArticle">
	<h1 class="btn btn-outline-info btn-lg"><%= session.getAttribute("valCategory") %> </h1>
	<h1 class="btn btn-outline-info btn-lg"><%= request.getParameter("valArticle") %> </h1>	
</div>
		
<form method="post" action="">
	<div id="bodySaisieArticle">
	
		<div class="field">
			<label class="label">Choix du client</label>
			 <div class="control">
				 <div class="select">
					 <select>
						 <option>Select dropdown</option>
						 <option>With options</option>
					 </select>
				 </div>
			 </div>
		</div>
		
		<div class="control">
			<input class="input" type="text" placeholder="N° Lot">
		</div>
		<div class="control">
			<input class="input" type="text" placeholder="Quantité">
		</div>
		<div class="field">
			<label class="label">Unité</label>
			<div class="control">
				<div class="select">
					<select>
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
				<div class="select">
					<select>
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
				<div class="select">
					<select>
						<option>FR</option>
						<option>UE</option>
					</select>
				</div>
			</div>
		</div>
		<div class="control">
			<input class="input" type="text" placeholder="Poids">
		</div>
		<div class="control">
			<input class="input" type="text" placeholder="Prix">
		</div>
		
		
	
	</div>
  	<input id="btnValiderCommande" class="button is-size-5 has-text-weight-bold" type="submit" value="Valider" style="background-color: #0063af; color:#fff;">
	
</form>
<jsp:include page="footer.jsp"/>
