    <jsp:include page="header.jsp"/>
    <%@ page import="com.a2bsystem.models.Constantes" %>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	<script>document.getElementById("title").innerHTML = "CONNEXION";</script>
  	<section id="section_login" class="section section-login is-fullheight">
  		<div class="login-block">
	  	  <form id="form" class="form-fullwidth" method="post" action="Connect">
		      <div class="column">		      	
			    <div class="box">     	
				  <label class="label has-text-danger has-text-centered"  style="color: <%= Constantes.COULTITRE %>;">
					  <% if((Boolean) request.getAttribute("erreur_url")){
						  	out.print("Veuillez renseignez un paramètre dans l'url.");
					  	}else {
					  		if ((Boolean) request.getAttribute("erreur_param")){
						  		out.print("Pas de fichier : " + session.getAttribute("param_borne"));
					  		}else{
					  			out.print(request.getAttribute("ids"));
					  		}
					  	}%>
				  </label> <!-- message d'erreur -->
					
				  <!-- LOGIN -->
				  <div class="field">
				    <label class="label is-size-5 has-text-black">UTILISATEUR</label>
					<div class="control has-icons-left">
					  <input class="input is-size-5 use-keyboard-input" type="text" id="login" name="login" placeholder="Utilisateur" autocomplete="off" required >
						<span style="z-index: 2" class="icon is-small is-left">
						  <i class="fas fa-user"></i>
						</span>
					</div>
				  </div>
				  
							
				   <!-- MOT DE PASSE -->	
				   <div class="field">
					 <label class="label is-size-5  has-text-black">MOT DE PASSE</label>
				     <div class="control has-icons-left">
					   <input class="input is-size-5 use-keyboard-input" type="password" id="password" name="password" placeholder="Mot de passe" autocomplete="off" required>
						 <span style="z-index: 2" class="icon is-small is-left">
							<i class="fas fa-lock"></i>
					     </span>
					 </div>
				   </div>
			     </div>
			     <div class="field is-grouped is-grouped-centered">
	   				<div style="display:none;"><input type="text" id="prev_page" value="home" name="prev_page"></div>
			        <input id="btn_valider" class="button is-size-5 has-text-weight-bold" type="submit" value="VALIDER" style="background-color:  <%= Constantes.COULBTN %>; color: <%= Constantes.COULBTNTXT %> ;">
			     </div>
			   <div class="column"></div>
		     </div>
		     <div style="display:none;"><select name="param_borne" class="input" size="1"><option id="param_borne"></option></select></div>
	  	   </form>
		</div>
  	</section>
  	<script>
  		// disable valider si erreur parametre
  		if (<%= request.getAttribute("erreur_param") %> == true || <%= request.getAttribute("erreur_url") %> == true){
  			document.getElementById("btn_valider").style.display = "none";
  			document.getElementById("btn_valider").disabled = true;
  		}
  	</script>
  	
<jsp:include page="footer.jsp"/>