/*

	VARS 
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
	FahrtAnbieten.jsp , 
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
	
	//abspeichern der Werte in Hiddenfields, die sp�ter wieder von der JSP benutzt werden
	document.getElementById('hiddenJahr').value = byr;
	document.getElementById('hiddenMonat').value = bmo;
	document.getElementById('hiddenTag').value = bday;
}

/*

	duschen
	FahrtAnbieten.jsp , 
*/
	
function checkKap(){
	var data = document.getElementById("formkap").value;
	if(isNaN(data)){
	  alert("bitte nur Ziffern eingeben");
	}else {
	}
}