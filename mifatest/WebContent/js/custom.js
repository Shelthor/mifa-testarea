/*

	GLOBAL VARS 
*/

		var request; //AJAX  

		checked = new Array(false,false,false);
		var wert;

/*

	Sterne
	Bewerten.jsp 
	
*/

		function leuchten(a, tabelleX) 
		{
			var posi = "sterne"+tabelleX;
			var table = document.getElementById(posi);
			var tds = table.getElementsByTagName("td");
			
			
			if(checked[tabelleX-1]==false)
			{
				for (var i = 0; i < tds.length; i++) {
					if(i < a)
						{
							  tds[i].style.backgroundImage = "url('img/1.png')";
						}
					else
						{
							 tds[i].style.backgroundImage = "url('img/2.png')";
						}
					} 
			}
				
		}

		function setzen(a, tabelleY) 
		{
			checked[tabelleY-1] = false;

			leuchten(a, tabelleY);
			checked[tabelleY-1] = true;

			var hFeld = "hiddenField" + tabelleY;

			document.getElementById(hFeld).value=a;       
		}

/*
	ALTER BERECHNEN
	UserOeffentlich.jsp 
*/

		function giveAge(x)
		{
			var datee = x;

			parseInt(datee.substr(0, 4));

			var byr = parseInt(datee.substr(0, 4));
			var bmo = parseInt(datee.substr(5, 2));
			var bday = parseInt(datee.substr(8, 2));

			//
			var age;
			var now = new Date();
			tday=parseInt(now.getDate());
			tmo=parseInt(now.getMonth());
			tyr=parseInt(now.getFullYear());
				
				if((tmo > bmo)||(tmo==bmo & tday>=bday))
					{age=byr}
				else
					{age=byr+1}
				
				var result = (tyr-age) + " Jahre alt";
				return result;		
		}

/*

	AJAX
	FahrtAnbieten.jsp , 
*/

		function sendInfo(x)  
		{  
			var v=x.value;  
			var url="aj_vergleicheEingabeMitOrtTabelle.jsp?val="+v;  
			  
			if(window.XMLHttpRequest){  
			request=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
			request=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
			  
			try{  
			request.onreadystatechange= function() {
				getInfo(x);	  
			};
			
			
			request.open("GET",url,true);  
			request.send();  
			}catch(e){alert("Unable to connect to server");}  
		}  
			  
		function getInfo(x){  
			if(request.readyState==4){  
			var val=request.responseText;  

			x.nextElementSibling.style.display = "block";
			x.nextElementSibling.innerHTML = val;
			}  
		}
			
		function changeFormValue(elem){
			var par = elem.parentElement;
			var input = elem.parentElement.previousSibling;
			
			par.style.display = "none";
			input.value = elem.innerHTML;
		}

/*
	SUCCESS / FAIL
	FahrtAnbieten.jsp , 
*/

		function sendSQL(){
		  $( "#whole" ).slideUp();
		}
			
		function suc(){
			$( "#sendSuccess" ).show();
		}
			
		function fail(){
			$( "#sendFail" ).show();
		}

/*

	DATE
	FahrtAnbieten.jsp , FahrtBearbeiten.jsp
*/

		$(function() {
			$( "#datepicker" ).datepicker({ dateFormat: 'dd-mm-yy',
											onSelect: function()
												{
												ueberfuehreDatum();
												}
			});
		});
			  
		function ueberfuehreDatum(){
			var Datestring = document.getElementById('datepicker').value;
			
			var byr = Datestring.substr(6, 4);
			var bmo = Datestring.substr(0, 2);
			var bday = Datestring.substr(3, 2);
			
			//abspeichern der Werte in Hiddenfields, die später wieder von der JSP benutzt werden
			document.getElementById('hiddenJahr').value = byr;
			document.getElementById('hiddenMonat').value = bmo;
			document.getElementById('hiddenTag').value = bday;
		}

/*

	PRÜFE OB Ziffern eingegeben worden sind
	FahrtAnbieten.jsp , 
*/
	
		function checkKap(){
			var data = document.getElementById("formkap").value;
			if(isNaN(data)){
			  alert("bitte nur Ziffern eingeben");
			}else {
			}
		}

/*

	//EDIT FAHRT
	FahrtBearbeiten.jsp , 
*/

		function zeigeBearbeitungsFeld(a)
		{
			$('#b'+ a).show();
		}

		function glow(a)
		{
			a.style.backgroundImage = "url('img/bearb_glow.png')";
			a.style["background-image"] = "url('img/bearb_glow.png')";
		}

		function blass(a)
		{
			a.style.backgroundImage = "url('img/bearb.png')";
			a.style["background-image"] = "url('img/bearb.png')";
		}