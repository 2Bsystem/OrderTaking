    <jsp:include page="header.jsp"/>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
  	<section id="section_login" >
  		<div class="login-block">
	  	  <form id="form" class="form-fullwidth" method="post" action="Connect">
		      <div class="column">		      	
			    <div class="box">     	
					
				  <!-- LOGIN -->
				  <div >
				    <label class="label is-size-5 has-text-black">UTILISATEUR</label>
					<div class="control has-icons-left">
					  <input class="input is-size-5 " type="text" id="login" name="login" placeholder="Utilisateur" autocomplete="off" required >
						<span style="z-index: 2" class="icon is-small is-left">
						  <i class="fas fa-user"></i>
						</span>
					</div>
				  </div>
							
				   <!-- MOT DE PASSE -->	
				   <div >
					 <label class="label is-size-5  has-text-black">MOT DE PASSE</label>
				     <div class="control has-icons-left">
					   <input class="input is-size-5 " type="password" id="password" name="password" placeholder="Mot de passe" autocomplete="off" required>
						 <span style="z-index: 2" class="icon is-small is-left">
							<i class="fas fa-lock"></i>
					     </span>
					 </div>
				   </div>
			     </div>
			     <div class="field is-grouped is-grouped-centered">
	   				<div style="display:none;"><input type="text" id="prev_page" value="home" name="prev_page"></div>
			        <input id="btn_valider" class="button is-size-5 has-text-weight-bold" type="submit" value="VALIDER" style="background-color: #0063af; color:#fff;">
			     </div>
			   <div class="column"></div>
		     </div>
	  	   </form>
		</div>

  	</section>
  	<div id="imgAccueil">
		<figure class="image container logo-footer image" style="height: 130px; width: 210px;">
 	    	<img src="inc/groupe-bellon.png">
    	</figure>
    
  	</div>

<%-- <jsp:include page="footer.jsp"/> --%>