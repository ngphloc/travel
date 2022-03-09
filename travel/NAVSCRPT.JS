var oLastBtn=0;
	function RaiseButton(){
		window.event.cancelBubble=true;
		oBtn = window.event.srcElement;
		var bChosen = false;
		if(oLastBtn && oLastBtn != oBtn){
			HideButton();
		}
		if(oBtn.buttonType){
			oBtn.className = oBtn.buttonType + "Up";
			oLastBtn=oBtn;
			}
		else {
		oLastBtn = 0;
		}
	}
	function DepressButton(){
		window.event.cancelBubble=true;
		oBtn = window.event.srcElement;
		if(oBtn.buttonType){
			oBtn.className = oBtn.buttonType + "Down"; 
			if (oBtn.className == "LeftNavChosenDown") {
			oBtn.className = "LeftNavDown";
			}
		}
	}
	function HideButton(){
		if ((oLastBtn.buttonType == "LeftNavChosen") || (oLastBtn.buttonType == "LeftNavSubChosen") || (oLastBtn.buttonType == "LeftNavSub2Chosen")) {
			oLastBtn.className = oLastBtn.buttonType;
		}
		else {
		oLastBtn.className = oLastBtn.buttonType + "Off";
		}
	}

	var strTDColor = '#003399';
	g_RolledTD = new Object;

	function textRoll(strTextColor)
  {
		window.event.srcElement.style.color = strTextColor;
		window.event.cancelBubble = true;
	}
	function TDUnRoll()
	{    
		g_RolledTD.bgColor = strTDColor;	
	}
	function TDRoll(strTDColor)
	{
		window.event.srcElement.bgColor = strTDColor;
		g_RolledTD = window.event.srcElement;
		window.event.cancelBubble = true;
	}
	
	function bgRoll(strTextColor)
		{
			window.event.srcElement.style.backgroundColor = strTextColor;
			window.event.cancelBubble = true;
		}
	function fntRoll(strTextColor)
		{
	  		window.event.srcElement.style.color = 'orange';//strTextColor;
			window.event.cancelBubble = true;
	}	
						
	document.onClick = TDUnRoll;
	document.onmouseover = TDUnRoll;
	
//Script for collapsing and expanding TOC, highliting subitems
//Created by Dan Ivanov on 03.05.00

bullet = "&#149;"

	function navClick(a,b) {
		if (a.style.display =='') {
			a.style.display = 'none';
		}
		else {
 			a.style.display='';
		}
	}
	
	