<%Response.Buffer=True%>
<%
flagedit=Request.QueryString("flagedit")
flagaccess=Request.QueryString("flagaccess")
ID=Request.QueryString("ID")


If flagAccess<>"" Then
	Session("SQL")=" SELECT ID, EnglishName As Name, EnglishAddress As Address FROM Location ORDER BY EnglishName"
	Response.Redirect "../FormEdit1.asp?ID=" & ID & "&flagAccess=" & flagaccess & "&flagEdit=" & flagedit
	'Response.Redirect "../FormEdit1.asp?ID=" & ID & "&flagAccess=1&flagEdit=Update"

Else
	whichFN=Server.MapPath("Text/LocationInfo.txt")
	Set fs=Server.CreateObject("Scripting.FileSystemObject")
	Set thisfile=fs.OpenTextFile(whichFN,1,False)
	LocationInfo=""
	do while not thisfile.AtEndOfStream
		LocationInfo=LocationInfo & thisfile.ReadLine
	Loop

	thisfile.Close
	Set thisfile=Nothing
	Set fs=Nothing

	LocationInfoList=Split(LocationInfo,"~")

	EnglishName=Left(LocationInfoList(0),Len(LocationInfoList(0))-1)
	VNName=Left(LocationInfoList(1),Len(LocationInfoList(1))-1)
	Category=Left(LocationInfoList(2),Len(LocationInfoList(2))-1)
	YearBuilt=Left(LocationInfoList(3),Len(LocationInfoList(3))-1)
	Precinct=Left(LocationInfoList(4),Len(LocationInfoList(4))-1)
	District=Left(LocationInfoList(5),Len(LocationInfoList(5))-1)
	EnglishAddress=Left(LocationInfoList(6),Len(LocationInfoList(6))-1)
	VNAddress=Left(LocationInfoList(7),Len(LocationInfoList(7))-1)
	Phone=Left(LocationInfoList(8),Len(LocationInfoList(8))-1)
	Fax=Left(LocationInfoList(9),Len(LocationInfoList(9))-1)
	Email=Left(LocationInfoList(10),Len(LocationInfoList(10))-1)
	Website=Left(LocationInfoList(11),Len(LocationInfoList(11))-1)
	MapLocation=Left(LocationInfoList(12),Len(LocationInfoList(12))-1)
	MapPart=Left(LocationInfoList(13),Len(LocationInfoList(13))-1)
	MainImage=Left(LocationInfoList(14),Len(LocationInfoList(14))-1)
	MainSound=Left(LocationInfoList(15),Len(LocationInfoList(15))-1)
	MainMovie=Left(LocationInfoList(16),Len(LocationInfoList(16))-1)
	tpCategory=Left(LocationInfoList(17),Len(LocationInfoList(17))-1)
	EnglishIntroduction=Left(LocationInfoList(18),Len(LocationInfoList(18))-1)
	Design=Left(LocationInfoList(19),Len(LocationInfoList(19))-1)
	Standard=Left(LocationInfoList(20),Len(LocationInfoList(20))-1)
	MinPrice=Left(LocationInfoList(21),Len(LocationInfoList(21))-1)
	MaxPrice=Left(LocationInfoList(22),Len(LocationInfoList(22))-1)
	Food=Left(LocationInfoList(23),Len(LocationInfoList(23))-1)
	PrincipalDish=Left(LocationInfoList(24),Len(LocationInfoList(24))-1)
	Worship=Left(LocationInfoList(25),Len(LocationInfoList(25))-1)
	Shopping=Left(LocationInfoList(26),Len(LocationInfoList(26))-1)
	Entertainment=Left(LocationInfoList(27),Len(LocationInfoList(27))-1)
	Transport=Left(LocationInfoList(28),Len(LocationInfoList(28))-1)
	MedicalService=Left(LocationInfoList(29),Len(LocationInfoList(29))-1)
	Book=Left(LocationInfoList(30),Len(LocationInfoList(30))-1)
	Communication=Left(LocationInfoList(31),Len(LocationInfoList(31))-1)
	BookingOffice=Left(LocationInfoList(32),Len(LocationInfoList(32))-1)
	Inbound=Left(LocationInfoList(33),Len(LocationInfoList(33))-1)
	Outbound=Left(LocationInfoList(34),Len(LocationInfoList(34))-1)
	Trekking=Left(LocationInfoList(35),Len(LocationInfoList(35))-1)
	MotorbikingTour=Left(LocationInfoList(36),Len(LocationInfoList(36))-1)


	s=Request.QueryString("MapLocation")
	If s<> "" Then
		List=Split(s,":")
		If UBound(List) = 1 Then
			MapPart=List(0)
			MapLocation=List(1)
		End If
	End If
%>
	<HTML>
	<HEAD>
	<META NAME="GENERATOR" Content="Microsoft FrontPage 4.0">
	<TITLE>BridgeEditForm</TITLE>
	</HEAD>
	<BODY onload="loadPage()">
	<form name=formMapInfo action="../FormEdit1.asp?ID=<%=ID%>&flagEdit=<%=flagEdit%>" 
      method="POST">
  <input type="hidden" name="EnglishName"    value="<%=EnglishName%>">
  <input type="hidden" name="VNName"		   value="<%=VNName%>">
  <input type="hidden" name="Category"       value="<%=Category%>">
  <input type="hidden" name="YearBuilt"      value="<%=YearBuilt%>">
  <input type="hidden" name="Precinct"       value="<%=Precinct%>">
  <input type="hidden" name="District"       value="<%=District%>">
  <input type="hidden" name="EnglishAddress" value="<%=EnglishAddress%>">
  <input type="hidden" name="VNAddress"      value="<%=VNAddress%>">
  <input type="hidden" name="Phone"          value="<%=Phone%>">
  <input type="hidden" name="Fax"            value="<%=Fax%>">
  <input type="hidden" name="Email"          value="<%=Email%>">
  <input type="hidden" name="Website"        value="<%=Website%>">
  <input type="hidden" name="MapLocation"		value="<%=MapLocation%>">
  <input type="hidden" name="MapPart"    		value="<%=MapPart%>">
  <input type="hidden" name="MainImage"    	value="<%=MainImage%>">
  <input type="hidden" name="MainSound"     	value="<%=MainSound%>">
  <input type="hidden" name="MainMovie"     	value="<%=MainMovie%>">
  
  <input type="hidden" name="tpCategory"     		value="<%=tpCategory%>">
  <input type="hidden" name="EnglishIntroduction"  	value="<%=EnglishIntroduction%>">

  <input type="hidden" name="Design"      	value="<%=Design%>">
  <input type="hidden" name="Standard"     	value="<%=Standard%>">
  <input type="hidden" name="MinPrice"		value="<%=MinPrice%>">
  <input type="hidden" name="MaxPrice"    	value="<%=MaxPrice%>">

  <input type="hidden" name="Food"    		value="<%=Food%>">
  <input type="hidden" name="PrincipalDish" 	value="<%=PrincipalDish%>">
  <input type="hidden" name="Worship"     	value="<%=Worship%>">
  <input type="hidden" name="Shopping"    	value="<%=Shopping%>">

  <input type="hidden" name="Entertainment" 	value="<%=Entertainment%>">
  <input type="hidden" name="Transport" 		value="<%=Transport%>">
  <input type="hidden" name="MedicalService"	value="<%=MedicalService%>">
  <input type="hidden" name="Book"    		value="<%=Book%>">

  <input type="hidden" name="Communication" 	value="<%=Communication%>">
  <input type="hidden" name="BookingOffice" 	value="<%=BookingOffice%>">
  <input type="hidden" name="Inbound"			value="<%=Inbound%>">
  <input type="hidden" name="Outbound"    		value="<%=Outbound%>">

  <input type="hidden" name="Trekking" 			value="<%=Trekking%>">
  <input type="hidden" name="MotorbikingTour" 	value="<%=MotorbikingTour%>">
  
	</form>
	<script language="JavaScript">
		function loadPage() {
			document.formMapInfo.submit();
		}
	</script>

	</BODY>
	</HTML>	
<%End If%>

