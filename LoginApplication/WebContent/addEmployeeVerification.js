/**
 * 
 */

function verifyForm(){
	if(checkFirstName()){
		window.alert("yep");
		return true;
	}
	window.alert("nope");
}

function checkFirstName(){
	if(document.getElementsByName("firstName") != null){
		return true;
	}
	return false;
}