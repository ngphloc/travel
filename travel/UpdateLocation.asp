<%Response.Buffer=true%>
<!--#INCLUDE FILE="LibErrors.asp"-->
<!--#INCLUDE FILE="GeneralInformation.asp"-->

<%
on error resume next
attempt = "Create connection object" 'thong bao ve loi kiem tra

'Mo ket noi server
'ConnectionString = Session("cnString")
ConnectionString = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("Data/Travel.mdb")
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open ConnectionString
Call CheckErrorVBScript(attempt)

strText = ""
strSelect = ""

'Lay thong tin can cap nhat cua dia danh
ID = Request.QueryString("ID")

EnglishName	   = SwapText(Request.Form("EnglishName"))
	strText   = strText & CheckValue(EnglishName,"-name ")
YearBuilt      = SwapText(Request.Form("YearBuilt"))
Category       = SwapSelect(Request.Form("Category"))
	strSelect = strSelect & CheckValue(Category,"-categoty ")
Precinct       = SwapSelect(Request.Form("Precinct"))
District	   = SwapSelect(Request.Form("District"))
	strSelect = strSelect & CheckValue(District,"-district ")
EnglishAddress = SwapText(Request.Form("EnglishAddress"))
Phone		   = SwapText(Request.Form("Phone"))
Fax			   = SwapText(Request.Form("Fax"))
Email		   = SwapText(Request.Form("Email"))
Website		   = SwapText(Request.Form("Website"))
MapLocation    = SwapText(Request.Form("MapLocation"))
MapPart		   = SwapText(Request.Form("MapPart"))
MainImage	   = SwapSelect(Request.Form("MainImage"))
MainSound	   = SwapSelect(Request.Form("MainSound"))
MainMovie	   = SwapSelect(Request.Form("MainMovie"))

'Ghi file va tra ve ten file
If Request.Form("EnglishIntroduction") <> "" Then	
	EnglishIntroduction = SwapText("EL"&CStr(ID)&".txt")
Else
	EnglishIntroduction = "NULL"
End If

'Start TRANSACTION
conn.BeginTrans()
	
	'Dat co hoan thanh ban dau la true
	flagComplete = true
	
	'Xoa thong tin dac trung ve dia danh
	SQL = SQLDeleteCategoryLocation(ID,conn)		
	If SQL <> "" Then
		conn.Execute(SQL)
		Call CheckErrorVBScript(attempt)
		If CheckErrorDatabase(SQL,conn) = false Then	flagComplete = false
	End If
	
	
	'Cap nhat thong tin dia danh	
	SQL = "UPDATE Location " &_
			" SET EnglishName="&EnglishName&", YearBuilt="&YearBuilt&", CategoryID="&Category&", " &_
				"PrecinctID="&Precinct&", DistrictID="&District&", EnglishAddress="&EnglishAddress&", " &_
				"Phone="&Phone&", Fax="&Fax&", Email="&Email&", Website="&Website&", " &_
				"MapLocation="&MapLocation&", MapPart="&MapPart&", MainImageID="&MainImage&", " &_
				"MainSoundID="&MainSound&", MainMovieID="&MainMovie &_
			" WHERE ID="&ID
	conn.Execute(SQL)
	Call CheckErrorVBScript(attempt)
	If CheckErrorDatabase(SQL,conn) = false Then	flagComplete = false
	
	'Cap nhat thong tin gioi thieu ve dia danh
	SQL = "UPDATE LocationInfo " &_
			" SET EnglishIntroduction="&EnglishIntroduction &_
			" WHERE ID="&ID
	conn.Execute(SQL)
	Call CheckErrorVBScript(attempt)
	If CheckErrorDatabase(SQL,conn) = false Then	flagComplete = false
	
	SQL = ""
	Select Case Category
		'Place to stay
		Case 1
			Design	 = SwapSelect(Request.Form("Design"))
				strSelect = strSelect & CheckValue(Design,"-design ")
			Standard = SwapSelect(Request.Form("Standard"))
				strSelect = strSelect & CheckValue(Standard,"-standard ")
			MinPrice = SwapText(Request.Form("MinPrice"))
			MaxPrice = SwapText(Request.Form("MaxPrice"))
			
			SQL = " INSERT INTO PlaceToStay (CategoryID, LocationID, CategoryDesignID, Standard, MinPrice, MaxPrice)" &_
						" VALUES ("&Category&", "&ID&", "&Design&", "&Standard&", "&MinPrice&", "&MaxPrice&")"
		'Place to eat
		Case 2
			Food = SwapSelect(Request.Form("Food"))
				strSelect = strSelect & CheckValue(Food,"-food ")
			PrincipalDish = SwapText(Request.Form("PrincipalDish"))

			SQL = " INSERT INTO PlaceToEat (CategoryID, LocationID, CategoryFoodID, EnglishPrincipalDish)" &_
						" VALUES ("&Category&", "&ID&", "&Food&", "&PrincipalDish&")"
		'Place of worship
		Case 3
			Worship = SwapSelect(Request.Form("Worship"))
				strSelect = strSelect & CheckValue(Worship,"-worship ")

			SQL = " INSERT INTO PlaceOfWorship (CategoryID, LocationID, CategoryWorshipID)" &_
						" VALUES ("&Category&", "&ID&", "&Worship&")"
		'Shopping
		Case 4
			Shopping = SwapSelect(Request.Form("Shopping"))
				strSelect = strSelect & CheckValue(Shopping,"-shopping ")

			SQL = " INSERT INTO Shopping (CategoryID, LocationID, CategoryShoppingID)" &_
						" VALUES ("&Category&", "&ID&", "&Shopping&")"
		'Entertainment & relax
		Case 5
			Entertainment = SwapSelect(Request.Form("Entertainment"))
				strSelect = strSelect & CheckValue(Entertainment,"-entertainment ")
			MinPrice	  = SwapText(Request.Form("MinPrice"))
			MaxPrice	  = SwapText(Request.Form("MaxPrice"))

			SQL = " INSERT INTO Entertainment (CategoryID, LocationID, CategoryEntertainmentID, MinPrice, MaxPrice)" &_
						" VALUES ("&Category&", "&ID&", "&Entertainment&", "&MinPrice&", "&MaxPrice&")"
		'Museum
		Case 6
			MinPrice = SwapText(Request.Form("MinPrice"))
			MaxPrice = SwapText(Request.Form("MaxPrice"))

			SQL = " INSERT INTO Museum (CategoryID, LocationID, MinPrice, MaxPrice)" &_
						" VALUES ("&Category&", "&ID&", "&MinPrice&", "&MaxPrice&")"
		'Transport
		Case 7
			Transport = SwapSelect(Request.Form("Transport"))
				strSelect = strSelect & CheckValue(Transport,"-transport ")
			MinPrice  = SwapText(Request.Form("MinPrice"))
			MaxPrice  = SwapText(Request.Form("MaxPrice"))

			SQL = " INSERT INTO Transport (CategoryID, LocationID, CategoryTransportID, MinPrice, MaxPrice)" &_
						" VALUES ("&Category&", "&ID&", "&Transport&", "&MinPrice&", "&MaxPrice&")"
		'Medical service
		Case 8
			MedicalService = SwapSelect(Request.Form("MedicalService"))
				strSelect = strSelect & CheckValue(MedicalService,"-medical service ")

			SQL = " INSERT INTO MedicalService (CategoryID, LocationID, CategoryMedicalServiceID)" &_
						" VALUES ("&Category&", "&ID&", "&MedicalService&")"
		'Book
		Case 9
			Book = SwapSelect(Request.Form("Book"))
				strSelect = strSelect & CheckValue(Book,"-book is stored ")

			SQL = " INSERT INTO Book (CategoryID, LocationID, CategoryBookID)" &_
						" VALUES ("&Category&", "&ID&", "&Book&")"
		'VisaExtension
		Case 10
		'Bank
		Case 11
		'Communication
		Case 12
			Communication = SwapSelect(Request.Form("Communication"))
				strSelect = strSelect & CheckValue(Communication,"-communication ")

			SQL = " INSERT INTO Communication (CategoryID, LocationID, CategoryCommunicationID)" &_
						" VALUES ("&Category&", "&ID&", "&Communication&")"
		'Booking-office
		Case 13
			BookingOffice = SwapSelect(Request.Form("BookingOffice"))
				strSelect = strSelect & CheckValue(BookingOffice,"-booking office ")

			SQL = " INSERT INTO BookingOffice (CategoryID, LocationID, CategoryBookingOfficeID)" &_
						" VALUES ("&Category&", "&ID&", "&BookingOffice&")"
		'Travel agency
		Case 14
			Inbound  = SwapCheckbox(Request.Form("Inbound"))
			Outbound = SwapCheckbox(Request.Form("Outbound"))
			Trekking = SwapCheckbox(Request.Form("Trekking"))
			MotorbikingTour = SwapCheckbox(Request.Form("MotorbikingTour"))

			SQL = " INSERT INTO TravelAgency (CategoryID, LocationID, Inbound, Outbound, Trekking, MotorbikingTour)" &_
						" VALUES ("&Category&", "&ID&", "&Inbound&", "&Outbound&", "&Trekking&", "&MotorbikingTour&")"
		'Others
		Case 15
	End Select
	If SQL <> "" Then
		conn.Execute(SQL)
		Call CheckErrorVBScript(attempt)
		If CheckErrorDatabase(SQL,conn) = false Then	flagComplete = false
	End If

'End TRANSACTION
If (flagComplete = true AND strText = "" AND strSelect = "")Then
	conn.CommitTrans()
	Call WriteFile("EL"&CStr(ID), Request.Form("EnglishIntroduction"))
	Response.Redirect "DetailLocation.asp?ID="&ID
'	<script language="javascript">
'		document.location = "DetailLocation.asp?ID=<%=ID"
'	</script>

Else
	conn.RollbackTrans()
	If strText <> "" Then   str = "You must enter : " & strText
	If strSelect <> "" Then	str = str & "You must choose : " & strSelect
End If

'Dong ket noi server
conn.Close
Set conn = nothing

%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Update Location</title>
</head>

<body>

</body>

</html>
