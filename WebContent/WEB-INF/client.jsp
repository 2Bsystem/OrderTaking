<jsp:include page="header.jsp"/>
<%@ page import="java.util.List" %>
<%@ page import="com.a2bsystem.models.Cli" %>
<%@ page import="com.a2bsystem.models.Constantes" %>
<script>document.getElementById("title").innerHTML = "RECHERCHE CLIENT";</script>
<section id="section_login" class="section-client section-borne is-fullheight">
	<form id="form_client" class="form-fullwidth" method="post">
		<script>
			window.onload = function() {
				document.getElementById("searchNom").focus();
				switch ("<%=request.getAttribute("prev_page")%>") {
				  case 'selection':
				    document.getElementById("form_client").action = "Selection";
				    break;
				  case 'commande':
					document.getElementById("form_client").action = "Commande";
				    break;
				  case 'order':
					document.getElementById("form_client").action = "Order";
					break;
				  default:	
					console.log(<%=request.getAttribute("prev_page")%>);
				  	break;
				}
			}
		</script>
		<div class="field is-grouped">
  			<p class="label-recherche-client">
		    	<label class="label is-expanded is-size-5">RECHERCHE CLIENT</label>

 			 </p>
  			<p class="control">
  			<!-- <form id="form_retour" method="post" action="Order">
			  	<div style="display:none;"><input type="text" id="prev_page" value="saisie_order" name="prev_page"></div> -->
			
    			<input id="btn_valider" class="button is-size-5 has-text-weight-bold" type="submit" value="RETOUR" style="background-color: <%=Constantes.COULBTN2%>; color: <%=Constantes.COULBTNTXT%> ;">
  			
<!--   			</form>
 -->  			</p>
		</div>
		<style>
			.tr-clients:hover {
				transition-duration: 0.5s;
				background-color: <%=Constantes.COULBTN2%>;
			}
		</style>
	  	<table id="table" class="table is-size-5 table-client is-fullwidth">
	      <thead style="display:block;">
	        <tr>
	          <th class="largeur1">CODE</th>
	          <th class="largeur2">NOM</th>
	          <th class="largeur3">NOM D'APPEL</th>
	        </tr>
	      </thead>
	      <tbody id="bodyTable" style="display:none; height: calc(100vh - 540.65px); cursor:pointer; overflow-y: auto;">
	      <%
	      	for (Cli client : (List<Cli>) request.getAttribute("clients")) {
	      %>
			<tr id="<%= client.code.replaceAll("\\s+", "") %>" class="tr-clients">
				<td class="largeur1"><%= client.code %></td>
				<td class="largeur2"><%= client.nom %></td>
				<td class="largeur3"><%= client.nomAppel %></td>
			</tr>
			<script>
			row = document.getElementById("<%= client.code.replaceAll("\\s+", "") %>");
			row.addEventListener('click', function(){
                document.getElementById("client_select").value = "<%= client.nom %>";
                document.getElementById("code_client_select").value = "<%= client.code %>";
                document.getElementById("client_divers_select").value = "<%= client.divers %>";
                document.getElementById("form_client").submit();
            })
			</script>
		  <% } 
			%>
	      </tbody>
	    </table>
	   	<div id="aucuneDonnee" class="no-data-table" style="display:flex; height: calc(100vh - 540.65px);">
	   		<p class="is-size-5 has-text-weight-bold">Aucun client n'est recherché</p>
	   	</div>
	    <div id="aucuneDonneeTrouvee" class="no-data-table" style="display:none; height: calc(100vh - 540.65px);">
	    	<p class="is-size-5 has-text-weight-bold">Aucun client ne correspond</p>
	    </div>    
	   	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	   	<div style="display:none;"><input type="text" id="code_client_select" name="code_client_select"></div>
	   	<div style="display:none;"><input type="text" id="client_select" name="client_select"></div>
	   	<div style="display:none;"><input type="text" id="client_divers_select" name="client_divers_select"></div>
	   	<div style="display:none;"><input type="text" id="prev_page" value="client" name="prev_page"></div>
   	</form>
  	<input class="input input-color is-size-5 is-fullwidth use-keyboard-input-tri" type="text" placeholder="Nom du client (3 caractères minimum)" id="searchNom" name="searchNom" autocomplete="off">
  	 <script>
	  	var getIdsearchNom = document.getElementById("searchNom")
	  	var getBodyTable = document.getElementById("bodyTable")
  		var getFormId = document.getElementById("form_client")

	  		if ("<%= session.getAttribute("grosClavierClient") %>" == "1") {
	  			getIdsearchNom.setAttribute('class', 'input input-color is-size-5 is-fullwidth use-keyboard-input-tri-no-num-client')
	  			getBodyTable.style.height = "calc(100vh - 660.65px)"
	  			getFormId.style.height = "calc(100vh - 540.65px)"

	  		}
	  </script>  
	<script src="js/virtual-keyboard-tri.js"></script>
  	<script src="js/virtual-keyboard-tri-no-num-client.js"></script>
	
</section>
<jsp:include page="footer.jsp"/>