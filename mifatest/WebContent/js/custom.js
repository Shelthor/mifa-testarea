/*

	AJAX

*/

var request;  
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

	duschen

*/
	
function checkKap(){
	var data = document.getElementById("formkap").value;
	if(isNaN(data)){
	  alert("bitte nur Ziffern eingeben");
	}else {
	}
}