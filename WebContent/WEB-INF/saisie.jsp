<jsp:include page="header.jsp"/>
<%@ page import="com.a2bsystem.models.Constantes" %>
<script>document.getElementById("title").innerHTML = "SAISIE";</script>
<section id="section_login" class="section section-borne section-selection is-fullheight">
<div id="modal_wait" class="modal">
	<div class="modal-background"></div>
	<div class="modal-content modal-content-loader">
		<div class="loader"></div>
	</div>
</div>
<div id="modal_validation" class="modal">
	<div class="modal-bg-saisie modal-background"></div>
	<div class="modal-content">
		<div class="box">
			<article class="media">
			    <div class="media-left">
			        <figure class="image is-64x64">
			            <img src="inc/attention.png" alt="Image">
			        </figure>
			   	</div>
			    <div class="media-content">
			        <div class="content">
			        	<p>
			   				<strong><%= session.getAttribute("msg-validation") %></strong>
			              	<br>
							<span id="modal_text"><%= session.getAttribute("q-validation") %></span>
			            </p>
			          </div>
			     </div>
			  </article>
			  <div class="has-text-centered">
			  	<input id="modal_button_oui" class="modal_button button is-size-5 has-text-weight-bold" type="button" value="OUI" style="background-color:  #0063af; color: #fff ;">
			  	<input id="modal_button_non" class="modal_button button is-size-5 has-text-weight-bold" type="button" value="NON" style="background-color:  #0063af; color: #fff ;">
			  </div>
		</div>
	</div>
</div>
<div id="modal_partiel" class="modal">
	<div class="modal-bg-saisie modal-background"></div>
	<div class="modal-content">
		<div class="box">
			<article class="media">
			    <div class="media-left">
			        <figure class="image is-64x64">
			            <img src="inc/attention.png" alt="Image">
			        </figure>
			   	</div>
			    <div class="media-content">
			        <div class="content">
			        	<p>
			   				<strong id=modal_partiel_text></strong>
			              	<br>
							<span id="modal_text">Ajouter un lot ?</span>
			            </p>
			          </div>
			     </div>
			  </article>
			  <div class="has-text-centered">
			  	<input id="modal_partiel_button_oui" class="modal_button button is-size-5 has-text-weight-bold" type="button" value="OUI" style="background-color:  #0063af; color: #fff ;">
			  	<input id="modal_partiel_button_non" class="modal_button button is-size-5 has-text-weight-bold" type="button" value="NON" style="background-color:  #0063af; color: #fff ;">
			  </div>
		</div>
	</div>
</div>
<div id="modal_error" class="modal">
	<div class="modal-bg-saisie modal-background"></div>
	<div class="modal-content">
		<div class="box">
			<article class="media">
			    <div class="media-left">
			        <figure class="image is-64x64">
			            <img src="inc/attention.png" alt="Image">
			        </figure>
			   	</div>
			    <div class="media-content">
			        <div class="content">
			        	<p>
			   				<strong><%= session.getAttribute("msg-validation") %></strong>
			              	<br>
							<span id="modal_text"><%= session.getAttribute("q-validation") %></span>
			            </p>
			          </div>
			     </div>
			  </article>
			  <div class="has-text-centered">
			  	<input id="modal_button_ok" class="modal_button button is-size-5 has-text-weight-bold" type="button" value="Ok" style="background-color:  #0063af; color: #fff ;">
			  </div>
		</div>
	</div>
</div>
<script>
	if(("<%= session.getAttribute("error") %>" == "saisie-poids-hn") || ("<%= session.getAttribute("error") %>" == "saisie-montant-double")){
		$("#modal_validation").addClass("is-active"); 
		$("#modal_button_oui").click(function() {
			document.getElementById("force_validation").value = "True";
			document.getElementById("form_validation").submit();
		});
		$("#modal_button_non").click(function() {
			$("#modal_validation").removeClass("is-active");
			// remettre les values dans les input type text
		});
	}
	if(("<%= session.getAttribute("error") %>" == "unite-stock-non-saisie") || ("<%= session.getAttribute("error") %>" == "unite-fact-non-saisie")){
		$("#modal_error").addClass("is-active"); 
		$("#modal_button_ok").click(function() {
			$("#modal_error").removeClass("is-active");
		});
	}
</script>
	<div class="box">
	<div>
		<form class="form-fullwidth" method="post" action="Client">
			<div style="display:flex; margin-bottom: 0.75rem;">
				<div class="label-selection">
		    		<label class="label-block-left is-size-5">CLIENT</label>
		 		</div>
		      	<div class=" bloc-client">
		      		<div style="display:none;"><input type="text" id="prev_page" value="selection" name="prev_page"></div>
		        	<input id="input_client" class="input input-block-left is-size-5 false-input-text">
		        	<script>
		        		if ("<%= session.getAttribute("client") %>" != "null") {
			        		document.getElementById("input_client").value = "<%= session.getAttribute("client") %>";
		        		} else {
		        			if ("<%= session.getAttribute("exist_commande") %>"  == "1") {
			        			document.getElementById("input_client").value = "<%= session.getAttribute("client") %>";
		        			} else {
			        			document.getElementById("input_client").value = "Nom du client";
			        			document.getElementById("input_client").style.color = "darkgrey";
		        			}
		        		}
		        	</script>
		  		</div>
		  		<div class="label-selection" >
		    		<label class="is-size-5">DATE</label>
		 		</div>
		 		<div>
		      		<div>
		        		<input id="input_date" class="input input-lock-color input-date is-size-5 false-input-text" type="text" readonly>
		        		<script>
			        		var today = new Date();
			        		var dd = today.getDate();
			        		var mm = today.getMonth()+1; 
			        		var yyyy = today.getFullYear();
			        		if(dd<10) {dd='0'+dd;} 
			        		if(mm<10) {mm='0'+mm;} 
			        		document.getElementById("input_date").value = dd+'/'+mm+'/'+yyyy;;
		        		</script>
		      		</div>
		  		</div>
		  	</div>
  		</form>
	</div>
	<div >
		<div style="display:flex; margin-bottom: 0.75rem;">
			<div class="is-normal label-selection">
		    	<label class="label label-block-left is-size-5">ARTICLE</label>
		 	</div>
		    <div class="div-input-article">
		    	<input id="input_article" class="input input-block-left is-size-5 is-fullwidth false-input-text">
		    </div>
  		<form  method="post" action="RemplacementArticle">
  			<input class="button is-size-5 has-text-weight-bold" type="submit" value="REMPLACEMENT D'ARTICLE" style="background-color:  #0063af; color: #fff ;">
		</form>
		</div>
	</div>
	<div class="is-horizontal" style="display: flex; justify-content: space-between">
		<div class="field is-horizontal">
			<div class="is-normal label-selection">
		    	<label class="label label-block-left is-size-5">GAMME</label>
		 	</div>
			<div>
				<div class="field">
					<div class="control is-expanded">
				        <input id="input_gamme" style="width: 200px" class="use-keyboard-input-int input input-block-left is-size-5 is-fullwidth"  placeholder="Gamme" type="text">
				    </div>
				</div>   		
			</div>
		</div>
		<div class="field is-horizontal">
			<div class="is-normal label-selection">
		    	<label class="label is-size-5">COMMANDE</label>
		 	</div>
		  	<div>
		    	<div class="field">
		      		<div class="control is-expanded">
		        		<input id="input_commande" style="width: 200px" class="use-keyboard-input-int input input-block-left is-size-5 is-fullwidth" placeholder="N°Commande" type="text">
		      		</div>
		    	</div>
		    		
		  	</div>
		  </div>
	</div>
	<script>
		if("<%= session.getAttribute("mode") %>" == "direct") {
			document.getElementById("input_article").value = "Nom de l'article";
			document.getElementById("input_article").style.color = "darkgrey";
			document.getElementById("input_client").classList.add("input-color");
			document.getElementById("input_article").classList.add("input-color");
			document.getElementById("input_gamme").classList.add("input-color");
			document.getElementById("input_commande").classList.add("input-color");
			document.getElementById("input_client").setAttribute('type', 'submit');
			document.getElementById("input_article").setAttribute('type', 'submit');
		}else{
			document.getElementById("input_article").value = "<%= session.getAttribute("lib_art") %>";
			document.getElementById("input_gamme").value = "<%= session.getAttribute("gamme") %>";
			document.getElementById("input_commande").value = "<%= session.getAttribute("num_commande") %>";
			document.getElementById("input_client").classList.add("input-lock-color");
			document.getElementById("input_article").classList.add("input-lock-color");
			document.getElementById("input_gamme").classList.add("input-lock-color");
			document.getElementById("input_commande").classList.add("input-lock-color");
			document.getElementById("input_client").setAttribute('type', 'button');
			document.getElementById("input_article").setAttribute('type', 'button');
		}
	</script>
	<div class="field is-horizontal">
			<div class="is-normal label-selection">
		    	<label class="label label-block-left is-size-5">LOT</label>
		 	</div>
			<div>
				<div class="field">
					<div class="control is-expanded">
						<form class="form-fullwidth" method="post" action="Lot">
					        <input id="input_lot" style="width: 200px" class="use-keyboard-input-int input input-color input-block-left is-size-5 is-fullwidth  false-input-text" type="submit">
					    	<script>
			        		if ("<%= session.getAttribute("lot_lot") %>" != "null") {
				        		document.getElementById("input_lot").value = "<%= session.getAttribute("lot_lot") %>";
			        		} else {
				        		document.getElementById("input_lot").value = "N°Lot";
				        		document.getElementById("input_lot").style.color = "darkgrey";
			        		}
			        		</script>
			        	</form>
				    </div>
				</div>   		
			</div>
		</div>
</div>
<div style="display: flex;">
<div class="box box-saisie">
	<div class="field is-horizontal">
			<div class="field is-horizontal">
				<div class="is-normal label-selection">
		    		<label class="label label-block-left is-size-5">COLIS</label>
		 		</div>
		  		<div class="field-body">
		    		<div class="field">
		      			<div class="control is-expanded">
		        			<input id="input_colis" class="input input-color is-size-5 is-fullwidth input-block-left use-keyboard-input-saisie-decimal" min=0 type="number">
		      			</div>
		    		</div>
		  		</div>
		  		<div class="is-normal label-selection is-size-5">
		  			<p>	&nbsp;	&nbsp;	&nbsp;
		  			</p>
		  		</div>
		  	</div>
	</div>
		<div style="display:none;" class="field is-horizontal">
			<div class="field is-horizontal">
				<div class="is-normal label-selection">
		    		<label class="label label-block-left is-size-5">POIDS BRUT</label>
		 		</div>
		  		<div class="field-body">
		    		<div class="field">
		      			<div class="control is-expanded">
		        			<input  id="input_poids_brut" class="input input-color is-size-5 is-fullwidth input-block-left use-keyboard-input-decimal" min=0 type="number">
		      				<script>
				        		if ("<%= session.getAttribute("poids_brut") %>" != "null") {
					        		document.getElementById("input_poids_brut").value = "<%= session.getAttribute("poids_brut") %>";
				        		} else {
				        			document.getElementById("input_poids_brut").value = "";
				        		}
				        	</script>
		      			</div>
		    		</div>
		  		</div>
		  		<div class="is-normal label-selection is-size-5">
		  			<p>Kg
		  			</p>
		  		</div>
		  	</div>
	</div>
		<div style="display:none;" class="field is-horizontal">
			<div class="field is-horizontal">
				<div class="is-normal label-selection">
		    		<label class="label label-block-left is-size-5">TARE UNITAIRE</label>
		 		</div>
		  		<div class="field-body">
		    		<div class="field">
		      			<div class="control is-expanded">
		        			<input  id="input_tare_unitaire" class="input input-color is-size-5 is-fullwidth input-block-left use-keyboard-input-decimal" min=0 type="number">
		      				<script>
				        		if ("<%= session.getAttribute("tare_unitaire") %>" != "null") {
					        			document.getElementById("input_tare_unitaire").value = "<%= session.getAttribute("tare_unitaire") %>";
				        		} else {
				        			document.getElementById("input_tare_unitaire").value = "";
				        		}
				        	</script>
		      			</div>
		    		</div>
		  		</div>
		  		<div class="is-normal label-selection is-size-5">
		  			<p>Kg
		  			</p>
		  		</div>
		  	</div>
	</div>
		<div class="field is-horizontal">
			<div class="field is-horizontal">
				<div class="is-normal label-selection">
		    		<label class="label label-block-left is-size-5">POIDS NET</label>
		 		</div>
		  		<div class="field-body">
		    		<div class="field">
		      			<div class="control is-expanded">
		        			<input  id="input_poids_net" class="input input-color is-size-5 is-fullwidth input-block-left use-keyboard-input-saisie-decimal" type="number">
		      			</div>
		    		</div>
		  		</div>
		  		<div class="is-normal label-selection is-size-5">
		  			<p>Kg
		  			</p>
		  		</div>
		  	</div>
	</div>
		<div class="field is-horizontal">
			<div class="field is-horizontal">
				<div class="is-normal label-selection">
		    		<label class="label label-block-left is-size-5">PIECES</label>
		 		</div>
		  		<div class="field-body">
		    		<div class="field">
		      			<div class="control is-expanded">
		        			<input id="input_pieces" class="input input-color is-size-5 is-fullwidth input-block-left use-keyboard-input-saisie-decimal" min=0 pattern="\d*" type="number">
		      				<script>
				        		if ("<%= session.getAttribute("pieces") %>" != "null") {
					        			document.getElementById("input_pieces").value = "<%= session.getAttribute("pieces") %>";
				        		} else {
				        			document.getElementById("input_pieces").value = "";
				        		}
				        	</script>
		      			</div>
		    		</div>
		  		</div>
		  		<div class="is-normal label-selection is-size-5">
		  			<p>	&nbsp;	&nbsp;	&nbsp;
		  			</p>
		  		</div>
		  	</div>
		</div>
</div>
<div class="box box-saisie">
	<div class="field is-horizontal">
			<div class="field is-horizontal">
				<div class="is-normal label-selection">
		    		<label class="label label-block-left is-size-5">COLIS</label>
		 		</div>
		  		<div class="field-body">
		    		<div class="field">
		      			<div class="control is-expanded">
		        			<input id="input_colis_indication" class="input false-input-text input-lock-color is-size-5 is-fullwidth input-block-left" min=0 type="button">
		      			</div>
		    		</div>
		  		</div>
		  		<div class="is-normal label-selection is-size-5">
		  			<p>	&nbsp;	&nbsp;	&nbsp;
		  			</p>
		  		</div>
		  	</div>
	</div>
		<div style="display:none;" class="field is-horizontal">
			<div class="field is-horizontal">
				<div class="is-normal label-selection">
		    		<label class="label label-block-left is-size-5">POIDS BRUT</label>
		 		</div>
		  		<div class="field-body">
		    		<div class="field">
		      			<div class="control is-expanded">
		        			<input  id="input_poids_brut_indication" class="input false-input-text input-lock-color is-size-5 is-fullwidth input-block-left" min=0 type="button">
		      				<script>
				        		if ("<%= session.getAttribute("poids_brut") %>" != "null") {
					        		document.getElementById("input_poids_brut").value = "<%= session.getAttribute("poids_brut") %>";
				        		} else {
				        			document.getElementById("input_poids_brut").value = "";
				        		}
				        	</script>
		      			</div>
		    		</div>
		  		</div>
		  		<div class="is-normal label-selection is-size-5">
		  			<p>Kg
		  			</p>
		  		</div>
		  	</div>
	</div>
		<div style="display:none;" class="field is-horizontal">
			<div class="field is-horizontal">
				<div class="is-normal label-selection">
		    		<label class="label label-block-left is-size-5">TARE UNITAIRE</label>
		 		</div>
		  		<div class="field-body">
		    		<div class="field">
		      			<div class="control is-expanded">
		        			<input  id="input_tare_unitaire_indication" class="input false-input-text input-lock-color is-size-5 is-fullwidth input-block-left" min=0 type="button">
		      				<script>
				        		if ("<%= session.getAttribute("tare_unitaire") %>" != "null") {
					        			document.getElementById("input_tare_unitaire").value = "<%= session.getAttribute("tare_unitaire") %>";
				        		} else {
				        			document.getElementById("input_tare_unitaire").value = "";
				        		}
				        	</script>
		      			</div>
		    		</div>
		  		</div>
		  		<div class="is-normal label-selection is-size-5">
		  			<p>Kg
		  			</p>
		  		</div>
		  	</div>
	</div>
		<div class="field is-horizontal">
			<div class="field is-horizontal">
				<div class="is-normal label-selection">
		    		<label class="label label-block-left is-size-5">POIDS NET</label>
		 		</div>
		  		<div class="field-body">
		    		<div class="field">
		      			<div class="control is-expanded">
		        			<input  id="input_poids_net_indication" class="input false-input-text input-lock-color is-size-5 is-fullwidth input-block-left" type="button">
		      			</div>
		    		</div>
		  		</div>
		  		<div class="is-normal label-selection is-size-5">
		  			<p>Kg
		  			</p>
		  		</div>
		  	</div>
	</div>
		<div class="field is-horizontal">
			<div class="field is-horizontal">
				<div class="is-normal label-selection">
		    		<label class="label label-block-left is-size-5">PIECES</label>
		 		</div>
		  		<div class="field-body">
		    		<div class="field">
		      			<div class="control is-expanded">
		        			<input id="input_pieces_indication" class="input false-input-text input-lock-color is-size-5 is-fullwidth input-block-left" min=0 pattern="\d*" type="button">
		      				<script>
				        		if ("<%= session.getAttribute("pieces") %>" != "null") {
					        			document.getElementById("input_pieces").value = "<%= session.getAttribute("pieces") %>";
				        		} else {
				        			document.getElementById("input_pieces").value = "";
				        		}
				        	</script>
		      			</div>
		    		</div>
		  		</div>
		  		<div class="is-normal label-selection is-size-5">
		  			<p>	&nbsp;	&nbsp;	&nbsp;
		  			</p>
		  		</div>
		  	</div>
		</div>
</div>
<script>
	console.log("<%= session.getAttribute("unite") %>")
	console.log("<%= session.getAttribute("qte_cde") %>")
	if ("<%= session.getAttribute("unite") %>" == "Colis") {
		document.getElementById("input_colis").classList.remove("input-color");
		document.getElementById("input_colis").style.backgroundColor = "#ffc4c4";
	} else {
		if ("<%= session.getAttribute("unite") %>" == "Kg") {
			document.getElementById("input_poids_net").classList.remove("input-color");
			document.getElementById("input_poids_net").style.backgroundColor = "#ffc4c4";
		} else {
			document.getElementById("input_pieces").classList.remove("input-color");
			document.getElementById("input_pieces").style.backgroundColor = "#ffc4c4";
		}
	}
	document.getElementById("input_colis_indication").value = "<%= session.getAttribute("colis_cde") %>";
	document.getElementById("input_poids_net_indication").value = "<%= session.getAttribute("poids_cde") %>";
	document.getElementById("input_pieces_indication").value = "<%= session.getAttribute("pieces_cde") %>";
	document.getElementById("input_colis").value = "<%= session.getAttribute("colis_cde") %>";
	document.getElementById("input_poids_net").value = "<%= session.getAttribute("poids_cde") %>";
	document.getElementById("input_pieces").value = "<%= session.getAttribute("pieces_cde") %>";

	window.onload = function() {
		if ("<%= session.getAttribute("unite_fact") %>" == "C") {
			document.getElementById("input_colis").value = "";
			document.getElementById("input_colis").classList.remove("input-color");
			document.getElementById("input_colis").style.backgroundColor = "#F9FFC4";
			document.getElementById("input_colis").focus();
			document.getElementById("input_colis_indication").style.fontWeight = "800";
		} else {
			if ("<%= session.getAttribute("unite_fact") %>" == "K" || "<%= session.getAttribute("unite_fact") %>" == "k") {
				document.getElementById("input_poids_net").value = "";
				document.getElementById("input_poids_net").classList.remove("input-color");
				document.getElementById("input_poids_net").style.backgroundColor = "#F9FFC4";
				document.getElementById("input_poids_net").focus();
				document.getElementById("input_poids_net_indication").style.fontWeight = "800";
			} else {
				document.getElementById("input_pieces").value = "";
				document.getElementById("input_pieces").classList.remove("input-color");
				document.getElementById("input_pieces").style.backgroundColor = "#F9FFC4";
				document.getElementById("input_pieces").focus();
				document.getElementById("input_pieces_indication").style.fontWeight = "800";
			}
		}
	}
</script>
<div id="block_dlc_prix_montant" class="box box-saisie" style="height: fit-content;">
	<div class="field is-horizontal">
			<div class="field is-horizontal">
				<div class="is-normal label-selection">
		    		<label class="label label-block-left is-size-5">DLC</label>
		 		</div>
		  		<div style="width: 190px;">
		    		<div class="field">
		      			<div class="control is-expanded">
		        			<input id="input_dlc" class="input input-color is-size-5 is-fullwidth input-block-left" min=0 type="date">
		      			</div>
		    		</div>
		  		</div>
		  	</div>
	</div>
		<div class="field is-horizontal">
			<div class="field is-horizontal">
				<div class="is-normal label-selection">
		    		<label class="label label-block-left is-size-5">PRIX UNITAIRE</label>
		 		</div>
		  		<div class="field-body">
		    		<div class="field">
		      			<div class="control is-expanded">
		        			<input  id="input_prix_unitaire" class="input input-color is-size-5 is-fullwidth input-block-left use-keyboard-input-decimal" min=0 type="number">
		      				<script>
				        		if ("<%= session.getAttribute("poids_brut") %>" != "null") {
					        			document.getElementById("input_poids_brut").value = "<%= session.getAttribute("poids_brut") %>";
				        		} else {
				        			document.getElementById("input_poids_brut").value = "";
				        		}
				        	</script>
		      			</div>
		    		</div>
		  		</div>
		  		<div class="is-normal label-selection is-size-5">
		  			<p>&#8364;
		  			</p>
		  		</div>
		  	</div>
	</div>
		<div class="field is-horizontal">
			<div class="field is-horizontal">
				<div class="is-normal label-selection">
		    		<label class="label label-block-left is-size-5">MONTANT</label>
		 		</div>
		  		<div class="field-body">
		    		<div class="field">
		      			<div class="control is-expanded">
		        			<input  id="input_montant" class="input input-color is-size-5 is-fullwidth input-block-left use-keyboard-input-decimal" type="number" readonly>
		      			</div>
		    		</div>
		  		</div>
		  	</div>
	</div>
</div>
</div>
<script>
// calcul des champs colis/poids brut/tare unitaire/poids net
document.getElementById("input_colis").addEventListener('change', calcul);
document.getElementById("input_tare_unitaire").addEventListener('change', calcul);
document.getElementById("input_poids_net").addEventListener('change', calcul);
document.getElementById("input_poids_brut").addEventListener('change', calcul);
function calcul() {
	
	var colis = document.getElementById("input_colis").value;
	var poids_brut = document.getElementById("input_poids_brut").value;
	var tare_unitaire = document.getElementById("input_tare_unitaire").value;
	var poids_net = document.getElementById("input_poids_net").value;
	console.log(poids_net)
	if(poids_brut == ""){
		if(poids_net!="" && colis!=""){
			document.getElementById("input_poids_brut").value = (poids_net-(tare_unitaire*colis))/colis;
		}
	}
	if(tare_unitaire == ""){
		if(poids_net!="" && colis!="" && poids_brut!=""){
			document.getElementById("input_tare_unitaire").value = (poids_net/colis)-poids_brut;
		}
	}
	if(poids_net == ""){
		if(poids_brut!="" && colis!=""){
			document.getElementById("input_poids_net").value = colis*(poids_brut-tare_unitaire);
		}
	}
}
</script>
</section>
<div class="box box-button p-1">
	<div class="navigation-bar">
	    <div>
	    	<form id="form_commande" class="form-fullwidth" method="post" action="Selection">
	    			<div style="display:none;"><input type="text" id="prev_page" value="saisie_retour" name="prev_page"></div>  			
	    			<input class="button is-size-5 has-text-weight-bold" type="submit" value="RETOUR" style="background-color:  <%= Constantes.COULBTN2 %>; color: <%= Constantes.COULBTNTXT %> ;">
	    	</form>
    	</div>
		<div style="display: inline-flex;">
			<div id="block_rupture" class="margin-button">
		    	<form id="form_rupture" class="form-fullwidth" method="post" action="Selection">
		    			<div style="display:none;"><input type="text" id="prev_page" value="rupture" name="prev_page"></div>  			
		    			<input class="button is-size-5 has-text-weight-bold" type="submit" value="RUPTURE" style="background-color:  <%= Constantes.COULBTN %>; color: <%= Constantes.COULBTNTXT %> ;">
		    	</form>
			</div>
			<div id="block_recharge" class="margin-button">
		    	<form id="form_recharge" class="form-fullwidth" method="post" action="Selection">
		    			<div style="display:none;"><input type="text" id="prev_page" value="recharge" name="prev_page"></div>  			
		    			<input class="button is-size-5 has-text-weight-bold" type="submit" value="RECHARGEMENT" style="background-color:  <%= Constantes.COULBTN %>; color: <%= Constantes.COULBTNTXT %> ;">
		    	</form>
			</div>
			<div id="block_lotna" class="margin-button">
		    	<div style="display:none;"><input type="text" id="prev_page" value="selection" name="prev_page"></div>  			
		    	<input id="lotna" class="button is-size-5 has-text-weight-bold" type="button" value="LOT N/A" style="background-color:  <%= Constantes.COULBTN %>; color: <%= Constantes.COULBTNTXT %> ;">
			</div>
			<script>
				document.getElementById("lotna").addEventListener("click", function(){
    				document.getElementById("input_lot").value = "N/A";
	            })				 
			</script>
			<script>
				if("<%= session.getAttribute("mode") %>" == "direct") {
					document.getElementById("block_rupture").style.display = "none";
					document.getElementById("block_recharge").style.display = "none";
				}else{
					document.getElementById("block_dlc_prix_montant").style.display = "none";
				}
			</script>
    	</div>
    	<div>
	    	<form id="form_validation" class="form-fullwidth" method="post" action="Selection">
	    			<div style="display:none;"><input type="text" id="prev_page" value="validation" name="prev_page"></div>
	    			<div style="display:none;"><input type="text" id="colis" value="validation" name="colis"></div> 
	    			<div style="display:none;"><input type="text" id="poids_brut" value="validation" name="poids_brut"></div> 
	    			<div style="display:none;"><input type="text" id="tare_unitaire" value="validation" name="tare_unitaire"></div> 
	    			<div style="display:none;"><input type="text" id="poids_net" value="validation" name="poids_net"></div> 
	    			<div style="display:none;"><input type="text" id="pieces" value="validation" name="pieces"></div> 
	    			<div style="display:none;"><input type="text" id="dlc" value="validation" name="dlc"></div> 
	    			<div style="display:none;"><input type="text" id="prix_unitaire" value="validation" name="prix_unitaire"></div> 
	    			<div style="display:none;"><input type="text" id="montant" value="validation" name="montant"></div>
	    			<div style="display:none;"><input type="text" id="force_validation" value="False" name="force_validation"></div>
	    			<div style="display:none;"><input type="text" id="partiel" value="False" name="partiel"></div>
	    			<input id="valider" class="button is-size-5 has-text-weight-bold" type="button" value="VALIDER" style="background-color:  <%= Constantes.COULBTN2 %>; color: <%= Constantes.COULBTNTXT %> ;">
	    	</form>
	    	<script>
				document.getElementById("valider").addEventListener('click', function(){
					$("#modal_wait").addClass("is-active");
					if(document.getElementById("input_colis").value == 0){
						document.getElementById("colis").value = "";
					}else{
						document.getElementById("colis").value = document.getElementById("input_colis").value;
					}
					document.getElementById("poids_brut").value = document.getElementById("input_poids_brut").value;
					document.getElementById("tare_unitaire").value = document.getElementById("input_tare_unitaire").value;
					if(document.getElementById("input_poids_net").value == 0){
						document.getElementById("poids_net").value = "";
					}else{	
						document.getElementById("poids_net").value = document.getElementById("input_poids_net").value;
					}
					if(document.getElementById("input_pieces").value == 0){
						document.getElementById("pieces").value = "";
					}else{
						document.getElementById("pieces").value = document.getElementById("input_pieces").value;
					}
					document.getElementById("dlc").value = document.getElementById("input_dlc").value;
					document.getElementById("prix_unitaire").value = document.getElementById("input_prix_unitaire").value;
					document.getElementById("montant").value = document.getElementById("input_montant").value;
				    
				    	document.getElementById("partiel").value = "";
				    	document.getElementById("form_validation").submit();
				    
				})
			</script>
    	</div>
   	</div>
</div>

<jsp:include page="footer.jsp"/>
<script src="js/virtual-keyboard-saisie-decimal-center.js"></script>