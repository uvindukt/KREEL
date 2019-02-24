function CustomPrompt(){
	
	this.render = function(dialog, index) {
		
		var winW = window.innerWidth;
	    var winH = window.innerHeight;
		var dialogoverlay = document.getElementById('overlay');
	    var dialogbox = document.getElementById('alertbox');
		dialogoverlay.style.display = "block";
	    dialogoverlay.style.height = winH+"px";
		dialogbox.style.left = (winW/2) - (550 * .5)+"px";
	    dialogbox.style.top = "30%";
	    dialogbox.style.display = "block";
		document.getElementById('alertboxhead').innerHTML = '<img src="img/logo2.png" width="100vw" height="50vw">';
		document.getElementById('alertboxbody').innerHTML = '<form id="val" method="post" action="UpdateCreditCardServlet"><input autocorrect="off" required type="text" class="text-box" name="val" placeholder="' + dialog + '"><input hidden name="ind" value="' + index + '"></form>';
		document.getElementById('alertboxfoot').innerHTML = '<button class="button" onclick="Prompt.ok()">OK</button>&emsp;&emsp;<button class="button" onclick="Prompt.cancel()">Cancel</button>';
	
	}
	
	this.cancel = function() {
		
		document.getElementById('alertbox').style.display = "none";
		document.getElementById('overlay').style.display = "none";
		
	}
	
	this.ok = function() {
		
		document.forms['val'].submit();
		document.getElementById('alertbox').style.display = "none";
		document.getElementById('overlay').style.display = "none";
		
	}
	
}

var Prompt = new CustomPrompt();