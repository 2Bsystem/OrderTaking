<jsp:include page="header.jsp"/>
<%@ page import="java.util.List" %>
<%@ page import="com.a2bsystem.models.Tournee" %>
<%@ page import="com.a2bsystem.models.Cmde" %>
<%@ page import="com.a2bsystem.models.Constantes" %>
<script>document.getElementById("title").innerHTML = "RECHERCHE COMMANDE";</script>

<section id="section_login" class="section section-borne section-selection is-fullheight">
<div class="box">
	<div class="field is-horizontal">
		<form class="form-fullwidth" method="post" action="Client">
			<div class="field is-horizontal">
				<div class="label-selection">
		    		<label class="label-block-left is-size-5">CLIENT</label>
		 		</div>
		      	<div class=" bloc-client">
		      		<div style="display:none;"><input type="text" id="prev_page" value="commande" name="prev_page"></div>
		      		<div style="display:none;"><input type="text" id="prev_client" name="prev_client"></div>
		        	<input id="input_client" class="input input-color input-block-left input-fournissaur is-size-5 false-input-text" type="submit">
		        	<script>			        	
			        	if ("<%= session.getAttribute("client_commande") %>" != "null") {
		        			document.getElementById("input_client").value = "<%= session.getAttribute("client_commande") %>";
	        			} else {
	        				document.getElementById("input_client").value = "Nom du client";
	        				document.getElementById("input_client").style.color = "darkgrey";
	        			}
			        	
		        	</script>
		  		</div>
		  	</div>
  		</form>
	</div>
	<div class="field is-horizontal" >
				<div class="is-normal label-selection">
		    		<label class="label label-block-left is-size-5">DATE</label>
		 		</div>
		 		<div>
		      		<div>
		        		<input id="input_date" class="input input-color is-size-5" style="width: 200px" type="date">
		        		<script>
			        	if ("<%= session.getAttribute("date_commande") %>" != "null") {
		        			document.getElementById("input_date").value = "<%= session.getAttribute("date_commande") %>";
	        			} else {
			        		var today = new Date();
			        		var dd = today.getDate();
			        		var mm = today.getMonth()+1; 
			        		var yyyy = today.getFullYear();
			        		if(dd<10) {dd='0'+dd;} 
			        		if(mm<10) {mm='0'+mm;} 
			        		document.getElementById("input_date").value = yyyy+'-'+mm+'-'+dd;;
	        			}
		        		</script>
		        		<input id="btn_-" class="button is-size-5 has-text-weight-bold" type="button" value="-" style="background-color:  <%= Constantes.COULBTN %>; color: <%= Constantes.COULBTNTXT %> ;">
		        		<script>
		        			document.getElementById("btn_-").addEventListener("click", function () {
				        		var input_date = document.getElementById("input_date").value;
		        				var date = new Date(input_date);
				        		var newdate = new Date(date);
				        	    newdate.setDate(newdate.getDate() - 1);
				        	    var dd = newdate.getDate();
				        	    var mm = newdate.getMonth() + 1;
				        	    var y = newdate.getFullYear();
				        	    if(dd<10) {dd='0'+dd;} 
				        		if(mm<10) {mm='0'+mm;} 
				        	    var someFormattedDate = y + '-' + mm + '-' + dd;
				        		document.getElementById("input_date").value = someFormattedDate;
		        			})
		        		</script>
		        		<input id="btn_raz" class="button is-size-5 has-text-weight-bold" type="button" value="AUJOURD'HUI" style="background-color:  <%= Constantes.COULBTN %>; color: <%= Constantes.COULBTNTXT %> ;">
		      			<script>
	        			document.getElementById("btn_raz").addEventListener("click", function () {
			        		var today = new Date();
			        		var dd = today.getDate();
			        		var mm = today.getMonth()+1; 
			        		var yyyy = today.getFullYear();
			        		if(dd<10) {dd='0'+dd;} 
			        		if(mm<10) {mm='0'+mm;} 
			        		document.getElementById("input_date").value = yyyy+'-'+mm+'-'+dd;;
	        			})
		        		</script>
		        		<input id="btn_+" class="button is-size-5 has-text-weight-bold" type="button" value="+" style="background-color:  <%= Constantes.COULBTN %>; color: <%= Constantes.COULBTNTXT %> ;">
		        		<script>
		        			document.getElementById("btn_+").addEventListener("click", function () {
				        		var input_date = document.getElementById("input_date").value;
		        				var date = new Date(input_date);
				        		var newdate = new Date(date);
				        	    newdate.setDate(newdate.getDate() + 1);
				        	    var dd = newdate.getDate();
				        	    var mm = newdate.getMonth() + 1;
				        	    var y = newdate.getFullYear();
				        	    if(dd<10) {dd='0'+dd;} 
				        		if(mm<10) {mm='0'+mm;} 
				        	    var someFormattedDate = y + '-' + mm + '-' + dd;
				        		document.getElementById("input_date").value = someFormattedDate;
		        			})
		        		</script>
		      		</div>
				</div>
	</div>
		<div class="field is-horizontal">
				<div class="is-normal label-selection">
		    		<label class="label label-block-left is-size-5">TOURNEE</label>
		 		</div>
		  		<div>
				<div>
		    		<div class="field">
		      			<div class="control is-expanded">
		        			<div class="select is-size-5 is-fullwidth">
					      		<select id="input_tournee" class="input-color">
					      			<option id="selected_tournee"></option>
					      			<option id="empty_tournee" style="display:none;"></option>
					      			<% for (Tournee tournee : (List<Tournee>) request.getAttribute("tournees")) { %>
					        			<option value="<%= tournee.code %>"><%= tournee.libelle %></option>
					        		<% 	} %>
					      		</select>
					      		<script>
				      				if (!("<%= session.getAttribute("tournee_commande") %>" == "" || "<%= session.getAttribute("tournee_commande") %>" == "null")) {
					        			document.getElementById("selected_tournee").value = "<%= session.getAttribute("id_tournee_commande") %>";
					        			document.getElementById("selected_tournee").innerHTML = "<%= session.getAttribute("tournee_commande") %>";
					        			document.getElementById("empty_tournee").style.display = "block";
				      				}
			      				</script>
					    	</div>
		      			</div>
		    		</div>
		  		</div>
		  	</div>
		</div>
	<div class="field is-horizontal">
				<div class="field is-horizontal">
				<div class="is-normal label-selection">
		    		<label class="label label-block-left is-size-5">N°COMMANDE</label>
		 		</div>
		  		<div>
		    		<div class="field">
		      			<div class="control is-expanded">
		      				<div style="display:none;"><input type="text" id="code_client" name="code_client"></div>
		        			<input id="input_num_commande" style="width: 200px" class="use-keyboard-input-saisie-int input input-color input-block-left is-size-5 is-fullwidth" placeholder="N°Commande" type="text">
		      				<script>
			      				if ("<%= session.getAttribute("num_commande_commande") %>" != "null") {
				        			document.getElementById("input_num_commande").value = "<%= session.getAttribute("num_commande_commande") %>";
			        			}
		      				</script>
		      			</div>
		    		</div>
		    		
		  		</div>
		  		</div>
		  		<div style="display: none" class="field is-horizontal">
				<div class="is-normal label-selection">
		    		<label class="label is-size-5">GAMME</label>
		 		</div>
		  		<div>
		    		<div class="field">
		      			<div class="control is-expanded">
		      				<div style="display:none;"><input type="text" id="code_client" name="code_client"></div>
		        			<input id="input_gamme" style="width: 200px" class="use-keyboard-input-int input input-color input-block-left is-size-5 is-fullwidth" placeholder="Gamme" type="text">
		      				<script>
			      				if ("<%= session.getAttribute("gamme_commande") %>" != "null") {
				        			document.getElementById("input_gamme").value = "<%= session.getAttribute("gamme_commande") %>";
			        			}
		      				</script>
		      			</div>
		    		</div>
		  		</div>
		  		</div>
		  		<div style="margin-left: auto; margin-right: auto;">
		  			<form id="form_search" method="post" action="Commande">
		  				<div style="display:none;"><input type="date" id="date_search" name="date_search"></div>
		  				<div style="display:none;"><input type="text" id="num_commande_search" name="num_commande_search"></div>
		  				<div style="display:none;"><input type="text" id="id_tournee_search" name="id_tournee_search"></div>
		  				<div style="display:none;"><input type="text" id="tournee_search" name="tournee_search"></div>
		  				<div style="display:none;"><input type="text" id="gamme_search" name="gamme_search"></div>
		  				<div style="display:none;"><input type="text" id="prev_page" value="search" name="prev_page"></div>
		  				<button id="search" class="button is-size-5 btn-voir" title="Voir" style="background-color:  <%= Constantes.COULBTN %>;" type="button">
							<img style="width: 30px;"  src="inc/loupe_blanche.png" alt="Voir"/>
						</button>
						<script>
							document.getElementById("search").addEventListener('click', function(){
				                document.getElementById("date_search").value = document.getElementById("input_date").value;
				                document.getElementById("num_commande_search").value = document.getElementById("input_num_commande").value;
				                document.getElementById("id_tournee_search").value = document.getElementById("input_tournee").value;
				                document.getElementById("tournee_search").value = document.getElementById("input_tournee").options[document.getElementById("input_tournee").selectedIndex].text;
				                document.getElementById("gamme_search").value = document.getElementById("input_gamme").value;
				                document.getElementById("form_search").submit();
				            })
						</script>
		  			</form>
		  		</div>
	</div>
</div>
<div class="box" >
	<form id="form" class="form-fullwidth" method="post" action="Selection">
		<style>
			.tr-commandes:hover {
				transition-duration: 0.5s;
				background-color: <%= Constantes.COULBTN2 %>;
			}
		</style>
	  	<table id="table" class="table is-size-5 table-commande is-fullwidth">
	      <thead style="display:block;" class="thead-color">
	        <tr>
	          <th class="has-text-white largeur1">DATE</th>
	          <th class="has-text-white largeur2">N°CDE</th>
	          <th class="has-text-white largeur3">CLIENT</th>
	          <th class="has-text-white largeur4">TOURNEE</th>
	          <th class="has-text-white largeur5">RANG</th>
	        </tr>
	      </thead>
	      <tbody style="display:block; cursor:pointer; overflow-y: auto; height:calc(100vh - 646.375px);">
	      <% if (request.getParameter("prev_page").equals("search") && request.getAttribute("exist").equals("1")) {
	    	  int i = 0;
	    	  for (Cmde commande : (List<Cmde>) request.getAttribute("commandes")) {
			%>
			<tr id="<%= "ligne" + i %>" class="tr-commandes">
				<td id="<%= "commande_date" + i %>" class="largeur1"><%= commande.date %></td>
				<td class="largeur2"><%= commande.num_commande %></td>
				<td class="largeur3"><%= commande.client %></td>
				<td class="largeur4"><%= commande.tournee %></td>
				<td class="largeur5"><%= commande.rang %></td>
			</tr>
			<script>
			row = document.getElementById("ligne" + <%= i %> );
			row.addEventListener('click', function(){
                document.getElementById("num_commande_select").value = "<%= commande.num_commande %>";
                document.getElementById("date_cde_select").value = "<%= commande.date %>";
                document.getElementById("code_client_select").value = "<%= commande.code_client %>";
                document.getElementById("client_select").value = "<%= commande.client %>";
                document.getElementById("tournee_select").value = "<%= commande.tournee %>";
                document.getElementById("rang_select").value = "<%= commande.rang %>";
                document.getElementById("form").submit();
            })
            
			today_date = new Date ();
			td_date = document.getElementById("commande_date" + <%= i %>).innerHTML;
			commande_date_formatted = td_date.split('/')[1] + "/" + td_date.split('/')[0] + "/" + td_date.split('/')[2];
			commande_date = new Date (commande_date_formatted + " 23:59:59");
			if(today_date > commande_date){
				document.getElementById("commande_date" + <%= i %>).style.color = "red";
			}
			</script>
		  <% i++;
		  	}
		  } 
			%>
	      </tbody>
	    </table>
	   	<div id="aucuneDonnee" class="no-data-table" style="display:flex;">
	   		<p class="is-size-5 has-text-weight-bold">Cliquez sur <img style="width: 30px;"  src="inc/loupe.png" alt="Voir"/> pour rechercher une commande</p>
	   	</div>
	    <div id="aucuneDonneeTrouvee" class="no-data-table" style="display:none;">
	    	<p class="is-size-5 has-text-weight-bold">Aucune commande ne correspond</p>
	    </div>
	    <script>
	    	if(<%= request.getAttribute("exist") %> == "1") {
	    		document.getElementById("table").style.display = "table";
	    		document.getElementById("aucuneDonnee").style.display = "none";
	    		document.getElementById("aucuneDonneeTrouvee").style.display = "none";
	    	}else {
	    		if(<%= request.getAttribute("exist") %> == "-1") {
	    			document.getElementById("aucuneDonneeTrouvee").style.display = "flex";
	    			document.getElementById("table").style.display = "none";
	    			document.getElementById("aucuneDonnee").style.display = "none";
	    		}else {
	    			document.getElementById("aucuneDonnee").style.display = "flex";
	    			document.getElementById("table").style.display = "none";
	    			document.getElementById("aucuneDonneeTrouvee").style.display = "none";
	    		}
	    	}
	    
	    </script> 
	   	<div style="display:none;"><input type="text" id="prev_page" value="commande" name="prev_page"></div>
	   	<div style="display:none;"><input type="text" id="num_commande_select" name="num_commande_select"></div>
	   	<div style="display:none;"><input type="text" id="date_cde_select" name="date_cde_select"></div>
	   	<div style="display:none;"><input type="text" id="code_client_select" name="code_client_select"></div>
	   	<div style="display:none;"><input type="text" id="client_select" name="client_select"></div>
	   	<div style="display:none;"><input type="text" id="tournee_select" name="tournee_select"></div>
	   	<div style="display:none;"><input type="text" id="rang_select" name="rang_select"></div>
   	</form>
</div>
</section>
<div class="box box-button level p-1">
	<div class="level-right">
		<form id="form_retour" class="form-fullwidth" method="post" action="Connect">
		 	<p class="control">
		 		<div style="display:none;"><input type="text" id="prev_page" value="deconnexion" name="prev_page"></div>
		   		<input id="btn_valider" class="button is-size-5 has-text-weight-bold" type="submit" value="RETOUR" style="background-color:  <%= Constantes.COULBTN2 %>; color: <%= Constantes.COULBTNTXT %> ;">
		  	</p>
		</form>
	</div>
	<div class="level-item"></div>
	<div class="level-item">
		<div class="container has-text-centered">
		    <form class="form-fullwidth" method="post" action="Commande">
		    	<div style="display:none;"><input type="text" value="raz" name="prev_page"></div>
			    <input id="raz" name="raz" class="button is-size-5 has-text-weight-bold" type="submit" value="RAZ" style="background-color:  <%= Constantes.COULBTN %>; color: <%= Constantes.COULBTNTXT %> ;">
			</form>
		</div>
	</div>
	<div class="level-item"></div>
	<div class="level-right" style="width: 120px;">
		<form class="form-fullwidth" method="post" action="Order">
		    <div style="display:none;"><input type="text" value="commande" name="prev_page"></div>
			<input id="Order" name="Order" class="button is-size-5 has-text-weight-bold" type="submit" value="ORDER" style="background-color:  #0063af; color: #fff ;">
		</form>
	</div>
</div>
<jsp:include page="footer.jsp"/>
<script src="js/virtual-keyboard-int-center.js"></script>

