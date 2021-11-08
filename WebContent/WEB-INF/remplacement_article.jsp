<jsp:include page="header.jsp"/>
<%@ page import="java.util.List" %>
<%@ page import="com.a2bsystem.models.Art" %>
<%@ page import="com.a2bsystem.models.Constantes" %>
<script>document.getElementById("title").innerHTML = "REMPLACEMENT D'ARTICLE";</script>
<div id="modal_wait" class="modal">
	<div class="modal-background"></div>
	<div class="modal-content modal-content-loader">
		<div class="loader"></div>
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
			   				<strong class="is-size-5">Error</strong>
			              	<br>
							<span id="modal_text" class="is-size-5"><%= session.getAttribute("errorRemplacement") %></span>
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
<div style="display:none;"><input type="text" id="type_recherche"></div>
<script>
	window.onload = function() {
		document.getElementById("searchNom").focus();
		document.getElementById("type_recherche").value = "<%= session.getAttribute("type_recherche") %>";
	}
	$("#modal_wait").addClass("is-active");
</script>
<section id="section_login" class="section-article section-borne is-fullheight">
 		<form id="form_retour" class="form-fullwidth" method="post" action="Saisie">
			<div class="field is-grouped">
	  			<p class="label-recherche-article">
			    	<label class="label is-expanded is-size-5">RECHERCHE ARTICLE</label>
	 			 </p>
		  		<p class="control">
		  			<div style="display:none;"><input type="text" id="prev_page" value="retour_remplacement_article" name="prev_page"></div>
		    		<input id="btn_valider" class="button is-size-5 has-text-weight-bold" type="submit" value="RETOUR" style="background-color:  <%= Constantes.COULBTN2 %>; color: <%= Constantes.COULBTNTXT %> ;">
		  		</p>
			</div>
		</form>
		<form id="form" class="form-fullwidth" method="post" action="Selection">
		<div id="grid" class="wrapper">
  <%
 			 int i = 0;
			for (Art article : (List<Art>) request.getAttribute("articles")) {
			%>
			<div data-code="<%= article.code %>" id="<%= i %>" class="grid-boxes" style="display:none;"><%= article.libelle %></div>
			<script>
			var cpt = <%=i %>;
			row = document.getElementById(cpt);
			row.addEventListener('click', function(){
                document.getElementById("article_select").value = "<%= article.libelle %>";
                document.getElementById("code_article_select").value = "<%= article.code %>";
                console.log(document.getElementById("article_select").value);
                document.getElementById("form").submit();
            })
			</script>
		  <% i++;} 
			%>
</div>
<div id="aucuneDonnee" class="no-data-table" style="display:flex;">
	<p class="is-size-5 has-text-weight-bold">Aucun article n'est recherché</p>
</div>
<div id="aucuneDonneeTrouvee" class="no-data-table" style="display:none;">
	<p class="is-size-5 has-text-weight-bold">Aucun article ne correspond</p>
</div> 
	   	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	   	<div style="display:none;"><input type="text" id="code_article_select" name="code_article_select"></div>
	   	<div style="display:none;"><input type="text" id="article_select" name="article_select"></div>
	   	<div style="display:none;"><input type="text" id="prev_page" value="remplacement_article" name="prev_page"></div>
   	</form>
  	<input class="input input-color is-size-5 is-fullwidth" type="text" placeholder="Nom de l'article (3 caractères minimum)" id="searchNom" name="searchNom" autocomplete="off">
	<script>
		document.getElementById("searchNom").classList.add("use-keyboard-input-tri-without-number-grid");
		document.getElementById("grid").classList.add("chiffres_clavier_alpha_height_not_big_grid");
		document.getElementById("aucuneDonnee").classList.add("chiffres_clavier_alpha_height_not_big_grid");
		document.getElementById("aucuneDonneeTrouvee").classList.add("chiffres_clavier_alpha_height_not_big_grid");
	</script>
	<script src="js/virtual-keyboard-tri-without-number-grid.js"></script>
	<script>
		window.addEventListener('load', function () {
			$("#modal_wait").removeClass("is-active");
			
			if("<%= session.getAttribute("errorRemplacement") %>" != "null"){
				$("#modal_error").addClass("is-active"); 
				$("#modal_button_ok").click(function() {
					$("#modal_error").removeClass("is-active");
				});
			}
		})
	</script>
</section>
<jsp:include page="footer.jsp"/>