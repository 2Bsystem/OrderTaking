<jsp:include page="header.jsp"/>
<%@ page import="java.util.List" %>
<%@ page import="com.a2bsystem.models.Art" %>
<%@ page import="com.a2bsystem.models.Constantes" %>
<script>document.getElementById("title").innerHTML = "RECHERCHE ARTICLE";</script>
<section id="section_login" class="section-article section-borne is-fullheight">
		<script>
			window.onload = function() {
				document.getElementById("searchNom").focus();
				switch ("<%=request.getAttribute("prev_page")%>") {
				  case 'order':
					document.getElementById("form").action = "SaisieOrder";
					break;
				  case 'saisie_order_retour':
					document.getElementById("form").action = "SaisieOrder";
					break;
				  default:	
					console.log(<%=request.getAttribute("prev_page")%>);
				  	break;
				}
			}
		</script>
		<div class="field is-grouped">
  			<p class="label-recherche-article">
		    	<label class="label is-expanded is-size-5">RECHERCHE ARTICLE</label>
 			 </p>
  			<p class="control">
  			<form id="form_retour" method="post" action="Order">
  				<div style="display:none;"><input type="text" id="prev_page" value="article" name="prev_page"></div>
    			<input id="btn_valider" class="button is-size-5 has-text-weight-bold" type="submit" value="RETOUR" style="background-color:  <%= Constantes.COULBTN2 %>; color: <%= Constantes.COULBTNTXT %> ;">
  			</form>
  			</p>
		</div>
		<style>
			.tr-articles:hover {
				transition-duration: 0.5s;
				background-color: <%= Constantes.COULBTN %>;
			}
		</style>
		<form id="form" method="post">
	  	<table id="table" class="table is-size-5 table-article is-fullwidth">
	      <thead style="display:block;">
	        <tr>
	          <th class="largeur1">CODE</th>
	          <th class="largeur2">LIBELLE</th>
	        </tr>
	      </thead>
	      <tbody id="bodyTable" style="display:none; cursor:pointer; overflow-y: auto; height:calc(100vh - 510.45px);">
	      <%
			for (Art article : (List<Art>) request.getAttribute("articles")) {
			%>
			<tr id="<%= article.code.replaceAll("\\s+", "") %>" class="tr-articles">
				<td class="largeur1"><%= article.code %></td>
				<td class="largeur2"><%= article.libelle %></td>
			</tr>
			<script>
			row = document.getElementById("<%= article.code.replaceAll("\\s+", "") %>");
			row.addEventListener('click', function(){
                document.getElementById("article_select").value = "<%= article.libelle %>";
                document.getElementById("code_article_select").value = "<%= article.code %>";
                console.log(document.getElementById("article_select").value);
                document.getElementById("form").submit();
            })
			</script>
		  <% } 
			%>
	      </tbody>
	    </table>
	    <div id="aucuneDonnee" class="no-data-table" style="display:flex;  height:calc(100vh - 510.45px);">
	   		<p class="is-size-5 has-text-weight-bold">Aucun article n'est recherché</p>
	   	</div>
	    <div id="aucuneDonneeTrouvee" class="no-data-table" style="display:none;  height:calc(100vh - 510.45px);">
	    	<p class="is-size-5 has-text-weight-bold">Aucun article ne correspond</p>
	    </div> 
	   	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	   	<div style="display:none;"><input type="text" id="code_article_select" name="code_article_select"></div>
	   	<div style="display:none;"><input type="text" id="article_select" name="article_select"></div>
	   	<div style="display:none;"><input type="text" id="prev_page" value="article" name="prev_page"></div>
   	</form>
  	<input class="input input-color is-size-5 is-fullwidth use-keyboard-input-tri" type="text" placeholder="Nom de l'article (3 caractères minimum)" id="searchNom" name="searchNom" autocomplete="off">
	<script>
	  	var getIdsearchNom = document.getElementById("searchNom")
	  	var getFormId = document.getElementById("form")
 		var getBodyTable = document.getElementById("bodyTable")

	  		if ("<%= Constantes.GROS_CLAVIER_ARTICLE %>" == '1') {
	  			getIdsearchNom.setAttribute('class', 'input input-color is-size-5 is-fullwidth use-keyboard-input-tri-no-num-client')
	  			getFormId.style.height = "calc(100vh - 600.65px)"
	  			getBodyTable.style.height = "calc(100vh - 660.65px)"

	  		}
	  </script> 
	
	<script src="js/virtual-keyboard-tri.js"></script>
  	<script src="js/virtual-keyboard-tri-no-num-client.js"></script>
	
		
</section>
<jsp:include page="footer.jsp"/>