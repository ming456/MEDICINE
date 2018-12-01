var nav = document.getElementById("nav");
var nav1 = document.getElementById("nav1");
var nav2 = document.getElementById("nav2");
var nav3 = document.getElementById("nav3");
var nav4 = document.getElementById("nav4");
nav.style.display = "none";
nav1.style.display = "none";
nav2.style.display = "none";
nav3.style.display = "none";
nav4.style.display = "none";
document.getElementById("navdisplay").onclick = function() {

	if (nav.style.display == "none") {

		nav.style.display = "block";

	} else {
		nav.style.display = "none";
	}
	}
	document.getElementById("navdisplay1").onclick = function() {

		if (nav1.style.display == "none") {

			nav1.style.display = "block";

		} else {
			nav1.style.display = "none";
		}}
		document.getElementById("navdisplay2").onclick = function() {

			if (nav2.style.display == "none") {

				nav2.style.display = "block";

			} else {
				nav2.style.display = "none";
			}
			}
			document.getElementById("navdisplay3").onclick = function() {

				if (nav3.style.display == "none") {

					nav3.style.display = "block";

				} else {
					nav3.style.display = "none";
				}}
			document.getElementById("navdisplay4").onclick = function() {

				if (nav4.style.display == "none") {

					nav4.style.display = "block";

				} else {
					nav4.style.display = "none";
				}}
	