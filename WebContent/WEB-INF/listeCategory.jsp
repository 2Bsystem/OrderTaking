<jsp:include page="header.jsp"/>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	<form id="category" method="post" action="SelectArticle">
	
			<div id="listeCategory"> 
			
			</div>	

  	</form>
  	<script>
  		category = ["Boeuf", "Veau", "Porc", "Agneau"];
  		
  		function printBtn() {
  			
  			for(var i = 0; i < category.length; i++) {
  				var btn = document.createElement("button");
  				btn.classList.add("btn");
  				btn.classList.add("btn-outline-secondary");
  				btn.classList.add("btn-lg");
  				btn.setAttribute('name', 'valCategory');
  				var t = document.createTextNode(category[i]);
  				btn.appendChild(t);
  				document.getElementById("listeCategory").appendChild(btn);
 				btn.value = category[i];
  				
  			} 
  		}
  		
  		printBtn();
  	
  	</script>

<jsp:include page="footer.jsp"/>
