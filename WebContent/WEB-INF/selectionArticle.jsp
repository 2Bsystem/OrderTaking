<jsp:include page="header.jsp"/>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	<div id="top">
		<h1 class="btn btn-outline-info btn-lg"><%= request.getParameter("valCategory") %> </h1>	
	</div>
	
	<form id="formSelectArticle" method="post" action="SaisieArticle">
	
		<div id="listArticle" class="btn-group-vertical">
			
		</div>

 		<input id="valCategory" type="hidden" value="<%= request.getParameter("valCategory") %>" >
  	</form>
  	
  	<script>
  		listeBoeuf = [
  			"Foie n�1",
  			"Coeur",
  			"Joue",
  			"Langue C", 
  			"Rognons",
  			"Onglet", 
  			"Tripes",
  			"Gras double", 
  			"Testicule", 
  			"Queue", 
  			"C�te Boeuf", 
  			"MLT", 
  			"Entrec�te", 
  			"Filet Boeuf",
  			"Hampe",
  			"Faux Filet",
  			"Os",
  			"Bavette",
  			"Paleron",
  			"B Macreuse",
  			"Basse C�te",
  			"Rond Gite",
  			"Coeur Rumsteak",
  			"Deh"
		];
  		
  		listeVeau = [
  			"Tete n�1",
  			"Cuir A Plat",
  			"Foie BE",
  			"Foie FR",
  			"Coeurs",
  			"Cervelles",
  			"Cuir Roul�",
  			"Joues",
  			"Langues",
  			"Pieds",
  			"Rognons",
  			"Jarret",
  			"Carr�",
  			"Onglets",
  			"Os",
  			"Quasi",
  			"Ris Coeur",
  			"Ris Gorge",
  			"Epaule",
  			"Bas Carr�",
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
  			"Carr�"
  		];
  		
  		listeAgneau = [
  			"Ris",
  			"Cervelles",
  			"Fressures",
  			"Langues",
  			"Foies",
  			"Coeurs",
  			"Souris",
  			"Carr�",
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>

<jsp:include page="footer.jsp"/>
