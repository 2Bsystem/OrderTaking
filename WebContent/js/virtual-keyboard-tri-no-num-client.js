const KeyboardTritest = {
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
        this.elements.main.classList.add("keyboard", "keyboard--hidden");
        this.elements.keysContainer.classList.add("keyboard__keys");
        this.elements.keysContainer.appendChild(this._createKeys());

        this.elements.keys = this.elements.keysContainer.querySelectorAll(".keyboard__key");

        // Add to DOM
        this.elements.main.appendChild(this.elements.keysContainer);
        document.body.appendChild(this.elements.main);

        // Automatically use keyboard for elements with .use-keyboard-input
        document.querySelectorAll(".use-keyboard-input-tri-no-num-client").forEach(element => {
            element.addEventListener("focus", () => {
                this.open(element.value, currentValue => {
                    element.value = currentValue;
                });
            });
        });
    },

    _createKeys() {
        const fragment = document.createDocumentFragment();
 /*       const keyLayout = [
        	"#", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "backspace",
            "a", "z", "e", "r", "t", "y", "u", "i", "o", "p",
            "caps", "q", "s", "d", "f", "g", "h", "j", "k", "l", "m", "enter",
            "done", "w", "x", "c", "v", "b", "n", ",", ".", "?",
            "space"
        ];*/
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
            const insertLineBreak = ["backspace", /*"p",*/ "enter", "?"].indexOf(key) !== -1;

            // Add attributes/classes
            keyElement.setAttribute("type", "button");
            //keyElement.classList.add("keyboard__key");
            keyElement.classList.add("keyboard__key__without__number");


            switch (key) {
	            /*case "9":
	        	case "8":
	        	case "7":
	        	case "6":
	        	case "5":
	        	case "4":
	        	case "3":
	       		case "2":
	        	case "1":
	        	case "0":
	        		keyElement.classList.add("keyboard__key_color_numbers");
	        		keyElement.textContent = key.toLowerCase();
					
	        		keyElement.addEventListener("click", () => {
                        this.properties.value += this.properties.capsLock ? key.toUpperCase() : key.toLowerCase();
                        this._triggerEvent("oninput");
                        var input, filter, table, tr, td, i, j, txtValue;
            	  		input = document.getElementById("searchNom");
            	  		filter = input.value.toUpperCase();
            	  		table = document.getElementById("table");
            	  		tr = table.getElementsByTagName("tr");
            	  		
            	  	// Loop through all table rows, and hide those who don't match the search query
            	  		for (i = 1; i < tr.length; i++) {
            	  			// Hide the row initially.
            	  			tr[i].style.display = "none";
            	  			
            	  			td = tr[i].getElementsByTagName("td");
            	  			for (var j = 0; j < td.length; j++) {
            	  				cell = tr[i].getElementsByTagName("td")[j];
            	  				if (cell) {
            	  			        if (cell.innerHTML.toUpperCase().indexOf(filter) > -1) {
            	  						tr[i].style.display = "";
            	  						break;
            	  					} 
            	  				}
            	  			}
            	  		}
                    });
	        		break;*/
                case "backspace":
                	keyElement.classList.add("keyboard__key_color2");
                    keyElement.classList.add("keyboard__key--wide");
                    keyElement.innerHTML = createIconHTML("backspace");
                    	
                    keyElement.addEventListener("click", () => {
                        this.properties.value = this.properties.value.substring(0, this.properties.value.length - 1);
                        this._triggerEvent("oninput");
                        var input, filter, table, tr, td, i, j, txtValue,bodyTable,aucuneDonnee,aucuneDonneeTrouvee;
            	  		input = document.getElementById("searchNom");
            	  		filter = input.value.toUpperCase();
            	  		table = document.getElementById("table");
            	  		tr = table.getElementsByTagName("tr");
            	  		bodyTable = document.getElementById("bodyTable");
                    	aucuneDonnee = document.getElementById("aucuneDonnee");
                    	aucuneDonneeTrouvee = document.getElementById("aucuneDonneeTrouvee");
            	  		
						if (document.getElementById("searchNom").value.length >2){
		      				//Tri de la table
		      				// Loop through all table rows, and hide those who don't match the search query
		      				aucuneDonnee.style.display="none";
		      				bodyTable.style.display="block";
		      				aucuneDonneeTrouvee.style.display="none";
		      				var k = 0;
            	  			for (i = 1; i < tr.length; i++) {
            	  				// Hide the row initially.
            	  				tr[i].style.display = "none";
            	  				td = tr[i].getElementsByTagName("td");
            	  				for (var j = 0; j < td.length; j++) {
            	  					cell = tr[i].getElementsByTagName("td")[j];
            	  					if (cell) {
            	  			    	    if (cell.innerHTML.toUpperCase().indexOf(filter) > -1) {
            	  							tr[i].style.display = "";
            	  							k++;
            	  							break;
            	  						} 
            	  					}
            	  				}
            	  				if (k == 0){
            	  					aucuneDonneeTrouvee.style.display ="flex";
            	  					bodyTable.style.display="none";
            	  				}else {
            	  					aucuneDonneeTrouvee.style.display ="none";
            	  					bodyTable.style.display="block";
            	  				}
            	  			}
		      			}else {
		      				//Affichage de message et hide du tableau existant
		      				aucuneDonnee.style.display="flex";
		      				aucuneDonneeTrouvee.style.display ="none";
		      				bodyTable.style.display="none";
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
                        var input, filter, table, tr, td, i, j, txtValue,bodyTable,aucuneDonnee,aucuneDonneeTrouvee;
            	  		input = document.getElementById("searchNom");
            	  		filter = input.value.toUpperCase();
            	  		table = document.getElementById("table");
            	  		tr = table.getElementsByTagName("tr");
            	  		bodyTable = document.getElementById("bodyTable");
                    	aucuneDonnee = document.getElementById("aucuneDonnee");
                    	aucuneDonneeTrouvee = document.getElementById("aucuneDonneeTrouvee");
            	  		
						if (document.getElementById("searchNom").value.length >2){
		      				//Tri de la table
		      				// Loop through all table rows, and hide those who don't match the search query
		      				aucuneDonnee.style.display="none";
		      				bodyTable.style.display="block";
		      				var k = 0;
            	  			for (i = 1; i < tr.length; i++) {
            	  				// Hide the row initially.
            	  				tr[i].style.display = "none";
            	  			
            	  				td = tr[i].getElementsByTagName("td");
            	  				for (var j = 0; j < td.length; j++) {
            	  					cell = tr[i].getElementsByTagName("td")[j];
            	  					if (cell) {
            	  			    	    if (cell.innerHTML.toUpperCase().indexOf(filter) > -1) {
            	  							tr[i].style.display = "";
            	  							k++;
            	  							break;
            	  						} 
            	  					}
            	  				}
            	  				if (k == 0){
            	  					aucuneDonneeTrouvee.style.display ="flex";
            	  					bodyTable.style.display="none";
            	  				}else {
            	  					aucuneDonneeTrouvee.style.display ="none";
            	  					bodyTable.style.display="block";
            	  				}
            	  			}
		      			}else {
		      				//Affichage de message et hide du tableau existant
		      				aucuneDonnee.style.display="flex";
		      				bodyTable.style.display="none";
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
                        var input, filter, table, tr, td, i, j, txtValue,bodyTable,aucuneDonnee,aucuneDonneeTrouvee;
            	  		input = document.getElementById("searchNom");
            	  		filter = input.value.toUpperCase();
            	  		table = document.getElementById("table");
            	  		tr = table.getElementsByTagName("tr");
                    	bodyTable = document.getElementById("bodyTable");
                    	aucuneDonnee = document.getElementById("aucuneDonnee");
                    	aucuneDonneeTrouvee = document.getElementById("aucuneDonneeTrouvee");
                    	
		      			if (document.getElementById("searchNom").value.length >2){
		      				//Tri de la table
		      				// Loop through all table rows, and hide those who don't match the search query
		      				aucuneDonnee.style.display="none";
		      				bodyTable.style.display="block";
		      				var k = 0;
            	  			for (i = 1; i < tr.length; i++) {
            	  				// Hide the row initially.
            	  				tr[i].style.display = "none";
            	  				td = tr[i].getElementsByTagName("td");
            	  				for (var j = 0; j < td.length; j++) {
            	  					cell = tr[i].getElementsByTagName("td")[j];
            	  					if (cell) {
            	  			    	    if (cell.innerHTML.toUpperCase().indexOf(filter) > -1) {
            	  							tr[i].style.display = "";
            	  							k++;
            	  							break;
            	  						} 
            	  					}
            	  				}
            	  			}
            	  			if (k == 0){
            	  				aucuneDonneeTrouvee.style.display ="flex";
            	  				bodyTable.style.display="none";
            	  			}else {
            	  				aucuneDonneeTrouvee.style.display ="none";
            	  				bodyTable.style.display="block";
            	  			}
		      			}else {
		      				//Affichage de message et hide du tableau existant
		      				aucuneDonnee.style.display="flex";
		      				bodyTable.style.display="none";
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
    },

    close() {
        this.properties.value = "";
        this.eventHandlers.oninput = oninput;
        this.eventHandlers.onclose = onclose;
        this.elements.main.classList.add("keyboard--hidden");
    }
};

window.addEventListener("DOMContentLoaded", function () {
    KeyboardTritest.init();
});
