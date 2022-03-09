<%response.buffer=true%>

<!--#INCLUDE FILE="LibErrors.asp"-->
<!--#INCLUDE FILE="LibJavascript.asp"-->

<%
on error resume next
attempt = "Create connection object" 'thong bao ve loi kiem tra

'Mo ket noi server
'ConnectionString = Session("cnString")
ConnectionString = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("Data/Travel.mdb")
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open ConnectionString
Call CheckErrorVBScript(attempt)

'Lay ID cua dia danh, quyen truy cap du lieu hay nhan thong tin
ID = Request.QueryString("ID")
flagAccess = Request.QueryString("flagAccess")'= 1 : nhan thong tin goc tu server
											  '= 0 : nhan du lieu tu form goi den
flagEdit = Request.QueryString("flagEdit")'=Update : cap nhat du lieu ve dia danh
										  '=Add    : them dia danh moi
										  
If flagAccess = 1 Then
	If flagEdit = "Update" Then 'sua chua hay xoa thong tin dia danh
		'Lay thong tin chung cua form	
		SQL = "SELECT * FROM Location WHERE ID=" & ID
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		Call CheckErrorVBScript(attempt)
		Call CheckErrorDatabase(SQL,conn)

		EnglishName	   = rs("EnglishName")
		YearBuilt	   = rs("YearBuilt")
		Category	   = rs("CategoryID")'Id Category
		Precinct	   = rs("PrecinctID")
		District       = rs("DistrictID")
		EnglishAddress = rs("EnglishAddress")
		Phone		   = rs("Phone")
		Fax			   = rs("Fax")
		Email		   = rs("Email")
		Website		   = rs("Website")
		MapPart		   = rs("MapPart")	
		MapLocation    = rs("MapLocation")
		MainImage	   = rs("MainImageID")
		MainSound	   = rs("MainSoundID")
		MainMovie	   = rs("MainMovieID")

		rs.Close
		Set rs = nothing

		'Lay cac thong tin khac
		SQL = "SELECT * FROM LocationInfo WHERE ID=" & ID
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		Call CheckErrorVBScript(attempt)
		Call CheckErrorDatabase(SQL,conn)

		'Doc file thong tin gioi thieu cua dia danh
		EnglishIntroduction = ReadFile(rs("EnglishIntroduction"),1)

		rs.Close
		Set rs = nothing

		Select Case Category
			'Place to stay
			Case 1
				SQL = "SELECT * FROM PlaceToStay WHERE LocationID=" & ID
				Set rs = Server.CreateObject("ADODB.Recordset")
				rs.Open SQL, conn
				'Call CheckErrorVBScript(attempt)
				Call CheckErrorDatabase(SQL,conn)
			
				If Not rs.BOF Then
					Design	 = rs("CategoryDesignID")
					Standard = rs("Standard")
					MinPrice = rs("MinPrice")
					MaxPrice = rs("MaxPrice")
				Else
					Response.Write "Don't access database!!!"
				End If
				rs.Close
				Set rs = nothing
			'Place to eat
			Case 2
				SQL = "SELECT * FROM PlaceToEat WHERE LocationID=" & ID
				Set rs = Server.CreateObject("ADODB.Recordset")
				rs.Open SQL, conn
				'Call CheckErrorVBScript(attempt)
				Call CheckErrorDatabase(SQL,conn)
		
				If Not rs.BOF Then
					Food = rs("CategoryFoodID")
					PrincipalDish = rs("EnglishPrincipalDish") 
				Else
					Response.Write "Don't access database!!!"
				End If
				rs.Close
				Set rs = nothing
			'Place of worship
			Case 3
				SQL = "SELECT * FROM PlaceOfWorship WHERE LocationID=" & ID
				Set rs = Server.CreateObject("ADODB.Recordset")
				rs.Open SQL, conn
				'Call CheckErrorVBScript(attempt)
				Call CheckErrorDatabase(SQL,conn)
			
				If Not rs.BOF Then
					Worship = rs("CategoryWorshipID")
				Else
					Response.Write "Don't access database!!!"
				End If
				rs.Close
				Set rs = nothing
			'Shopping
			Case 4
				SQL = "SELECT * FROM Shopping WHERE LocationID=" & ID
				Set rs = Server.CreateObject("ADODB.Recordset")
				rs.Open SQL, conn
				'Call CheckErrorVBScript(attempt)
				Call CheckErrorDatabase(SQL,conn)
			
				If Not rs.BOF Then
					Shopping = rs("CategoryShoppingID")
				Else
					Response.Write "Don't access database!!!"
				End If
				rs.Close
				Set rs = nothing
			'Entertainment & relax
			Case 5
				SQL = "SELECT * FROM Entertainment WHERE LocationID=" & ID
				Set rs = Server.CreateObject("ADODB.Recordset")
				rs.Open SQL, conn
				'Call CheckErrorVBScript(attempt)
				Call CheckErrorDatabase(SQL,conn)
			
				If Not rs.BOF Then
					Entertainment = rs("CategoryEntertainmentID")
					MinPrice	  = rs("MinPrice")
					MaxPrice	  = rs("MaxPrice")
				Else
					Response.Write "Don't access database!!!"
				End If
				rs.Close
				Set rs = nothing
			'Museum
			Case 6
				SQL = "SELECT * FROM Museum WHERE LocationID=" & ID
				Set rs = Server.CreateObject("ADODB.Recordset")
				rs.Open SQL, conn
				'Call CheckErrorVBScript(attempt)
				Call CheckErrorDatabase(SQL,conn)
			
				If Not rs.BOF Then
					MinPrice = rs("MinPrice")
					MaxPrice = rs("MaxPrice")
				Else
					Response.Write "Don't access database!!!"
				End If
				rs.Close
				Set rs = nothing
			'Transport
			Case 7
				SQL = "SELECT * FROM Transport WHERE LocationID=" & ID
				Set rs = Server.CreateObject("ADODB.Recordset")
				rs.Open SQL, conn
				'Call CheckErrorVBScript(attempt)
				Call CheckErrorDatabase(SQL,conn)
			
				If Not rs.BOF Then
					Transport = rs("CategoryTransportID")
					MinPrice  = rs("MinPrice")
					MaxPrice  = rs("MaxPrice")
				Else
					Response.Write "Don't access database!!!"
				End If
				rs.Close
				Set rs = nothing
			'Medical service
			Case 8
				SQL = "SELECT * FROM MedicalService WHERE LocationID=" & ID
				Set rs = Server.CreateObject("ADODB.Recordset")
				rs.Open SQL, conn
				'Call CheckErrorVBScript(attempt)
				Call CheckErrorDatabase(SQL,conn)
			
				If Not rs.BOF Then
					MedicalService = rs("CategoryMedicalServiceID")
				Else
					Response.Write "Don't access database!!!"
				End If
				rs.Close
				Set rs = nothing
			'Book
			Case 9
				SQL = "SELECT * FROM Book WHERE LocationID=" & ID
				Set rs = Server.CreateObject("ADODB.Recordset")
				rs.Open SQL, conn
				'Call CheckErrorVBScript(attempt)
				Call CheckErrorDatabase(SQL,conn)
			
				If Not rs.BOF Then
					Book = rs("CategoryBookID")
				Else
					Response.Write "Don't access database!!!"
				End If
				rs.Close
				Set rs = nothing
			'VisaExtension
			Case 10
			'Bank
			Case 11
			'Communication
			Case 12
				SQL = "SELECT * FROM Communication WHERE LocationID=" & ID
				Set rs = Server.CreateObject("ADODB.Recordset")
				rs.Open SQL, conn
				'Call CheckErrorVBScript(attempt)
				Call CheckErrorDatabase(SQL,conn)
			
				If Not rs.BOF Then
					Communication = rs("CategoryCommunicationID")
				Else
					Response.Write "Don't access database!!!"
				End If
				rs.Close
				Set rs = nothing
			'Booking-office
			Case 13
				SQL = "SELECT * FROM BookingOffice WHERE LocationID=" & ID
				Set rs = Server.CreateObject("ADODB.Recordset")
				rs.Open SQL, conn
				'Call CheckErrorVBScript(attempt)
				Call CheckErrorDatabase(SQL,conn)
			
				If Not rs.BOF Then
					BookingOffice = rs("CategoryBookingOfficeID")
				Else
					Response.Write "Don't access database!!!"
				End If
				rs.Close
				Set rs = nothing
			'Travel agency
			Case 14
				SQL = "SELECT * FROM TravelAgency WHERE LocationID=" & ID
				Set rs = Server.CreateObject("ADODB.Recordset")
				rs.Open SQL, conn
				'Call CheckErrorVBScript(attempt)
				Call CheckErrorDatabase(SQL,conn)
			
				If Not rs.BOF Then
					If rs("Inbound") = true Then	Inbound = 1
					If rs("Outbound") = true Then	Outbound = 1
					If rs("Trekking") = true Then	Trekking = 1
					If rs("MotorbikingTour") = true Then	MotorbikingTour = 1
				Else
					Response.Write "Don't access database!!!"
				End If
				rs.Close
				Set rs = nothing
			'Others
			Case 15
			Case Else
				Response.Write "Don't access database!!!"
		End Select
			
	Else'flagEdit=Add
		Category = 1'Id Category
		District = 1
		Standard = 0
End If
	
Else'flagAccess = 0
	EnglishName	   = Request.Form("EnglishName")
	YearBuilt	   = Request.Form("YearBuilt")
	Category	   = Request.Form("Category")
	Precinct	   = Request.Form("Precinct")
	District       = Request.Form("District")
	EnglishAddress = Request.Form("EnglishAddress")
	Phone		   = Request.Form("Phone")
	Fax			   = Request.Form("Fax")
	Email		   = Request.Form("Email")
	Website		   = Request.Form("Website")
	MapPart	       = Request.Form("MapPart")
	MapLocation    = Request.Form("MapLocation")
	MainImage	   = Request.Form("MainImage")
	MainSound	   = Request.Form("MainSound")
	MainMovie	   = Request.Form("MainMovie")

	EnglishIntroduction = Request.Form("EnglishIntroduction")

	Select Case Category
		'Place to stay
		Case 1
			Design	 = Request.Form("Design")
			Standard = Request.Form("Standard")
			MinPrice = Request.Form("MinPrice")
			MaxPrice = Request.Form("MaxPrice")
		'Place to eat
		Case 2
			Food = Request.Form("Food")
			PrincipalDish = Request.Form("PrincipalDish") 
		'Place of worship
		Case 3
			Worship = Request.Form("Worship")
		'Shopping
		Case 4
			Shopping = Request.Form("Shopping")
		'Entertainment & relax
		Case 5
			Entertainment = Request.Form("Entertainment")
			MinPrice	  = Request.Form("MinPrice")
			MaxPrice	  = Request.Form("MaxPrice")
		'Museum
		Case 6
			MinPrice = Request.Form("MinPrice")
			MaxPrice = Request.Form("MaxPrice")
		'Transport
		Case 7
			Transport = Request.Form("Transport")
			MinPrice  = Request.Form("MinPrice")
			MaxPrice  = Request.Form("MaxPrice")
		'Medical service
		Case 8
			MedicalService = Request.Form("MedicalService")
		'Book
		Case 9
			Book = Request.Form("Book")
		'VisaExtension
		Case 10
		'Bank
		Case 11
		'Communication
		Case 12
			Communication = Request.Form("Communication")
		'Booking-office
		Case 13
			BookingOffice = Request.Form("BookingOffice")
		'Travel agency
		Case 14
			Inbound  = Request.Form("Inbound")
			Outbound = Request.Form("Outbound")
			Trekking = Request.Form("Trekking")
			MotorbikingTour = Request.Form("MotorbikingTour")
		'Others
		Case 15
		Case Else
			Response.Write "Don't access database!!!"
	End Select

End If 

%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Form Edit 1</title>
<link rel="stylesheet" type="text/css" href="webnews.css">

<script language=JavaScript>
//Search Precinct
	function SearchPrecinct(ID,flagEdit){
		document.FormEdit1.action = "FormEdit1.asp?ID=" + ID + "&flagAccess=0&flagEdit=" + flagEdit
		document.FormEdit1.submit()
	}
//Next
	function FormNext(ID,flagEdit){
		document.FormEdit1.action = "FormEdit2.asp?ID=" + ID + "&flagEdit=" + flagEdit
	}
//Edit Map : . ID : ma dia danh
//			 . flagEdit : .Update : thay doi thong tin
//						  .Add    : them moi thong tin
	function EditMap(ID,flagEdit){
		document.FormEdit1.action = "MapAsp/EditMap.asp?iidd=" + ID + "&flagedit=" + flagEdit + "&idx=search"
		document.FormEdit1.target = "_top"
	}
</script>
	
</head>

<body background="IMAGES/Bgr2.jpg" bgproperties="fixed">

<!--#include file="GeneralInformation.asp"-->
<form name="FormEdit1" method="POST">
<center>
<table border="1" width="600" class=cssTableLayout cellspacing=0 cellpadding=2 bgColor="#eeeeee" bordercolor="#EEEEEE">
	<tr height=25>
		<td colspan="4" width="600" class=cssTDHeader align=center>Information site</td></tr>
	<tr><td width="600" colspan="4" align="center" class=cssTDText>Step 1 of 3<p></td></tr>
    <tr><td width="28%" valign="top" class=cssTDTextLabel align=right>Name&nbsp;</td>
        <td width="70%" colspan="3" valign="top"><input type="text" name="EnglishName" size="40" class=cssInputText value="<%=EnglishName%>"></td></tr>
    <tr><td width="28%" valign="top" class=cssTDTextLabel align=right>Category&nbsp;</td>
        <td width="49%" valign="top"><select size="1" name="Category" class=cssInputText onChange="document.FormEdit1.tpCategory.value=document.FormEdit1.Category(document.FormEdit1.Category.selectedIndex).value"><%Call ListCategory(Category,conn,1)%></select></td></tr>
    <tr><td width="28%" valign="top" class=cssTDTextLabel align=right>Opening year&nbsp;</td>
        <td width="30%" valign="top"><input type="text" name="YearBuilt" size="5" class=cssInputText value="<%=YearBuilt%>"></td></tr>
    <tr><td width="28%" valign="top" class=cssTDTextLabel align=right>District&nbsp;</td>
        <td width="44%" valign="top"><select size="1" name="District" class=cssInputText onChange=SearchPrecinct(<%=ID%>,"<%=flagEdit%>")><%Call ListDistrict(District,conn,1)%></select></td>
        <td width="25%" valign="top" class=cssTDTextLabel align=right>Precinct&nbsp;</td>
        <td width="33%" valign="top"><select size="1" name="Precinct" class=cssInputText><%Call ListPrecinct(Precinct,District,conn)%></select></td></tr>
    <tr><td width="28%" valign="top" class=cssTDTextLabel align=right>Address&nbsp;</td>
        <td width="81%" colspan="3" valign="top"><input type="text" name="EnglishAddress" size="50" class=cssInputText value="<%=EnglishAddress%>"></td></tr>
    <tr><td width="28%" valign="top" class=cssTDTextLabel align=right>Tel&nbsp;</td>
        <td width="49%" valign="top"><input type="text" name="Phone" size="15" class=cssInputText value="<%=Phone%>"></td>
        <td width="25%" valign="top" class=cssTDTextLabel align=right>Fax&nbsp;</td>
        <td width="28%" valign="top"><input type="text" name="Fax" size="15" class=cssInputText value="<%=Fax%>"></td></tr>
    <tr><td width="28%" valign="top" class=cssTDTextLabel align=right>Email&nbsp;</td>
        <td width="49%" valign="top"><input type="text" name="Email" size="25" class=cssInputText value="<%=Email%>"></td>
        <td width="25%" valign="top" class=cssTDTextLabel align=right>Website&nbsp;</td>
        <td width="28%" valign="top"><input type="text" name="Website" size="25" class=cssInputText value="<%=Website%>"></td></tr>
    <tr><td width="28%" valign="top" class=cssTDTextLabel align=right>Map Location&nbsp;</td>
        <td width="45%" valign="top"><input type="text" name="MapLocation" size="20" class=cssInputText value="<%=MapLocation%>">
        <td width="25%" valign="top" class=cssTDTextLabel align=right>Map Part&nbsp;</td>
        <td width="28%" valign="top"><input type="text" name="MapPart" size="10" class=cssInputText value="<%=MapPart%>">
        <input type="submit" value="Get" id=Map name=Map onClick='EditMap(<%=ID%>,"<%=flagEdit%>")'></td></tr>
    <tr><td width="28%" valign="top" class=cssTDTextLabel align=right>Main Image&nbsp;</td>
        <td width="82%" colspan="3" valign="top"><select size="1" name="MainImage" class=cssInputText><%Call ListImage(ID,MainImage,conn)%></select>
        <input type="submit" value=Get id=Images name=Images onClick="document.FormEdit1.action = 'FormEditIMS.asp?ID=<%=ID%>&flagEdit=<%=flagEdit%>'"></td></tr>
    <tr><td width="28%" valign="top" class=cssTDTextLabel align=right>Main Sound&nbsp;</td>
        <td width="72%" colspan="3" valign="top"><select size="1" name="MainSound" class=cssInputText><%Call ListSound(ID,MainSound,conn)%></select>
        <input type="submit" value="Get" id=Sounds name=Sounds></td></tr>
    <!--
    <tr><td width="28%" valign="top" class=cssTDTextLabel align=right>Main Movie&nbsp;</td>
        <td width="72%" colspan="3" valign="top"><select size="1" name="MainMovie" class=cssInputText><%Call ListMovie(ID,MainMovie,conn)%></select>
        <input type="submit" value="Browser" id=Movies name=Movies></td></tr>-->
</table>

  <!--Cac thong tin an cua mot dia danh-->
    <input type="hidden" name="tpCategory" value="<%=Category%>">
    
    <input type="hidden" name="EnglishIntroduction" value="<%=EnglishIntroduction%>">
        
    <input type="hidden" name="Design"   value="<%=Design%>">
    <input type="hidden" name="Standard" value="<%=Standard%>">
    <input type="hidden" name="MinPrice" value="<%=MinPrice%>">
    <input type="hidden" name="MaxPrice" value="<%=MaxPrice%>">
    <input type="hidden" name="Food" value="<%=Food%>">
    <input type="hidden" name="PrincipalDish" value="<%=PrincipalDish%>">
    <input type="hidden" name="Worship" value="<%=Worship%>">
    <input type="hidden" name="Shopping" value="<%=Shopping%>">
	<input type="hidden" name="Entertainment" value="<%=Entertainment%>">		
	<input type="hidden" name="Transport" value="<%=Transport%>">		
	<input type="hidden" name="MedicalService" value="<%=MedicalService%>">		
	<input type="hidden" name="Book" value="<%=Book%>">		
	<input type="hidden" name="Communication" value="<%=Communication%>">		
	<input type="hidden" name="BookingOffice" value="<%=BookingOffice%>">		
	<input type="hidden" name="Inbound" value="<%=Inbound%>">		
	<input type="hidden" name="Outbound" value="<%=Outbound%>">		
	<input type="hidden" name="Trekking" value="<%=Trekking%>">		
	<input type="hidden" name="MotorbikingTour" value="<%=MotorbikingTour%>">		
    
<!--Cac nut lenh thi hanh-->
<p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
   <tr>
     <td width="10%"><input type="submit" value="Next"   name="Next"   onClick='FormNext(<%=ID%>,"<%=flagEdit%>")'></td>
     <td width="80%"></td>
	<%If flagEdit = "Add" Then%>
     <td width="10%"><input type="submit" value="Add"    name="Add"    onClick='FinishEdit(this.form,<%=ID%>,"AddNewLocation.asp")'></td>
    <%Else%>
     <td width="10%"><input type="submit" value="Delete" name="Delete" onClick='DeleteLocation(this.form,<%=ID%>,"DeleteLocation.asp"); return false;'></td>
     <td width="10%"><input type="submit" value="Update" name="Update" onClick='FinishEdit(this.form,<%=ID%>,"UpdateLocation.asp")'></td>
	<%End If%>
     <td width="10%"><input type="button" value="Cancel" name="Cancel" onClick='CancelEditLocation(this.form,"<%=flagEdit%>")'></td>
   </tr>
</table>
</center>
</form>
<%
conn.Close
Set conn = nothing
%>

</body>

</html>
