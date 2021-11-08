<%@ page import="com.a2bsystem.models.Constantes" %>
    <!-- FOOTER -->
    <footer id="footer" class="footer-main" style="background-color: <%= Constantes.COULHF %>;">
    <div class="level p-1">
    	<div class="level-item"></div>
	    	<div class="level-item">
			    <div class="container has-text-centered">
				  <figure class="image container logo-footer is-centered image" style="height: 48px; width: 144px;">
			  	    <img src="inc/logo_blanc.png">
				  </figure>
				</div>
			</div>
		<div class="level-item"></div>
		<div class="level-right"><h1 id="nomUtil" class="title is-5 has-text-white"></h1></div>
	</div>
  </footer>
  	<script>
		if ("<%= session.getAttribute("login") %>" != "null") {
			document.getElementById("nomUtil").innerHTML = "<%= session.getAttribute("login") %>";
		} else {
			document.getElementById("nomUtil").innerHTML = "";
		}
	</script>
  	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
</body>
</html>