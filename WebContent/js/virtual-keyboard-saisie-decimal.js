const KeyboardSaisieDecimal = {
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
        this.elements.main.classList.add("keyboard-saisie-decimal", "keyboard--hidden");
        this.elements.keysContainer.classList.add("keyboard__keys-num");
        this.elements.keysContainer.appendChild(this._createKeys());

        this.elements.keys = this.elements.keysContainer.querySelectorAll(".keyboard__key");

        // Add to DOM
        this.elements.main.appendChild(this.elements.keysContainer);
        document.body.appendChild(this.elements.main);

        // Automatically use keyboard for elements with .use-keyboard-input
        document.querySelectorAll(".use-keyboard-input-saisie-decimal").forEach(element => {
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
        	"1", "2", "3", "backspace",
        	"4", "5", "6","done",
        	"7", "8", "9",".",
        	 "0",
        ];

        // Creates HTML for an icon
        const createIconHTML = (icon_name) => {
            return `<i class="material-icons">${icon_name}</i>`;
        };

        keyLayout.forEach(key => {
            const keyElement = document.createElement("button");
            const insertLineBreak = ["backspace", "p", "enter", "?"].indexOf(key) !== -1;

            // Add attributes/classes
            keyElement.setAttribute("type", "button");
            keyElement.classList.add("keyboard__key-num");

            switch (key) {
                case "backspace":
                	keyElement.classList.add("keyboard__key_color2");
                    keyElement.classList.add("keyboard__key--wide");
                    keyElement.innerHTML = createIconHTML("backspace");

                    keyElement.addEventListener("click", () => {
                        this.properties.value = this.properties.value.substring(0, this.properties.value.length - 1);
                        this._triggerEvent("oninput");
                        var colis = 0;
                        var poid_brut = 0;
                        var tare_unitaire = 0;
                        var piece = 0;
                        var tare_glob1 = 0;
                        var tare_glob2 = 0;
                        if(document.getElementById("input_colis").value != null) { colis = Number(document.getElementById("input_colis").value)}
                        if(document.getElementById("input_poids_brut").value != null) { poid_brut = Number(document.getElementById("input_poids_brut").value)}
                        if(document.getElementById("input_tare_unitaire").value != null) { tare_unitaire = Number(document.getElementById("input_tare_unitaire").value)}
                        if(document.getElementById("input_pieces").value != null) { piece = Number(document.getElementById("input_pieces").value)}
                        if(document.getElementById("input_tare_glob1").value != null) { tare_glob1 = Number(document.getElementById("input_tare_glob1").value)}
                        if(document.getElementById("input_tare_glob2").value != null) { tare_glob2 = Number(document.getElementById("input_tare_glob2").value)}
    					document.getElementById("input_poids_net").value = (poid_brut - tare_glob1 - tare_glob2 - (colis * tare_unitaire)).toFixed(3);
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
                    	console.log(key);
                        this.properties.value += this.properties.capsLock ? key.toUpperCase() : key.toLowerCase();
                        this._triggerEvent("oninput");
                        var colis = 0;
                        var poid_brut = 0;
                        var tare_unitaire = 0;
                        var piece = 0;
                        var tare_glob1 = 0;
                        var tare_glob2 = 0;
                        if(document.getElementById("input_colis").value != null) { colis = Number(document.getElementById("input_colis").value)}
                        if(document.getElementById("input_poids_brut").value != null) { poid_brut = Number(document.getElementById("input_poids_brut").value)}
                        if(document.getElementById("input_tare_unitaire").value != null) { tare_unitaire = Number(document.getElementById("input_tare_unitaire").value)}
                        if(document.getElementById("input_pieces").value != null) { piece = Number(document.getElementById("input_pieces").value)}
                        if(document.getElementById("input_tare_glob1").value != null) { tare_glob1 = Number(document.getElementById("input_tare_glob1").value)}
                        if(document.getElementById("input_tare_glob2").value != null) { tare_glob2 = Number(document.getElementById("input_tare_glob2").value)}
    					document.getElementById("input_poids_net").value = (poid_brut - tare_glob1 - tare_glob2 - (colis * tare_unitaire)).toFixed(3);
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
        document.getElementsByClassName("keyboard-saisie-int")[0].classList.add("keyboard--hidden");
        this.elements.main.classList.remove("keyboard--hidden");
        if(document.getElementById("input_colis").value != "") { document.getElementById("input_colis").value = Number(document.getElementById("input_colis").value).toFixed(3);}
        if(document.getElementById("input_poids_brut").value != "") { document.getElementById("input_poids_brut").value = Number(document.getElementById("input_poids_brut").value).toFixed(3);}
        if(document.getElementById("input_tare_unitaire").value != "") { document.getElementById("input_tare_unitaire").value = Number(document.getElementById("input_tare_unitaire").value).toFixed(3);}
        if(document.getElementById("input_tare_glob1").value != "") { document.getElementById("input_tare_glob1").value = Number(document.getElementById("input_tare_glob1").value).toFixed(3);}
        if(document.getElementById("input_tare_glob2").value != "") { document.getElementById("input_tare_glob2").value = Number(document.getElementById("input_tare_glob2").value).toFixed(3);}
    },

    close() {
    	if(document.getElementById("input_colis").value != "") { document.getElementById("input_colis").value = Number(document.getElementById("input_colis").value).toFixed(3);}
        if(document.getElementById("input_poids_brut").value != "") { document.getElementById("input_poids_brut").value = Number(document.getElementById("input_poids_brut").value).toFixed(3);}
        if(document.getElementById("input_tare_unitaire").value != "") { document.getElementById("input_tare_unitaire").value = Number(document.getElementById("input_tare_unitaire").value).toFixed(3);}
        if(document.getElementById("input_tare_glob1").value != "") { document.getElementById("input_tare_glob1").value = Number(document.getElementById("input_tare_glob1").value).toFixed(3);}
        if(document.getElementById("input_tare_glob2").value != "") { document.getElementById("input_tare_glob2").value = Number(document.getElementById("input_tare_glob2").value).toFixed(3);}
        this.properties.value = "";
        this.eventHandlers.oninput = oninput;
        this.eventHandlers.onclose = onclose;
        this.elements.main.classList.add("keyboard--hidden");
    }
};

window.addEventListener("DOMContentLoaded", function () {
	KeyboardSaisieDecimal.init();
});
