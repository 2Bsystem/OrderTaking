<jsp:include page="header.jsp"/>
<%@ page import="java.util.List" %>
<%@ page import="com.a2bsystem.models.Constantes" %>
<%@ page import="com.a2bsystem.models.ChampsArt" %>
<script>document.getElementById("title").innerHTML =  "SAISIE ORDER";</script>
<section id="section_login" class="section-saisie-order section-borne is-fullheight">
	<div class="box">
		<div class="field is-horizontal">
			<form class="form-fullwidth" method="post" action="Article">
				<div class="field is-horizontal">
					<div class="is-normal label-order">
			    		<label class="label label-block-left is-size-5">ARTICLE</label>
			 		</div>
			  		<div class="field-body">
			    		<div class="field">
			      			<div class="control is-expanded">
			        			<input id="input_article" class="input input-color input-block-left is-size-5 is-fullwidth false-input-text" min=0 type="submit">
			        			<script>
			        				if (("<%=session.getAttribute("article_order")%>" == "null") || ("<%=session.getAttribute("article_order")%>" =="")) {
			        					document.getElementById("input_article").value = "Libellé article";
			        					document.getElementById("input_article").style.color = "darkgrey";
			        				} else {
			        					document.getElementById("input_article").value = "<%=session.getAttribute("article_order")%>";
			        				}
			        			</script>
			      			</div>
			    		</div>
			  		</div>
			  	</div>
	  		</form>
		</div>
	</div>
	<div style="display: flex;">
		<div class="box box-saisie">
			<div class="field is-horizontal">
					<div class="field is-horizontal">
						<div class="is-normal label-order">
				    		<label class="label label-block-left is-size-5">COLIS</label>
				 		</div>
				  		<div class="field-body">
				    		<div class="field">
				      			<div class="control is-expanded">
				        			<input autocomplete="off" id="input_colis" class="input input-color is-size-5 is-fullwidth input-block-left use-keyboard-input-saisie-decimal" min=0 type="number">
				      			</div>
				    		</div>
				  		</div>
				  		<div class="is-normal label-order is-size-5">
				  			<p>	&nbsp;	&nbsp;	&nbsp;
				  			</p>
				  		</div>
				  	</div>
			</div>
			<div class="field is-horizontal">
				<div class="field is-horizontal">
					<div class="is-normal label-order">
			    		<label class="label label-block-left is-size-5">PIECES</label>
			 		</div>
			  		<div class="field-body">
			    		<div class="field">
			      			<div class="control is-expanded">
			        			<input id="input_pieces" class="input input-color is-size-5 is-fullwidth input-block-left use-keyboard-input-saisie-decimal" min=0 pattern="\d*" type="number">
			      			</div>
			    		</div>
			  		</div>
			  		<div class="is-normal label-order is-size-5">
			  			<p>	&nbsp;	&nbsp;	&nbsp;
			  			</p>
			  		</div>
			  	</div>
			</div>
			<div class="field is-horizontal">
				<div class="field is-horizontal">
					<div class="is-normal label-order">
			    		<label class="label label-block-left is-size-5">POIDS NET</label>
			 		</div>
			  		<div class="field-body">
			    		<div class="field">
			      			<div class="control is-expanded">
			        			<input  id="input_poids_net" class="input input-color is-size-5 is-fullwidth input-block-left use-keyboard-input-saisie-decimal" type="number">
			      			</div>
			    		</div>
			  		</div>
			  		<div class="is-normal label-order is-size-5">
			  			<p>Kg
			  			</p>
			  		</div>
			  	</div>
			</div>
			<div class="field is-horizontal">
				<div class="field is-horizontal">
					<div class="is-normal label-order">
			    		<label class="label label-block-left is-size-5">PRIX</label>
			 		</div>
			  		<div class="field-body">
			    		<div class="field">
			      			<div class="control is-expanded">
			        			<input id="input_prix" class="input input-color is-size-5 is-fullwidth input-block-left use-keyboard-input-saisie-decimal" min=0 pattern="\d*" type="number">
			      			</div>
			    		</div>
			  		</div>
			  		<div class="is-normal label-order is-size-5">
			  			<p>	&euro;	&nbsp;	&nbsp;
			  			</p>
			  		</div>
			  	</div>
			</div>
		</div>
		<div class="box box-saisie">
			<div class="field is-horizontal">
					<div class="field is-horizontal">
						<div class="is-normal label-order">
				    		<label class="label label-block-left is-size-5"></label>
				 		</div>
				  		<div class="field-body">
				    		<div class="field">
				      			<div class="control is-expanded">
				      			</div>
				    		</div>
				  		</div>
				  		<div class="is-normal label-order is-size-5">
				  			<p>	&nbsp;	&nbsp;	&nbsp;
				  			</p>
				  		</div>
				  	</div>
			</div>
			<div class="field is-horizontal">
				<div class="field is-horizontal">
					<div class="is-normal label-order">
			    		<label class="label label-block-left is-size-5">PIECES U</label>
			 		</div>
			  		<div class="field-body">
			    		<div class="field">
			      			<div class="control is-expanded">
			        			<input id="input_pieces_u" class="input input-lock-color is-size-5 is-fullwidth input-block-left" min=0 pattern="\d*" type="number" readonly>
			      			</div>
			    		</div>
			  		</div>
			  		<div class="is-normal label-order is-size-5">
			  			<p>	&nbsp;	&nbsp;	&nbsp;
			  			</p>
			  		</div>
			  	</div>
			</div>
			<div class="field is-horizontal">
				<div class="field is-horizontal">
					<div class="is-normal label-order">
			    		<label class="label label-block-left is-size-5">POIDS NET U</label>
			 		</div>
			  		<div class="field-body">
			    		<div class="field">
			      			<div class="control is-expanded">
			        			<input  id="input_poids_net_u" class="input input-lock-color is-size-5 is-fullwidth input-block-left " type="number" readonly>
			      			</div>
			    		</div>
			  		</div>
			  		<div class="is-normal label-order is-size-5">
			  			<p>Kg
			  			</p>
			  		</div>
			  	</div>
			</div>
			<div class="field is-horizontal">
				<div class="field is-horizontal">
					<div class="is-normal label-order">
			    		<label class="label label-block-left is-size-5"></label>
			 		</div>
			  		<div class="field-body">
			    		<div class="field">
			      			<div class="control is-expanded">
			      			</div>
			    		</div>
			  		</div>
			  		<div class="is-normal label-order is-size-5">
			  			<p>	&nbsp;	&nbsp;	&nbsp;
			  			</p>
			  		</div>
			  	</div>
			</div>
		</div>
		<script>
			<%
			  // on utilise for car les résultats viennent de la procédure q_2bp_java_ventes_get_champs_article qui est une procédure PDA et qui à 
			  // été faite pour renvoyé un tableau de champs mais normalement elle ne renvoi qu'une ligne dans notre cas.
	    	  for (ChampsArt champs : (List<ChampsArt>) request.getAttribute("champs")) {
	    		  %>
	    		  pieces_u = <%= champs.pieceU %>;
	    		  pieces_u = pieces_u.toFixed(2);
	    		  poids_net_u = <%= champs.pdsNetU %>;
	    		  poids_net_u = poids_net_u.toFixed(2);
	    		  u_fact = "<%= champs.uniteFact %>";
	    		  document.getElementById("input_pieces_u").value = pieces_u;
	    		  document.getElementById("input_poids_net_u").value = poids_net_u;
	    		  document.getElementById("input_prix").value = <%= champs.prix %>;
	    		  <%
	    	  }
			%>
			window.addEventListener("load", function(){
				// .replace(/\s+/g, '') car il y a des espace apres les unitées
				switch(u_fact.replace(/\s+/g, '')) {
					case 'C':
						document.getElementById("input_colis").focus();
						document.getElementById("input_colis").classList.remove("input-color");
						document.getElementById("input_colis").style.backgroundColor = "#F9FFC4";
						break;
					case 'K':
						document.getElementById("input_poids_net").focus();
						document.getElementById("input_poids_net").classList.remove("input-color");
						document.getElementById("input_poids_net").style.backgroundColor = "#F9FFC4";
						break;
					case 'st':
						document.getElementById("input_pieces").focus();
						document.getElementById("input_pieces").classList.remove("input-color");
						document.getElementById("input_pieces").style.backgroundColor = "#F9FFC4";
						break;
					default:
						console.log("error_u_fact");
				}
			});
	    </script>
		
	</div>
</section>
<div class="box box-button level p-1">
	<div class="level-right">
		<form id="form_retour" class="form-fullwidth" method="post" action="Article">
		 	<p class="control">
		 		<div style="display:none;"><input type="text" id="prev_page" value="saisie_order_retour" name="prev_page"></div>
		   		<input id="btn_valider" class="button is-size-5 has-text-weight-bold" type="submit" value="RETOUR" style="background-color:  <%= Constantes.COULBTN2 %>; color: <%= Constantes.COULBTNTXT %> ;">
		  	</p>
		</form>
	</div>
	<div class="level-right" style="width: 120px;">
	<style>
		 	.loader {
		 	  margin: auto auto;
			  vertical-align: middle;
			  margin-left: auto;
			  margin-right: auto;
			  border: 16px solid #f3f3f3;
			  border-radius: 50%;
			  border-top: 16px solid #3498db;
			  width: 120px;
			  height: 120px;
			  -webkit-animation: spin 2s linear infinite; /* Safari */
			  animation: spin 2s linear infinite;
		 	}
			/* Safari */
			@-webkit-keyframes spin {
			  0% { -webkit-transform: rotate(0deg); }
			  100% { -webkit-transform: rotate(360deg); }
			}
			
			@keyframes spin {
			  0% { transform: rotate(0deg); }
			  100% { transform: rotate(360deg); }
			}
	
		</style>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
		<div id="loading_screen" class="modal" style="display: none;">
			<div id="fader" class="modal-background"></div>
			<div class="loader"></div>
		</div>
       
		<form id="form_valider" class="form-fullwidth" method="post" action="Order">
		    <div style="display:none;"><input type="text" id="colis_order" name="colis_order"></div>
		    <div style="display:none;"><input type="text" id="poids_net_order" name="poids_net_order"></div>
		    <div style="display:none;"><input type="text" id="pieces_order" name="pieces_order"></div>
		    <div style="display:none;"><input type="text" id="prix_order" name="prix_order"></div>
		    <div style="display:none;"><input type="text" value="saisie_order" name="prev_page"></div>
			<input id="valider" name="Order" class="button is-size-5 has-text-weight-bold" type="button" value="VALIDER" style="background-color:  #0063af; color: #fff ;">
		</form>
		<script>
			document.getElementById("valider").addEventListener("click", function () {
				document.getElementById("prix_order").value = document.getElementById("input_prix").value;
				if (!document.getElementById('input_pieces').value){
					document.getElementById("pieces_order").value = "0";
				}else {
					document.getElementById("pieces_order").value = document.getElementById("input_pieces").value;
				}
				if (!document.getElementById('input_colis').value){
					document.getElementById("colis_order").value = "0";
				}else {
					document.getElementById("colis_order").value = document.getElementById("input_colis").value;
				}
				if (!document.getElementById('input_poids_net').value){
					document.getElementById("poids_net_order").value = "0";
				}else {
					document.getElementById("poids_net_order").value = document.getElementById("input_poids_net").value;
				}
				console.log(document.getElementById("colis_order").value);
				console.log(document.getElementById("pieces_order").value);
				console.log(document.getElementById("poids_net_order").value);
				document.getElementById('loading_screen').style.display = "flex";

				document.getElementById("form_valider").submit();
			})
		</script>
	</div>
</div>
<script src="js/virtual-keyboard-saisie-order-decimal-center.js"></script>
<script src="js/virtual-keyboard-saisie-decimal-center.js"></script>

<jsp:include page="footer.jsp"/>
