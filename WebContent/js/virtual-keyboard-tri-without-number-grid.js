const KeyboardTriWithoutNumberGrid = {
    elements: {
        main: null,
        keysContainer: null,
        keys: []
    },

    eventHandlers: {
        oninput: null,
        onclose: null
    },

    properties: {
        value: "",
        capsLock: false
    },

    init() {
        // Create main elements
        this.elements.main = document.createElement("div");
        this.elements.keysContainer = document.createElement("div");

        // Setup main elements
        this.elements.main.classList.add("keyboard-without-num", "keyboard--hidden", "virtual-keyboard-shadow");
        this.elements.keysContainer.classList.add("keyboard__keys");
        this.elements.keysContainer.appendChild(this._createKeys());

        this.elements.keys = this.elements.keysContainer.querySelectorAll(".keyboard__key__without__number");

        // Add to DOM
        this.elements.main.appendChild(this.elements.keysContainer);
        document.body.appendChild(this.elements.main);

        // Automatically use keyboard for elements with .use-keyboard-input
        document.querySelectorAll(".use-keyboard-input-tri-without-number-grid").forEach(element => {
            element.addEventListener("focus", () => {
                this.open(element.value, currentValue => {
                    element.value = currentValue;
                });
            });
        });
    },

    _createKeys() {
        const fragment = document.createDocumentFragment();
        const keyLayout = [
        	"#","a", "z", "e", "r", "t", "y", "u", "i", "o", "p","backspace",
            "caps", "q", "s", "d", "f", "g", "h", "j", "k", "l", "m", "enter",
            "done", "w", "x", "c", "v", "b", "n", ",", ".", "?",
            "space"
        ];

        // Creates HTML for an icon
        const createIconHTML = (icon_name) => {
            return `<i class="material-icons">${icon_name}</i>`;
        };

        keyLayout.forEach(key => {
            const keyElement = document.createElement("button");
            const insertLineBreak = ["backspace", "enter", "?"].indexOf(key) !== -1;

            // Add attributes/classes
            keyElement.setAttribute("type", "button");
            keyElement.classList.add("keyboard__key__without__number");

            switch (key) {
                case "backspace":
                	keyElement.classList.add("keyboard__key_color2");
                    keyElement.classList.add("keyboard__key--wide");
                    keyElement.innerHTML = createIconHTML("backspace");
                    	
                    keyElement.addEventListener("click", () => {
                        this.properties.value = this.properties.value.substring(0, this.properties.value.length - 1);
                        this._triggerEvent("oninput");
                        var input, filter, i, j, txtValue,aucuneDonnee,aucuneDonneeTrouvee,type_recherche;
            	  		input = document.getElementById("searchNom");
            	  		filter = input.value.toUpperCase();
                    	aucuneDonnee = document.getElementById("aucuneDonnee");
                    	aucuneDonneeTrouvee = document.getElementById("aucuneDonneeTrouvee");
                    	gridArticle = document.getElementById("grid");
                    	type_recherche = document.getElementById("type_recherche").value;
            	  		
						if (document.getElementById("searchNom").value.length >2){
		      				//Tri de la table
		      				// Loop through all table rows, and hide those who don't match the search query
							gridArticle.style.display="grid";
		      				aucuneDonnee.style.display="none";
		      				aucuneDonneeTrouvee.style.display="none";
		      				var k = 0;
		      				var cpt=0;
		      				while(document.getElementById(cpt)){
		      					var elem = document.getElementById(cpt);
		      					elem.style.display="none";
		      					switch(type_recherche) {
        	  							case "Commence":
            	  							if (elem.innerHTML.toUpperCase().indexOf(filter) == 0 || elem.dataset.code.toUpperCase().indexOf(filter) == 0) {
                	  							elem.style.display = "";
                	  							k++;
                	  							break;
                	  						}
            	  							break;
        	  							case "Contient":
            	  							if (elem.innerHTML.toUpperCase().indexOf(filter) != -1 || elem.dataset.code.toUpperCase().indexOf(filter) == -1) {
                	  							elem.style.display = "";
                	  							k++;
                	  							break;
                	  						}
            	  							break;
            	  						default:
            	  							if (elem.innerHTML.toUpperCase().indexOf(filter) != -1 || elem.dataset.code.toUpperCase().indexOf(filter) != -1) {
                	  							elem.style.display = "";
                	  							k++;
                	  							break;
                	  						}
            	  							break;
        	  						}
		      					cpt++;
		      				}
            	  			if (k == 0){
            	  				aucuneDonneeTrouvee.style.display ="flex";
            	  				gridArticle.style.display="none";
            	  			}else {
            	  				aucuneDonneeTrouvee.style.display ="none";
            	  				gridArticle.style.display="grid";
            	  			}
		      			}else {
		      				//Affichage de message et hide du tableau existant
		      				var cpt =0;
		      				aucuneDonnee.style.display="flex";
		      				aucuneDonneeTrouvee.style.display ="none";
		      				while(document.getElementById(cpt)){
		      					document.getElementById(cpt).style.display="none";
		      					cpt++;
		      				}
		      				gridArticle.style.display="none";
		      			}
                    });

                    break;

                case "caps":
                	keyElement.classList.add("keyboard__key_color2");
                    keyElement.classList.add("keyboard__key--wide", "keyboard__key--activatable");
                    keyElement.innerHTML = createIconHTML("keyboard_capslock");

                    keyElement.addEventListener("click", () => {
                        this._toggleCapsLock();
                        keyElement.classList.toggle("keyboard__key--active", this.properties.capsLock);
                    });

                    break;

                case "enter":
                	keyElement.classList.add("keyboard__key_color2");
                    keyElement.classList.add("keyboard__key--wide");
                    keyElement.innerHTML = createIconHTML("keyboard_return");

                    keyElement.addEventListener("click", () => {
                        this.properties.value += "\n";
                        this._triggerEvent("oninput");
                    });

                    break;

                case "space":
                	keyElement.classList.add("keyboard__key_color2");
                    keyElement.classList.add("keyboard__key--extra-wide");
                    keyElement.innerHTML = createIconHTML("space_bar");

                    keyElement.addEventListener("click", () => {
                        this.properties.value += " ";
                        this._triggerEvent("oninput");
                        var input, filter, i, j, txtValue,aucuneDonnee,aucuneDonneeTrouvee, type_recherche;
            	  		input = document.getElementById("searchNom");
            	  		filter = input.value.toUpperCase();
                    	aucuneDonnee = document.getElementById("aucuneDonnee");
                    	aucuneDonneeTrouvee = document.getElementById("aucuneDonneeTrouvee");
                    	gridArticle = document.getElementById("grid");
                    	type_recherche = document.getElementById("type_recherche").value;
            	  		
						if (document.getElementById("searchNom").value.length >2){
		      				//Tri de la table
		      				// Loop through all table rows, and hide those who don't match the search query
							document.getElementById("grid").style.display="grid";
		      				aucuneDonnee.style.display="none";
		      				var k = 0;
            	  			var cpt = 0;
            	  			while(document.getElementById(cpt)){
		      					var elem = document.getElementById(cpt);
		      					elem.style.display="none";
		      					switch(type_recherche) {
        	  							case "Commence":
            	  							if (elem.innerHTML.toUpperCase().indexOf(filter) == 0 || elem.dataset.code.toUpperCase().indexOf(filter) == 0) {
                	  							elem.style.display = "";
                	  							k++;
                	  							break;
                	  						}
            	  							break;
        	  							case "Contient":
            	  							if (elem.innerHTML.toUpperCase().indexOf(filter) != -1 || elem.dataset.code.toUpperCase().indexOf(filter) == -1) {
                	  							elem.style.display = "";
                	  							k++;
                	  							break;
                	  						}
            	  							break;
            	  						default:
            	  							if (elem.innerHTML.toUpperCase().indexOf(filter) != -1 || elem.dataset.code.toUpperCase().indexOf(filter) != -1) {
                	  							elem.style.display = "";
                	  							k++;
                	  							break;
                	  						}
            	  							break;
        	  						}
		      					cpt++;
		      				}
            	  			if (k == 0){
            	  				aucuneDonneeTrouvee.style.display ="flex";
            	  				gridArticle.style.display="none";
            	  			}else {
            	  				aucuneDonneeTrouvee.style.display ="none";
            	  				gridArticle.style.display="grid";
            	  			}
		      			}else {
		      				//Affichage de message et hide du tableau existant
		      				var cpt = 0;
		      				aucuneDonnee.style.display="flex";
		      				while(document.getElementById(cpt)){
		      					document.getElementById(cpt).style.display="none";
		      					cpt++;
		      				}
		      				gridArticle.style.display="none";
		      			}
                    });

                    break;

                case "done":
                	keyElement.classList.add("keyboard__key_color2");
                    keyElement.classList.add("keyboard__key--wide");
                    keyElement.innerHTML = createIconHTML("check_circle");

                    keyElement.addEventListener("click", () => {
                        this.close();
                        this._triggerEvent("onclose");
                    });

                    break;

                default:
                	keyElement.classList.add("keyboard__key_color");
                    keyElement.textContent = key.toLowerCase();


                    keyElement.addEventListener("click", () => {
                   		this.properties.value += this.properties.capsLock ? key.toUpperCase() : key.toLowerCase();
                        this._triggerEvent("oninput");
                        var input, filter, i, j, txtValue,aucuneDonnee,aucuneDonneeTrouvee, type_recherche;
            	  		input = document.getElementById("searchNom");
            	  		filter = input.value.toUpperCase();
                    	aucuneDonnee = document.getElementById("aucuneDonnee");
                    	aucuneDonneeTrouvee = document.getElementById("aucuneDonneeTrouvee");
                    	gridArticle = document.getElementById("grid");
                    	type_recherche = document.getElementById("type_recherche").value;
                    	
		      			if (document.getElementById("searchNom").value.length >2){
		      				//Tri de la table
		      				// Loop through all div
		      				document.getElementById("grid").style.display="grid";
		      				aucuneDonnee.style.display="none";
		      				var k = 0;
		      				var cpt = 0;
            	  			while(document.getElementById(cpt)){
		      					var elem = document.getElementById(cpt);
		      					elem.style.display="none";
		      					switch(type_recherche) {
        	  							case "Commence":
            	  							if (elem.innerHTML.toUpperCase().indexOf(filter) == 0 || elem.dataset.code.toUpperCase().indexOf(filter) == 0) {
                	  							elem.style.display = "";
                	  							k++;
                	  							break;
                	  						}
            	  							break;
        	  							case "Contient":
            	  							if (elem.innerHTML.toUpperCase().indexOf(filter) != -1 || elem.dataset.code.toUpperCase().indexOf(filter) == -1) {
                	  							elem.style.display = "";
                	  							k++;
                	  							break;
                	  						}
            	  							break;
            	  						default:
            	  							if (elem.innerHTML.toUpperCase().indexOf(filter) != -1 || elem.dataset.code.toUpperCase().indexOf(filter) != -1) {
                	  							elem.style.display = "";
                	  							k++;
                	  							break;
                	  						}
            	  							break;
        	  						}
		      					cpt++;
		      				}
            	  			if (k == 0){
             	  				aucuneDonneeTrouvee.style.display ="flex";
            	  				gridArticle.style.display="none";
            	  			}else {
            	  				aucuneDonneeTrouvee.style.display ="none";
            	  				gridArticle.style.display="grid";
            	  			}
		      			}else {
		      				//Affichage de message et hide du tableau existant
		      				var cpt = 0;
		      				aucuneDonnee.style.display="flex";
		      				while(document.getElementById(cpt)){
		      					document.getElementById(cpt).style.display="none";
		      					cpt++;
		      				}
		      				gridArticle.style.display="none";
		      			}
                    });
                    break;
            }

            fragment.appendChild(keyElement);

            if (insertLineBreak) {
                fragment.appendChild(document.createElement("br"));
            }
        });

        return fragment;
    },

    _triggerEvent(handlerName) {
        if (typeof this.eventHandlers[handlerName] == "function") {
            this.eventHandlers[handlerName](this.properties.value);
        }
    },

    _toggleCapsLock() {
        this.properties.capsLock = !this.properties.capsLock;

        for (const key of this.elements.keys) {
            if (key.childElementCount === 0) {
                key.textContent = this.properties.capsLock ? key.textContent.toUpperCase() : key.textContent.toLowerCase();
            }
        }
    },

    open(initialValue, oninput, onclose) {
        this.properties.value = initialValue || "";
        this.eventHandlers.oninput = oninput;
        this.eventHandlers.onclose = onclose;
        this.elements.main.classList.remove("keyboard--hidden");
        // caps lock on open
        this._toggleCapsLock();
        document.getElementsByClassName("keyboard__key--activatable")[1].classList.add("keyboard__key--active");
    },

    close() {
        this.properties.value = "";
        this.eventHandlers.oninput = oninput;
        this.eventHandlers.onclose = onclose;
        this.elements.main.classList.add("keyboard--hidden");
    }
};

window.addEventListener("DOMContentLoaded", function () {
    KeyboardTriWithoutNumberGrid.init();
});