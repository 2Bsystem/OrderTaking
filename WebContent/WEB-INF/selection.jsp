<jsp:include page="header.jsp"/>
<%@ page import="java.util.List" %>
<%@ page import="com.a2bsystem.models.DetailCmde" %>
<%@ page import="com.a2bsystem.models.Constantes" %>
<script>document.getElementById("title").innerHTML = "SELECTION";</script> 
<section id="section_login" class="section section-borne section-selection is-fullheight">
<div class="box">
	<div>
		<form class="form-fullwidth" method="post" action="Client">
			<div style="display:flex; margin-bottom: 0.75rem;">
				<div class="label-selection">
		    		<label class="label-block-left is-size-5">CLIENT</label>
		 		</div>
		      	<div class=" bloc-client">
		      		<div style="display:none;"><input type="text" id="prev_page" value="selection" name="prev_page"></div>
		        	<input id="input_client" class="input input-lock-color input-block-left is-size-5 false-input-text" type="button" readonly>
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
	<div id="block_num_commande" class="field is-horizontal">
				<div class="is-normal label-selection">
		    		<label class="label label-block-left is-size-5">COMMANDE</label>
		 		</div>
		  		<div>
		    		<div class="field">
		      			<div class="control is-expanded">
		        			<input id="input_numOA" style="width: 200px" class="input-lock-color input input-block-left is-size-5 is-fullwidth" value="<%= session.getAttribute("num_commande") %>" type="text" readonly>
		      			</div>
		    		</div>
		    		
		  		</div>
	</div>
	<script>			        	
		if ("<%= session.getAttribute("mode") %>" == "commande") {
			document.getElementById("block_num_commande").style.display = "flex";
		} else {
			document.getElementById("block_num_commande").style.display = "none";
		}
	</script>
</div>
<div class="box" >
	<form id="form_article_select" class="form-fullwidth" method="post" action="Saisie">
		<style>
			.tr-selection:hover {
				transition-duration: 0.5s;
				background-color: <%= Constantes.COULBTN2 %>;
			}
		</style>
	  	<table id="table" class="table is-size-5 table-selection is-fullwidth">
	      <thead style="display:block;" class="thead-color">
	        <tr>
	          <th class="has-text-white largeur1"></th>
	          <th class="has-text-white largeur2">PICKING</th>
	          <th class="has-text-white largeur3">QUANTITE</th>
	          <th class="has-text-white largeur4"></th>
	          <th class="has-text-white largeur5">ARTICLE</th>
	        </tr>
	      </thead>
	      <tbody style="display:block; cursor:pointer; overflow-y: auto; height:38vh;">
			 <%
	      	if (session.getAttribute("exist_commande") == "1" && 
	      	      		 (request.getParameter("prev_page").equals("saisie_retour") ||
	      	      		  request.getParameter("prev_page").equals("commande") ||
	      	      		  request.getParameter("prev_page").equals("rupture") ||
	      	      		  request.getParameter("prev_page").equals("recharge") ||
	      	      		  request.getParameter("prev_page").equals("remplacement_article") ||
	      	      		  request.getParameter("prev_page").equals("validation") )
	      	      		 ) {
	      	    	  int i = 0;
	      	    	  for (DetailCmde detailcmdes : (List<DetailCmde>) session.getAttribute("detailcmdes")) {
	      %>
			<tr id="<%= detailcmdes.ligne %>" class="tr-selection">
				<td class="largeur1" id="etat<%= i %>"></td>
				<td class="largeur2"><%= detailcmdes.z_picking %></td>
				<td class="largeur3" id="qte<%= i %>"><%= detailcmdes.qte_prep %> / <%= detailcmdes.qte_cde %></td>
				<td class="largeur4" id="unite<%= i %>"></td>
				<td class="largeur5"><%= detailcmdes.lib_art %></td>
				<script> 
					var qte_cde = '<%= detailcmdes.qte_cde %>';
					document.getElementById("qte<%= i %>").innerHTML = '<%= detailcmdes.qte_prep %> / ' + qte_cde.split(' ')[0];
					document.getElementById("unite<%= i %>").innerHTML =  qte_cde.split(' ')[1];
					if ('<%= detailcmdes.rechargement %>' == '1') {
						document.getElementById("etat<%= i %>").style.backgroundColor = "#ADD9E6";
					}else {
						if ('<%= detailcmdes.rupture %>' == '1') {
							document.getElementById("etat<%= i %>").style.backgroundColor = "#FF5B5A";
						}else {
							if ('<%= detailcmdes.prepare %>' != '') {
								document.getElementById("etat<%= i %>").style.backgroundColor = "#0AF688";
							}else {
								document.getElementById("etat<%= i %>").style.backgroundColor = "#FFFFFF";
							}
						}
					}
					
				</script>
			</tr>
			<script>
			row = document.getElementById("<%= detailcmdes.ligne %>");
			if('<%= detailcmdes.rupture %>' != '1'){
				row.addEventListener('click', function(){
					document.getElementById("code_art").value="<%= detailcmdes.code_art %>";
					document.getElementById("lib_art").value="<%= detailcmdes.lib_art %>";
					document.getElementById("gamme").value="<%= detailcmdes.gamme %>";
					document.getElementById("ligne").value="<%= detailcmdes.ligne %>";
					document.getElementById("ord_rest_nr").value="<%= detailcmdes.ord_rest_nr %>";
					document.getElementById("ord_rad_nr_str_pos").value="<%= detailcmdes.ord_rad_nr_str_pos %>";
					document.getElementById("dummy_unique_id").value="<%= detailcmdes.dummy_unique_id %>";
					var qte_cde = '<%= detailcmdes.qte_cde %>';
					document.getElementById("qte_cde").value = qte_cde.split(' ')[0];
					document.getElementById("unite").value = qte_cde.split(' ')[1];
					
					document.getElementById("unite_cde").value="<%= detailcmdes.unite_cde %>";
					document.getElementById("unite_fact").value="<%= detailcmdes.unite_fact %>";
					document.getElementById("unite_stock").value="<%= detailcmdes.unite_stock %>";
					document.getElementById("colis_cde").value="<%= detailcmdes.colis_cde %>";
					document.getElementById("poids_cde").value="<%= detailcmdes.poids_cde %>";
					document.getElementById("pieces_cde").value="<%= detailcmdes.pieces_cde %>";
					document.getElementById("colis_prep").value="<%= detailcmdes.colis_prep %>";
					document.getElementById("poids_prep").value="<%= detailcmdes.poids_prep %>";
					document.getElementById("pieces_prep").value="<%= detailcmdes.pieces_prep %>";
					
		            document.getElementById("form_article_select").submit();
		        })
			}
			</script>
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

<div class="box box-button p-1">
	<div class="navigation-bar">
	    <div>
    		 <form id="form_retour" class="form-fullwidth" method="post" action="Commande">
    			<div style="display:none;"><input type="text" value="deconnexion" name="prev_page"></div>
				<input id="input_retour" class="button is-size-5 has-text-weight-bold" value="RETOUR" type="submit" style="background-color:  <%= Constantes.COULBTN2 %>; color: <%= Constantes.COULBTNTXT %> ;">
			</form>
    	</div>
		<div>
	    	<form id="form_commande" class="form-fullwidth" method="post" action="Commande">
	    			<div style="display:none;"><input type="text" id="prev_page" value="selection" name="prev_page"></div>  			
	    			<input class="button is-size-5 has-text-weight-bold" type="submit" value="COMMANDE" style="background-color:  <%= Constantes.COULBTN %>; color: <%= Constantes.COULBTNTXT %> ;">
	    	</form>
    	</div>
    	<div  style="display: none;">
	    	<div class="container has-text-centered">
		    	<form id="form_raz" class="form-fullwidth" method="post" action="Selection">
		    		<div style="display:none;"><input type="text" value="raz" name="prev_page"></div>
			    	<button id="raz" name="raz" class="button is-size-5 has-text-weight-bold" type="submit" value="RAZ" style="background-color:  <%= Constantes.COULBTN %>; color: <%= Constantes.COULBTNTXT %> ;">RAZ</button>
				</form>
			</div>
    	</div>
    	<div style="display: none;">
	    	<form id="form_commande" class="form-fullwidth" method="post" action="Saisie">
	    			<div style="display:none;"><input type="text" id="prev_page" value="ajouter" name="prev_page"></div>  			
	    			<input class="button is-size-5 has-text-weight-bold" type="submit" value="AJOUTER" style="background-color:  <%= Constantes.COULBTN %>; color: <%= Constantes.COULBTNTXT %> ;">
	    	</form>
    	</div>
    	<div id="validate_button">
	    	<form id="form_commande" class="form-fullwidth" method="post" action="Saisie">
	    			<div style="display:none;"><input type="text" id="prev_page" value="selection" name="prev_page"></div>  			
	    			<input class="button is-size-5 has-text-weight-bold" type="submit" value="VALIDER" style="background-color:  <%= Constantes.COULBTN2 %>; color: <%= Constantes.COULBTNTXT %> ;">
	    	</form>
    	</div>
    	<script>			        	
			if ("<%= session.getAttribute("mode") %>" == "commande") {
				document.getElementById("validate_button").style.display = "none";
			} else {
				document.getElementById("validate_button").style.display = "block";
			}
		</script>
   	</div>
</div>
<script src="js/virtual-keyboard-saisie-int.js"></script>
<script src="js/virtual-keyboard-saisie-decimal.js"></script>
<jsp:include page="footer.jsp"/>
