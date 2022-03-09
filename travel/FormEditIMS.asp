<!--#INCLUDE FILE="LibErrors.asp"-->
<!--#INCLUDE FILE="GeneralInformation.asp"-->

<%
'Ngon ngu hien thi
language = Session("Language")

on error resume next
attempt = "Create connection object" 'thong bao ve loi kiem tra

'Mo ket noi server
'ConnectionString = Session("cnString")
ConnectionString = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("Data/Travel.mdb")
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open ConnectionString
Call CheckErrorVBScript(attempt)

ID = Request.QueryString("ID")
flagEdit = Request.QueryString("flagEdit")
flag = Request.QueryString("flag")
IMS  = Request.QueryString("IMS")

MainImage = Request.Form("MainImage")
	If MainImage = "" Then	MainImage = 0
Image = Request.Form("ListImage")
	If Image = "" Then	Image = 0
	
MainSound = Request.Form("MainSound")
	If MainSound = "" Then	MainSound = 0
Sound = Request.Form("ListSound")
	If Sound = "" Then	Sound = 0

Select Case flag
	Case "Add"
		Select Case IMS
			Case "I"
				Call AddImage(ID, Image, conn)
			Case "S"
				Call AddSound(ID, Sound, conn)
		End Select			
	Case "Del"
		Select Case IMS
			Case "I"
				Call DelImage(ID, MainImage, conn)
				MainImage = 0
			Case "S"
				Call DelSound(ID, MainSound, conn)
				MainSound = 0
		End Select			
End Select

If MainImage <> 0 Then
	SQL = "SELECT Path FROM Images WHERE ID=" & MainImage
	
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL, conn
	Call CheckErrorVBScript(attempt)
	Call CheckErrorDatabase(SQL,conn)
	If Not rs.BOF Then
		PathImage2 = rs("Path")
	Else 
		PathImage2 = ""
	End If
Else
	PathImage2 = ""
End If

If Image <> 0 Then
	SQL = "SELECT Path FROM Images WHERE ID=" & Image
	
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL, conn
	Call CheckErrorVBScript(attempt)
	Call CheckErrorDatabase(SQL,conn)
	If Not rs.BOF Then
		PathImage1 = rs("Path")
	Else 
		PathImage1 = ""
	End If
Else
	PathImage1 = ""
End If

If MainSound <> 0 Then
	SQL = "SELECT Path FROM Sounds WHERE ID=" & MainSound
	
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL, conn
	Call CheckErrorVBScript(attempt)
	Call CheckErrorDatabase(SQL,conn)
	If Not rs.BOF Then
		PathSound = rs("Path")
	Else 
		PathSound = ""
	End If
Else
	PathSound = ""
End If

rs.Close
Set rs = nothing
%>

<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" type="text/css" href="webnews.css">
<title>Form Edit Image Movie Sound</title>

<script language="JavaScript">
	function DisplayImage(ID,flagEdit){
	//	document.images("Img1").src = document.FormEditIMS.li
		document.FormEditIMS.action = "FormEditIMS.asp?ID=" + ID + "&flagEdit=" + flagEdit
		document.FormEditIMS.submit()
	}
	function DisplayForm(ID,flagEdit,flag,IMS){
		document.FormEditIMS.action = "FormEditIMS.asp?ID=" + ID + "&flagEdit=" + flagEdit + "&flag=" + flag + "&IMS=" + IMS
	}
	function FormBack(ID,flagEdit){
		document.FormEditIMS.action = "FormEdit1.asp?ID=" + ID + "&flagEdit=" + flagEdit
	}
</script>

<bgsound src="<%=PathSound%>" loop="-1">

</head>

<body background="IMAGES/Bgr2.jpg" bgproperties="fixed">

<form name="FormEditIMS" method="POST">
<center>
  <table border="1" width="72%%" class=cssTableLayout cellspacing=0 cellpadding=2 bgColor="#eeeeee" bordercolor="#EEEEEE">
	<tr height=25>
	  <td colspan="6" width="100%" class=cssTDHeader align=center>Images</td></tr>
  <!--<table border="0" width="72%" bordercolorlight="#000000" bordercolordark="#000000" bordercolor="#000000" cellspacing="0" cellpadding="0">
  <caption><h2 align="center">Image</h2></caption>
    <tr>-->
    <tr>
      <td width="20%"><select size=5 name="ListImage" class=cssInputText onChange='DisplayImage(<%=ID%>,"<%=flagEdit%>")'><%Call ListImage("",Image,conn)%></select></td>
      <td width="20%"><img name="Img1" width=100 height=100 src='<%=PathImage1%>'></td>
      <td width="10%">
        <p align="center"><input type="submit" value="&gt;&gt;" name="Add" onClick='DisplayForm(<%=ID%>,"<%=flagEdit%>","Add","I")'>
        <p align="center"><input type="submit" value="&lt;&lt;" name="Del" onClick='DisplayForm(<%=ID%>,"<%=flagEdit%>","Del","I")'></td>
      <td width="20%"><select size=5 name="MainImage" class=cssInputText onChange='DisplayImage(<%=ID%>,"<%=flagEdit%>")'><%Call ListImage(ID,MainImage,conn)%></select>
      <td width="20%"><img name="Img2" width=100 height=100 src='<%=PathImage2%>'></td>
    </tr>
  </table>
  <p>
  <table border="1" width="72%%" class=cssTableLayout cellspacing=0 cellpadding=2 bgColor="#eeeeee" bordercolor="#EEEEEE">
	<tr height=25>
	  <td colspan="6" width="100%" class=cssTDHeader align=center>Sounds</td></tr>
    <tr>
      <td width="20%"><select size=5 name="ListSound" class=cssInputText><%Call ListSound("",Sound,conn)%></select></td>
      <td width="10%">
        <p align="center"><input type="submit" value="&gt;&gt;" name="Add" onClick='DisplayForm(<%=ID%>,"<%=flagEdit%>","Add","S")'>
        <p align="center"><input type="submit" value="&lt;&lt;" name="Del" onClick='DisplayForm(<%=ID%>,"<%=flagEdit%>","Del","S")'></td>
      <td width="20%"><select size=5 name="MainSound" class=cssInputText onChange='DisplayForm(<%=ID%>,"<%=flagEdit%>","","")'><%Call ListSound(ID,MainSound,conn)%></select>
    </tr>
  </table>
  
    <!--Cac thong tin an cua mot dia danh-->
    <input type="hidden" name="EnglishName"    value="<%=Request.Form("EnglishName")%>">
    <input type="hidden" name="Category"       value="<%=Request.Form("Category")%>">
    <input type="hidden" name="YearBuilt"      value="<%=Request.Form("YearBuilt")%>">
    <input type="hidden" name="Precinct"       value="<%=Request.Form("Precinct")%>">
    <input type="hidden" name="District"       value="<%=Request.Form("District")%>">
    <input type="hidden" name="EnglishAddress" value="<%=Request.Form("EnglishAddress")%>">
    <input type="hidden" name="Phone"          value="<%=Request.Form("Phone")%>">
    <input type="hidden" name="Fax"            value="<%=Request.Form("Fax")%>">
    <input type="hidden" name="Email"          value="<%=Request.Form("Email")%>">
    <input type="hidden" name="Website"        value="<%=Request.Form("Website")%>">
    <input type="hidden" name="MapLocation"    value="<%=Request.Form("MapLocation")%>">
    <input type="hidden" name="MapPart"		   value="<%=Request.Form("MapPart")%>">

    <input type="hidden" name="EnglishIntroduction" value="<%=EnglishIntroduction%>">
	
	<%Select Case Request.Form("Category")
		'Place to stay
		Case 1%>
    <input type="hidden" name="Design"   value="<%=Request.Form("Design")%>">
    <input type="hidden" name="Standard" value="<%=Request.Form("Standard")%>">
    <input type="hidden" name="MinPrice" value="<%=Request.Form("MinPrice")%>">
    <input type="hidden" name="MaxPrice" value="<%=Request.Form("MaxPrice")%>">
   		<%'Place to eat
		Case 2%>
    <input type="hidden" name="Food" value="<%=Request.Form("Food")%>">
    <input type="hidden" name="PrincipalDish" value="<%=Request.Form("PrincipalDish")%>">
		<%'Place of worship
		Case 3%>
    <input type="hidden" name="Worship" value="<%=Request.Form("Worship")%>">
		<%'Shopping
		Case 4%>
    <input type="hidden" name="Shopping" value="<%=Request.Form("Shopping")%>">
		<%'Entertainment & relax
		Case 5%>
	<input type="hidden" name="Entertainment" value="<%=Request.Form("Entertainment")%>">		
	<input type="hidden" name="MinPrice" value="<%=Request.Form("MinPrice")%>">		
	<input type="hidden" name="MaxPrice" value="<%=Request.Form("MaxPrice")%>">		
		<%'Museum
		Case 6%>
	<input type="hidden" name="MinPrice" value="<%=Request.Form("MinPrice")%>">		
	<input type="hidden" name="MaxPrice" value="<%=Request.Form("MaxPrice")%>">		
		<%'Transport
		Case 7%>
	<input type="hidden" name="Transport" value="<%=Request.Form("Transport")%>">		
	<input type="hidden" name="MinPrice"  value="<%=Request.Form("MinPrice")%>">		
	<input type="hidden" name="MaxPrice"  value="<%=Request.Form("MaxPrice")%>">		
		<%'Medical service
		Case 8%>
	<input type="hidden" name="MedicalService" value="<%=Request.Form("MedicalService")%>">		
		<%'Book
		Case 9%>
	<input type="hidden" name="Book" value="<%=Request.Form("Book")%>">		
		<%'VisaExtension
		Case 10%>
		<%'Bank
		Case 11%>
		<%'Communication
		Case 12%>
	<input type="hidden" name="Communication" value="<%=Request.Form("Communication")%>">		
		<%'Booking-office
		Case 13%>
	<input type="hidden" name="BookingOffice" value="<%=Request.Form("BookingOffice")%>">		
		<%'Travel agency
		Case 14%>
	<input type="hidden" name="Inbound"  value="<%=Request.Form("Inbound")%>">		
	<input type="hidden" name="Outbound" value="<%=Request.Form("Outbound")%>">		
	<input type="hidden" name="Trekking" value="<%=Request.Form("Trekking")%>">		
	<input type="hidden" name="MotorbikingTour" value="<%=Request.Form("MotorbikingTour")%>">		
		<%'Others
		Case 15
    End Select%>
    <!--Ket thuc-->

  <p align="center"><input type="submit" value="OK" name="OK" onClick='FormBack(<%=ID%>,"<%=flagEdit%>")'></p>
</center>
</form>

<%
conn.Close
Set conn = nothing
%>

</body>
