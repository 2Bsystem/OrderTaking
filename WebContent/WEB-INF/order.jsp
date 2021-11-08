<jsp:include page="header.jsp"/>
<%@ page import="java.util.List" %>
<%@ page import="com.a2bsystem.models.Ord" %>
<%@ page import="com.a2bsystem.models.Pays" %>
<%@ page import="com.a2bsystem.models.Constantes" %>
<script src="https://kit.fontawesome.com/7874b6031e.js" crossorigin="anonymous"></script>
<script>document.getElementById("title").innerHTML = "ORDER";</script>
<script src="js/virtual-keyboard-order-client-divers.js"></script>
<section id="section_login" class="section section-borne section-selection is-fullheight">
<script>
	$(window).load(function() {
		console.log("<%= session.getAttribute("client_divers_order") %>");
		if ("<%= session.getAttribute("client_divers_order") %>" == "1") {
			$("#modal_text").addClass("is-active");
			document.getElementById("input_text_modal_nom").focus();
			document.getElementById("input_text_modal_adresse").addEventListener("click", function(){
				//$("#modal_text").removeClass("is-active");
				document.getElementById("input_text_modal_adresse").focus();
			});
			$("#modal_button_valider").click(function() {
				document.getElementById("nom_client_divers").value = document.getElementById("input_text_modal_nom").value;
				document.getElementById("adresse_client_divers").value = document.getElementById("input_text_modal_adresse").value;
				document.getElementById("adresse2_client_divers").value = document.getElementById("input_text_modal_adresse2").value;
				document.getElementById("cp_client_divers").value = document.getElementById("input_text_modal_cp").value;
				document.getElementById("ville_client_divers").value = document.getElementById("input_text_modal_ville").value;
				document.getElementById("code_pays_client_divers").value = document.getElementById("input_text_modal_pays").value;
				$("#modal_text").removeClass("is-active");
			});
			$("#modal_button_annuler").click(function() {
				$("#modal_text").removeClass("is-active");
			});
		}
	});
</script>
<div id="modal_text" class="modal">
	<div class="modal-css modal-content">
		<div id="modal_box" class="box modal-box-css">
			<div class="has-text-centered">
				<h2 class="is-size-5 has-text-weight-bold">CLIENT PARTICULIER :</h2>
				<div id="label_modal" class="modal-margin is-size-5 has-text-weight-bold"></div>
				<div class="centerChamp">
					<div class="diversChamp">
						<span class="is-size-5 span-client-divers">NOM :</span> 
						<input id="input_text_modal_nom" class="input input-client-divers modal-margin is-size-5 use-keyboard-input-order-client-divers" type="text" autocomplete="chrome-off">
					</div>
					<div class="diversChamp">
						<span class="is-size-5 span-client-divers">ADRESSE :</span>
						<input id="input_text_modal_adresse" class="input input-client-divers modal-margin is-size-5 use-keyboard-input-order-client-divers" type="text" autocomplete="chrome-off">			
					</div>
					<div class="diversChamp">
						<span class="is-size-5 span-client-divers">COMPLEMENT D'ADRESSE :</span>
						<input id="input_text_modal_adresse2" class="input input-client-divers modal-margin is-size-5 use-keyboard-input-order-client-divers" type="text" autocomplete="chrome-off"> 				
					</div>
					<div class="diversChamp">
						<span class="is-size-5 span-client-divers">CODE POSTAL :</span>
						<input id="input_text_modal_cp" class="input input-client-divers modal-margin is-size-5 use-keyboard-input-order-client-divers" type="text" autocomplete="chrome-off">
					</div>
					<div class="diversChamp">
						<span class="is-size-5 span-client-divers">VILLE : </span>
						<input id="input_text_modal_ville" class="input input-client-divers modal-margin is-size-5 use-keyboard-input-order-client-divers" type="text" autocomplete="chrome-off">
					</div>
					<div class="diversPays">

						<span class="is-size-5 span-client-divers">PAYS :</span>
						<div class="select div-select-client-divers input-client-divers" >
							<select id="input_text_modal_pays" class="select-fullwidth is-size-5">
								<%
								if(request.getParameter("prev_page").equals("client")) {
									if(session.getAttribute("client_divers_order").equals("1")) {
										for (Pays liste_pays : (List<Pays>) request.getAttribute("liste_pays")) {
								%>
								<option value="<%= liste_pays.code %>"><%= liste_pays.libelle %></option>
								<%		
										}
									}
								}
								%>								
							</select>
						</div>
					</div>
				</div>
				<input id="modal_button_valider" class="modal_button button is-size-5 has-text-weight-bold" type="button" value="VALIDER" style="background-color: #0063af; color: #fff;"> 
				<input id="modal_button_annuler" class="modal_button button is-size-5 has-text-weight-bold" type="button" value="ANNULER" style="background-color: #0063af; color: #fff;">
			</div>
		</div>
	</div>
</div>   
<div class="box">
	<div>
		<form class="form-fullwidth" method="post" action="Client">
			<div style="display:flex; margin-bottom: 0.75rem;">
				<div class="label-selection">
		    		<label class="label-block-left is-size-5">CLIENT</label>
		 		</div>
		      	<div class=" bloc-client">
		      		<div style="display:none;"><input type="text" id="prev_page" value="order" name="prev_page"></div>
					<input id="input_client" class="input input-color input-block-left is-size-5 false-input-text" type="submit" readonly>
		        	<script>
		        		if ("<%= session.getAttribute("client_order") %>" != "null") {
			        		document.getElementById("input_client").value = "<%= session.getAttribute("client_order") %>";
		        		} else {
			        		document.getElementById("input_client").value = "Nom du client";
			        		document.getElementById("input_client").style.color = "darkgrey";
		        		}
		        		if ("<%= session.getAttribute("exist_order") %>" == "1") {
		        			document.getElementById("input_client").classList.remove("input-color");
		        			document.getElementById("input_client").classList.add("input-lock-color");
		        			document.getElementById("input_client").type = "button";
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
	<form method="post" action="Article">
		<div style="text-align: right;">
			<div style="display:none;"><input type="text" id="nom_client_divers" value="order" name="nom_client_divers"></div>
			<div style="display:none;"><input type="text" id="adresse_client_divers" value="order" name="adresse_client_divers"></div>
			<div style="display:none;"><input type="text" id="adresse2_client_divers" value="order" name="adresse2_client_divers"></div>
			<div style="display:none;"><input type="text" id="cp_client_divers" value="order" name="cp_client_divers"></div>
			<div style="display:none;"><input type="text" id="ville_client_divers" value="order" name="ville_client_divers"></div>
			<div style="display:none;"><input type="text" id="code_pays_client_divers" value="order" name="code_pays_client_divers"></div>
			<div style="display:none;"><input type="text" id="prev_page" value="order" name="prev_page"></div>
			<input id="ajouter_article" class="button is-size-5 has-text-weight-bold" type="submit" value="+ AJOUTER ARTICLE" style="background-color:  #0063af; color: #fff ; display:none;">
			<script>
		        if ("<%= session.getAttribute("client_order") %>" != "null") {
			        document.getElementById("ajouter_article").style.display = "inline-flex"
		        }
		    </script>
		</div>
	</form>
</div>
<div class="box" >
	<form id="form_article_select" class="form-fullwidth" method="post" action="Saisie">
		<style>
			.tr-selection:hover {
				transition-duration: 0.5s;
				background-color: <%= Constantes.COULBTN2 %>;
			}
		</style>
	  	<table id="table" class="table is-size-5 table-order is-fullwidth">
	      <thead style="display:block;" class="thead-color">
	        <tr>
	          <th class="has-text-white largeur1">LIBELLE ARTICLE</th>
	          <th class="has-text-white largeur2">COLIS</th>
	          <th class="has-text-white largeur3">POIDS NET (KG)</th>
	          <th class="has-text-white largeur4">PIECES</th>
	          <th class="has-text-white largeur5">MONTANT</th>
	          <th class="has-text-white largeur6"></th>
	        </tr>
	      </thead>
	      <tbody style="display:block; overflow-y: auto; height:calc(100vh - 510px);">
			 <%
	      	if ((session.getAttribute("exist_order") == "1" &&
	      	    (request.getParameter("prev_page").equals("article") ||
	      	     request.getParameter("prev_page").equals("saisie_order"))
	      	    ) || (request.getAttribute("ligne") == "1" && request.getParameter("prev_page").equals("annuler"))
	      	      		 ) {
	      	    	  int i = 0;
	      	    	  for (Ord orders : (List<Ord>) request.getAttribute("orders")) {
	      %>
			<tr id="<%= orders.num_ligne %>" class="tr-selection">
				<td class="largeur1" id="etat<%= i %>"><%= orders.libelle_article %></td>
				<td class="largeur2"><%= orders.colis %></td>
				<td class="largeur3" id="qte<%= i %>"><%= orders.poids_net %></td>
				<td class="largeur4" id="unite<%= i %>"><%= orders.pieces %></td>
				<td class="largeur5"><%= orders.montant %></td>
				<td class="largeur6">					
					<a class="dlt" name="trash" style="cursor: pointer" data-ordernr="<%= orders.num_commande %>" data-ordradnr="<%= orders.num_ligne %>">
						<i class="fas fa-trash-alt"></i>
					</a>				
				</td>				
			</tr>
		  <% i++;
		  	}
		  } 
			%>
	      </tbody>
	    </table>
	   	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	   	<div style="display:none;"><input type="text" id="prev_page" value="selection" name="prev_page"></div>
	   	<div style="display:none;"><input type="text" id="code_art" name="code_art"></div>
	   	<div style="display:none;"><input type="text" id="lib_art" name="lib_art"></div>
	   	<div style="display:none;"><input type="text" id="gamme" name="gamme"></div>
	   	<div style="display:none;"><input type="text" id="ord_rest_nr" name="ord_rest_nr"></div>
	   	<div style="display:none;"><input type="text" id="ord_rad_nr_str_pos" name="ord_rad_nr_str_pos"></div>
	   	<div style="display:none;"><input type="text" id="dummy_unique_id" name="dummy_unique_id"></div>
	   	<div style="display:none;"><input type="text" id="qte_cde" name="qte_cde"></div>
	   	<div style="display:none;"><input type="text" id="unite" name="unite"></div>
	   	
	   	<div style="display:none;"><input type="text" id="unite_cde" name="unite_cde"></div>
	   	<div style="display:none;"><input type="text" id="unite_fact" name="unite_fact"></div>
	   	<div style="display:none;"><input type="text" id="unite_stock" name="unite_stock"></div>
	   	<div style="display:none;"><input type="text" id="colis_cde" name="colis_cde"></div>
	   	<div style="display:none;"><input type="text" id="pieces_cde" name="pieces_cde"></div>
	   	<div style="display:none;"><input type="text" id="poids_cde" name="poids_cde"></div>
	   	<div style="display:none;"><input type="text" id="colis_prep" name="colis_prep"></div>
	   	<div style="display:none;"><input type="text" id="pieces_prep" name="pieces_prep"></div>
	   	<div style="display:none;"><input type="text" id="poids_prep" name="poids_prep"></div>
	   	
	   	
	   	
	   	<div style="display:none;"><input type="text" id="ligne" name="ligne"></div>
   	</form>
</div>
</section>

<!-- MODAL Suppression ligne order -->

    	 <div id="modalDelete">				 
			<div id="modalDEL">
				<header class="modal-card-head">
      				<p class="modal-card-title" style="text-align:center">
      					<i class="fas fa-exclamation-triangle"></i>
      					 Êtes-vous sûr de vouloir supprimer cette ligne ?
      				</p>
    			</header>
    			<form method="post" action="AnnulerLigneOrder">				 
				<div style="display:flex; 
							flex-direction:row;
							justify-content:center;
							margin:auto;
							margin-bottom:30px;
							margin-top:30px">
					<button id="validerDel"
							type="submit" 
							class="button aside-button is-primary" 
							name="validation" 
							style="margin-right:20px;
									padding-left:50px;
									padding-right:50px"
							>
							Oui
					</button>
					<button id="annuler" 
							class="button aside-button is-danger" 
							type="button"
							style="	padding-left:50px;
									padding-right:50px"
							>
							Non
					</button>
				</div>
					
					<div style="display:none;"><input type="text" id="annuler" value="annuler" name="prev_page"></div>
					<div style="display:none;"><input type="text" id="ordradnr" name="ordradnr"></div>
					<div style="display:none;"><input type="text" id="ordernr" name="ordernr"></div>
				</form> 
				
			</div>
		</div> 
		<script>

		$(document).ready(function(){
			 $('.dlt').click(function(){
		          old = $(this);
		          $('#modalDelete').show();
		            
		             $('#validerDel').click(function(){
		              //old.closest('tr').remove();
		             $('#modalDelete').hide();
					 });  
		            
		            $('#annuler').click(function(){
	            	$('#modalDelete').hide();
		    		});
			});
		});
						
		var elements = document.getElementsByName("trash");

		var myFunction = function() {
		    
		    document.getElementById("ordernr").value = this.getAttribute("data-ordernr");
			document.getElementById("ordradnr").value = this.getAttribute("data-ordradnr");
		    
		};

		for (var i = 0; i < elements.length; i++) {
		    elements[i].addEventListener('click', myFunction, false);
		}
			
		</script>

<div class="box box-button p-1">
	<div class="navigation-bar">
	    <div>
    		 <form id="form_retour" class="form-fullwidth" method="post" action="Commande">
    			<div style="display:none;"><input type="text" value="deconnexion" name="prev_page"></div>
				<input id="input_retour" class="button is-size-5 has-text-weight-bold" value="COMMANDE" type="submit" style="background-color:  <%= Constantes.COULBTN2 %>; color: <%= Constantes.COULBTNTXT %> ;">
			</form>
    	</div>
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
			<div>
		    	<form id="form_commande" class="form-fullwidth" method="post" action="Order"> 
	    			<div style="display:none;"><input type="text" id="prev_page"  value="edition_facture" name="prev_page"></div>  			
	    			<input class="button is-size-5 has-text-weight-bold" 
	    				   onclick="spinner()" 
	    				   type="submit"
	    				   value="EDITION FACTURE" 
	    				   style="background-color:  <%= Constantes.COULBTN %>; color: <%= Constantes.COULBTNTXT %> ;">
		    	</form>
	    	</div>
	    	
	    	<div style="display: none;">
	    	<div class="container has-text-centered">
		    	<form id="form_raz" class="form-fullwidth" method="post" action="Selection">
		    		<div style="display:none;"><input type="text" value="raz" name="prev_page"></div>
			    	<button id="raz" 
			    		    name="raz" 
			    		    class="button is-size-5 has-text-weight-bold" 
			    		    type="submit" 
			    		    value="RAZ" 
			    		    style="background-color:  <%= Constantes.COULBTN %>; 
			    		    	   color: <%= Constantes.COULBTNTXT %> ;">
			    		    RAZ
	    		    </button>
				</form>
			</div>
		</div>
	<div style="display: none;">
    	<form id="form_commande" class="form-fullwidth" method="post" action="Saisie">
    			<div style="display:none;">
    				<input type="text" id="prev_page" value="ajouter" name="prev_page">
    			</div>  			
    				<input class="button is-size-5 has-text-weight-bold" 
    				   	   type="submit" 
    				       value="AJOUTER" 
    				       style="background-color: <%= Constantes.COULBTN %>; 
    				   		      color: <%= Constantes.COULBTNTXT %> ;">
    	</form>
   	</div>
    	<div style="display: none;" id="validate_button">
	    	<form id="form_commande" class="form-fullwidth" method="post" action="Saisie">
    			<div style="display:none;"><input type="text" id="prev_page" value="selection" name="prev_page"></div>  			
    			<input class="button is-size-5 has-text-weight-bold" type="submit" value="VALIDER" style="background-color:  <%= Constantes.COULBTN2 %>; color: <%= Constantes.COULBTNTXT %> ;">
	    	</form>
    	</div>
   	</div>
</div>
<script>
   	function spinner() {
		document.getElementById('loading_screen').style.display = "flex";
       }
</script>
<script src="js/virtual-keyboard-saisie-int.js"></script>
<script src="js/virtual-keyboard-saisie-decimal.js"></script>
<jsp:include page="footer.jsp"/>
