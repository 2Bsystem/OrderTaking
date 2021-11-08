<jsp:include page="header.jsp"/>
<%@ page import="java.util.List" %>
<%@ page import="com.a2bsystem.models.LotsListe" %>
<%@ page import="com.a2bsystem.models.Constantes" %>
<script>document.getElementById("title").innerHTML = "RECHERCHE LOT";</script>
<section id="section_login" class="section-client section-borne is-fullheight">
	<form id="form_lot" class="form-fullwidth" method="post" action ="Saisie">
		<div class="field is-grouped">
  			<p class="label-recherche-client">
		    	<label class="label is-expanded is-size-5">RECHERCHE LOT</label>
 			 </p>
  			<p class="control">
    			<input id="btn_valider" class="button is-size-5 has-text-weight-bold" type="submit" value="RETOUR" style="background-color:  <%=Constantes.COULBTN2%>; color: <%=Constantes.COULBTNTXT%> ;">
  			</p>
		</div>
		<style>
			.tr-lots:hover {
				transition-duration: 0.5s;
				background-color: <%=Constantes.COULBTN2%>;
			}
		</style>
	  	<table id="table" class="table is-size-5 table-lot is-fullwidth">
	      <thead style="display:block;" class="thead-color">
	        <tr>
	          <th class="has-text-white largeur-lot1">LOT</th>
	          <th class="has-text-white largeur-lot2">PRIX</th>
	          <th class="has-text-white largeur-lot3">FOURNISSEUR</th>
	          <th class="has-text-white largeur-lot4">STOCK</th>
	          <th class="has-text-white largeur-lot5">DLC</th>
	          <th class="has-text-white largeur-lot6">COL</th>
	        </tr>
	      </thead>
	      <tbody id="bodyTable" style="cursor:pointer; overflow-y: auto; height:auto;">
	      <%
	      	int i = 0;
	      	for (LotsListe lot : (List<LotsListe>) request.getAttribute("lots")) {
	      		%>
			<tr id="lot<%= i %>" class="tr-lots">
				<td class="largeur-lot1"><%= lot.lot %></td>
				<td class="largeur-lot2"><%= lot.prix %></td>
				<td class="largeur-lot3"><%= lot.fournisseur %></td>
				<td class="largeur-lot4"><%= lot.stock %></td>
				<td class="largeur-lot5"><%= lot.dlc %></td>
				<td class="largeur-lot6"><%= lot.col %></td>
			</tr>
			<script>
			row = document.getElementById("lot<%= i %>");
			row.addEventListener('click', function(){
                document.getElementById("lot_lot_select").value = "<%= lot.lot %>";
                document.getElementById("prix_lot_select").value = "<%= lot.prix %>";
                document.getElementById("fournisseur_lot_select").value = "<%= lot.fournisseur %>";
                document.getElementById("stock_lot_select").value = "<%= lot.stock %>";
                document.getElementById("dlc_lot_select").value = "<%= lot.dlc %>";
                document.getElementById("col_lot_select").value = "<%= lot.col %>";
                document.getElementById("form_lot").submit();
            })
			</script>
		  <% 
   			i++;
	      	} 
			%>
	      </tbody>
	    </table>  
	   	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	   	<div style="display:none;"><input type="text" id="lot_lot_select" name="lot_lot_select"></div>
	   	<div style="display:none;"><input type="text" id="prix_lot_select" name="prix_lot_select"></div>
	   	<div style="display:none;"><input type="text" id="fournisseur_lot_select" name="fournisseur_lot_select"></div>
	   	<div style="display:none;"><input type="text" id="stock_lot_select" name="stock_lot_select"></div>
	   	<div style="display:none;"><input type="text" id="dlc_lot_select" name="dlc_lot_select"></div>
	   	<div style="display:none;"><input type="text" id="col_lot_select" name="col_lot_select"></div>
	   	<div style="display:none;"><input type="text" id="prev_page" value="lot" name="prev_page"></div>
   	</form>
	<script src="js/virtual-keyboard-tri.js"></script>
</section>
<jsp:include page="footer.jsp"/>