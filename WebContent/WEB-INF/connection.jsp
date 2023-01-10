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
   <footer id="footer" class="d-flex flex-wrap justify-content-between align-items-center py-3 border-top bg-light">
		
		    <div class="col-md-4 d-flex align-items-center">
		        <img src="inc/groupe-bellon.png" class="d-inline-block align-top" width="100" height="100" >
		    </div>
	</footer>
	  	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	   	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	  	 
	</body>
</html>

<%-- <jsp:include page="footer.jsp"/> --%>