<jsp:include page="header.jsp"/>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	<div id="top">
		<h1 class="btn btn-outline-info btn-lg"><%= request.getParameter("valCategory") %> </h1>	
	</div>
		<div id ="formSelectArticle">
			<form id="formInput" method="post" action="SaisieArticle">
				<input id="inputSaisieArt" type="text" class="form-control" name="inputSaisieArticle" placeholder="Saisie Libre" aria-label="Username" aria-describedby="basic-addon1">
			</form>
			<form method="post" action="SaisieArticle">
				<div id="listArticle" class="btn-group-vertical">
				</div>
		 		<input id="valCategory" type="hidden" value="<%= request.getParameter("valCategory") %>" >
		  	</form>
	  	</div>
  	<script>
  	
  	$(document).ready(function(){
  	   $('#inputSaisieArt').live('blur',function(){
  	      $('#formInput').submit();
  	   });
  	});
  	
  		listeBoeuf = [
  			"Foie n1",
  			"Coeur",
  			"Joue",
  			"Langue C", 
  			"Rognons",
  			"Onglet", 
  			"Tripes",
  			"Gras double", 
  			"Testicule", 
  			"Queue", 
  			"Cote Boeuf", 
  			"MLT", 
  			"Entrecote", 
  			"Filet Boeuf",
  			"Hampe",
  			"Faux Filet",
  			"Os",
  			"Bavette",
  			"Paleron",
  			"B Macreuse",
  			"Basse Cote",
  			"Rond Gite",
  			"Coeur Rumsteak",
  			"Deh"
		];
  		
  		listeVeau = [
  			"Tete n1",
  			"Cuir A Plat",
  			"Foie BE",
  			"Foie FR",
  			"Coeurs",
  			"Cervelles",
  			"Cuir Roule",
  			"Joues",
  			"Langues",
  			"Pieds",
  			"Rognons",
  			"Jarret",
  			"Carre",
  			"Onglets",
  			"Os",
  			"Quasi",
  			"Ris Coeur",
  			"Ris Gorge",
  			"Epaule",
  			"Bas Carre",
  			"Filet",
  			"Noix",
  			"Fraise",
  			"Nerveux"
  		];
  		
  		listePorc = [
  			"Rognons",
  			"Echine",
  			"Foies",
  			"Cervelles",
  			"Filet Mignon",
  			"Gorges",
  			"Joues",
  			"Crepines",
  			"Bardes",
  			"Langue",
  			"Longe",
  			"Carre"
  		];
  		
  		listeAgneau = [
  			"Ris",
  			"Cervelles",
  			"Fressures",
  			"Langues",
  			"Foies",
  			"Coeurs",
  			"Souris",
  			"Carre",
  			"Gigot",
  			"Epaule",
  			"Panse",
  			"Rognon"
  		];
  		
  		function printLiBoeuf() {
  			
  			for( var i = 0; i < listeBoeuf.length; i++){
  	  	 	  /* 	var li = document.createElement("li");
  	  			li.classList.add("list-group-item");
  	  			
  	  			var t = document.createTextNode(listeBoeuf[i]);
  	  			li.appendChild(t);
  	  			document.getElementById("listArticle").appendChild(li)
  	  			li.setAttribute("onclick", "formSelectArticle.submit()");
  	  			li.innerHTML = listeBoeuf[i]; */
  	  			
  				var btn = document.createElement("button");
  				btn.classList.add("btn");
  				btn.classList.add("btn-outline-secondary");
  				btn.classList.add("btn-lg");
  				btn.setAttribute('name', 'valArticle');
  				var t = document.createTextNode(listeBoeuf[i]);
  				btn.appendChild(t);
  				document.getElementById("listArticle").appendChild(btn);			
     			btn.value = listeBoeuf[i];

  	  		}
		
  		}
  		
		function printLiVeau() {
		  			
  			for( var i = 0; i < listeVeau.length; i++){
  	  			
  	  		/* 	var li = document.createElement("li");
  	  			li.classList.add("list-group-item");
  	  			
  	  			var t = document.createTextNode(listeVeau[i]);
  	  			li.appendChild(t);
  	  			document.getElementById("listArticle").appendChild(li)
  	  			li.setAttribute("onclick", "formSelectArticle.submit()");
  	  			li.innerHTML = listeVeau[i]; */
  	  			
  				var btn = document.createElement("button");
  				btn.classList.add("btn");
  				btn.classList.add("btn-outline-secondary");
  				btn.classList.add("btn-lg");
  				btn.setAttribute('name', 'valArticle');
  				var t = document.createTextNode(listeVeau[i]);
  				btn.appendChild(t);
  				document.getElementById("listArticle").appendChild(btn);
     			btn.value = listeVeau[i];

  	  		}
  		}
		  		
		function printLiPorc() {
				
			for( var i = 0; i < listePorc.length; i++){
				
				/* var li = document.createElement("li");
				li.classList.add("list-group-item");
				
				var t = document.createTextNode(listePorc[i]);
				li.appendChild(t);
				document.getElementById("listArticle").appendChild(li)
				li.setAttribute("onclick", "formSelectArticle.submit()");
				li.innerHTML = listePorc[i]; */
				
  				var btn = document.createElement("button");
  				btn.classList.add("btn");
  				btn.classList.add("btn-outline-secondary");
  				btn.classList.add("btn-lg");
  				btn.setAttribute('name', 'valArticle');
  				var t = document.createTextNode(listePorc[i]);
  				btn.appendChild(t);
  				document.getElementById("listArticle").appendChild(btn);
     			btn.value = listePorc[i];

			}
		}
			
		function printLiAgneau() {
				
			for( var i = 0; i < listeAgneau.length; i++){
				
			/* 	var li = document.createElement("li");
				li.classList.add("list-group-item");
				
				var t = document.createTextNode(listeAgneau[i]);
				li.appendChild(t);
				document.getElementById("listArticle").appendChild(li)
				li.setAttribute("onclick", "formSelectArticle.submit()");
				li.innerHTML = listeAgneau[i];
  	  			li.value = listeAgneau[i]; */
  	  			
  				var btn = document.createElement("button");
  				btn.classList.add("btn");
  				btn.classList.add("btn-outline-secondary");
  				btn.classList.add("btn-lg");
  				btn.setAttribute('name', 'valArticle');
  				var t = document.createTextNode(listeAgneau[i]);
  				btn.appendChild(t);
  				document.getElementById("listArticle").appendChild(btn);
     			btn.value = listeAgneau[i];

			}
		}
  		
  		let valCat = document.getElementById("valCategory").value;
  		
  		switch(valCat) {
  		
	  		case "Boeuf":
	  	  		console.log("Boeuf");
	  	  		printLiBoeuf()
				break;
				
	  		case "Veau":
	  	  		console.log("Veau");
		  	  	printLiVeau()
				break;
				
	  		case "Porc":
	  	  		console.log("Porc");
		  	    printLiPorc()
				break;
				
	  		case "Agneau":
	  	  		console.log("Agneau");
	  	  		printLiAgneau()
				break;
  		}

  	</script>
<jsp:include page="footer.jsp"/>
