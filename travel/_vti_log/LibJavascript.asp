<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Lib Javascript</title>

<script language="JavaScript">
	function IsEnglishName(form){
		if (form.EnglishName.value == "")	return false;
		return true;
	}
	function IsDesign(form){
		var myText  = form.Design.value;
		if((myText == 0) || (myText == ""))		
			return false
		return true
	}
	function IsStandard(form){
		var myText  = form.Standard.value;
		if((myText == 0) || (myText == ""))		
			return false
		return true
	}
	function IsFood(form){
		var myText  = form.Food.value
		if((myText == 0) || (myText == ""))		
			return false
		return true
	}
	function IsWorship(form){
		var myText  = form.Worship.value
		if((myText == 0) || (myText == ""))		
			return false
		return true
	}
	function IsShopping(form){
		var myText  = form.Shopping.value
		if((myText == 0) || (myText == ""))		
			return false
		return true
	}
	function IsEntertainment(form){
		var myText  = form.Entertainment.value
		if((myText == 0) || (myText == ""))		
			return false
		return true
	}
	function IsTransport(form){
		var myText  = form.Transport.value
		if((myText == 0) || (myText == ""))		
			return false
		return true
	}
	function IsBook(form){
		var myText  = form.Book.value
		if((myText == 0) || (myText == ""))		
			return false
		return true
	}
	function IsCommunication(form){
		var myText  = form.Communication.value
		if((myText == 0) || (myText == ""))		
			return false
		return true
	}
	function IsMedicalService(form){
		var myText  = form.MedicalService.value
		if((myText == 0) || (myText == ""))		
			return false
		return true
	}
	function IsBookingOffice(form){
		var myText  = form.BookingOffice.value
		if((myText == 0) || (myText == ""))		
			return false
		return true
	}
	function FinishEdit(form,ID,strDes){
		var myCategory = form.tpCategory.value;
		var text = "";
		var text1 = "";
		var text2 = "";
		
		switch(myCategory){
			//Place to stay
			case "1" :{
				if (IsDesign(form)==false)		text2 = text2 + "\n -Design";
				if (IsStandard(form)==false)	text2 = text2 + "\n -Standard";
				break;}
			//Place to eat
			case "2" :{
				if (IsFood(form)==false)		text2 = text2 + "\n -Food";
				break;}
			//Place of worship
			case "3" :{
				if (IsWorship(form)==false)		text2 += "\n -Worship";
				break;}
			//Shopping
			case "4" :{
				if (IsShopping(form)==false)	text2 += "\n -Shopping";
				break;}
			//Entertainment & relax
			case "5" :{
				if (IsEntertainment(form)==false)	text2 += "\n -Entertainment";
				break;}
			//Museum
//			case "6" :{break;}
			//Transport
			case "7" :{
				if (IsTransport(form)==false)		text2 += "\n -Transport";
				break;}
			//Medical service
			case "8" :{
				if (IsMedicalService(form)==false)	text2 += "\n -Medical service";
				break;}
			//Book
			case "9" :{
				if (IsBook(form)==false)			text2 += "\n -Book";
				break ;}
			//VisaExtension
//			case "10" :{break;}
			//Bank
//			case "11" :{break;}
			//Communication
			case "12" :{
				if (IsCommunication(form)==false)	text2 += "\n-Communication";
				break;}
			//Booking-office
			case "13" :{
				if (IsBookingOffice(form)==false)	text2 += "\n-Booking_office";
				break;}
			//Travel agency
			//case "14" :{break;}
			//Other
			//case "15" :{break;}
		}
		if (IsEnglishName(form)==false)		text1 += "\n -Name";

		if ((text1 == "") && (text2 == "")){
			form.action = strDes + "?ID=" + ID
		}
		else{
			if (text1 != "")	text += "You forgot to enter value :" + text1 + "\n";
			if (text2 != "")	text += "You must to choose characteristic of location :" + text2;
			alert(text);
		}
	}
//Finish edit tour
	function FinishEditTour(form,TourID,flagEdit){
		if (flagEdit == "Delete" ){
			if (confirm("Are you sure you want to delete this tour?")==true){
				form.action = "EditTour.asp?TourID=" + TourID + "&flagEdit=" + flagEdit
				form.submit()
			}
		}
		else{
			var flag=1;
			var LocationIDs = form.LocationIDs.value;
			var LocationID  = LocationIDs.split(":");
			//if(LocationID[0]!= LocationID.length-1)	return;
			for (i=1; i<=LocationID[0]; i++){
				if (LocationID[i] == 0){
					flag = 0;
					break;
				}
			} 
			if(flag==0){
				if (confirm("You don't choose entire site.Do you want to continue?")==true){
					form.action = "EditTour.asp?TourID=" + TourID + "&flagEdit=" + flagEdit;
					form.submit();
				}
			}
			else{
				form.action = "EditTour.asp?TourID=" + TourID + "&flagEdit=" + flagEdit;
				form.submit();
			}
		}
	}
//Delete location
	function DeleteLocation(form,ID,strDes){
		if (confirm("Are you sure you want to delete this location?")==true){
			form.action = strDes + "?ID=" + ID
			form.submit()
		}
	}
//Cancel Edt Location
	function CancelEditLocation(form,flagEdit){
		if (flagEdit == "Add")
			form.action = "MenuEdit.asp"
		else
			form.action = "SearchLocation.asp?numPage=1&flagEdit=" + flagEdit
		form.submit()
	}
//Cancel Edit Tour
	function CancelEditTour(form,flagEdit){
		if (flagEdit == "Add")
			form.action = "MenuEdit.asp"
		else
			form.action = "SearchTour.asp?numPage=1&flagEdit=" + flagEdit
		form.submit()
	}
//
</script>

</head>

<body>

</body>

</html>
