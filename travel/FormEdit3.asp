<%response.buffer=true%>

<!--#INCLUDE FILE="LibErrors.asp"-->
<!--#INCLUDE FILE="GeneralInformation.asp"-->
<!--#INCLUDE FILE="LibJavascript.asp"-->

<%
on error resume next
attempt = "Create connecttion object"

'Mo ket noi server
'ConnectionString = Session("cnString")
ConnectionString = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("Data/Travel.mdb")
Set conn = server.CreateObject("ADODB.Connection")
conn.Open ConnectionString
Call CheckErrorVBScript(attempt)

'Lay kieu cap nhat du lieu : update, add, delete
flagEdit = Request.QueryString("flagEdit")

'Lay ID dia danh
ID = Request.QueryString("ID")

%>

<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Form Edit 3</title>
<link rel="stylesheet" type="text/css" href="webnews.css">

<script language=JavaScript>
//Back
	function FormBack(ID,flagEdit){
		document.FormEdit3.action = "FormEdit2.asp?ID=" + ID + "&flagEdit=" + flagEdit
	}
</script>

</head>

<body background="IMAGES/Bgr2.jpg" bgproperties="fixed">

<font><center>
<form name="FormEdit3" method="POST">
<center>
<table border="1" width="600" class=cssTableLayout cellspacing=0 cellpadding=2 bgColor="#eeeeee" bordercolor="#EEEEEE">
	<tr height=25>
		<td colspan="2" width="600" class=cssTDHeader align=center>The characteristic of site</td></tr>
	<tr><td width="600" colspan="2" align="center" class=cssTDText>Step 3 of 3<p></td></tr>
<%Select Case Request.Form("Category")
		'Hotel
	Case 1%>
    <tr>
      <td width="40%" valign="top" class=cssTDTextLabel align=right>Design&nbsp;</td>
      <td width="60%" valign="top"><select size="1" name="Design" class=cssInputText><%Call ListDesign(Request.Form("Design"), conn)%></select></td></tr>
    <tr>
      <td width="40%" valign="top" class=cssTDTextLabel align=right>Standard&nbsp;</td>
      <td width="60%" valign="top"><select size="1" name="Standard" class=cssInputText><%Call ListStandard(Request.Form("Standard"))%></select></td></tr>
    <tr>
      <td width="40%" valign="top" class=cssTDTextLabel align=right>Rates&nbsp;</td>
      <td width="60%" valign="top"><input type="text" name="MinPrice" size="5" class=cssInputText value="<%=Request.Form("MinPrice")%>"> -&gt; <input type="text" name="MaxPrice" size="5" class=cssInputText value="<%=Request.Form("MaxPrice")%>"> USD</td></tr>
	<%
	'Form tim kiem Places to eat
	Case 2%>
    <tr>
      <td width="40%" valign="top" class=cssTDTextLabel align=right>Food&nbsp;</td>
      <td width="60%" valign="top"><select size="1" name="Food" class=cssInputText><%Call ListFood(Request.Form("Food"),conn)%></select></td></tr>
    <tr>
        <td width="40%" valign="top" class=cssTDTextLabel align=right>Principal dish&nbsp;</td>
        <td width="60%" valign="top"><input type="text" name="PrincipalDish" size="25" class=cssInputText value="<%=Request.Form("PrincipalDish")%>"></td></tr>
	<%
	'Form tim kiem Worship
	Case 3%>
    <tr>
      <td width="40%" valign="top" class=cssTDTextLabel align=right>Worship&nbsp;</td>
      <td width="60%" valign="top"><select size="1" name="Worship" class=cssInputText><%Call ListWorship(Request.Form("Worship"),conn)%></select></td></tr>
    <%
    'Form tim kiem Shopping
    Case 4%>
    <tr>
      <td width="40%" valign="top" class=cssTDTextLabel align=right>Shopping&nbsp;</td>
      <td width="60%" valign="top"><select size="1" name="Shopping" class=cssInputText><%Call ListShopping(Request.Form("Shopping"),conn)%></select></td></tr>
    <%
    'Form tim kiem Entertainment & relax
    Case 5%>
    <tr>
      <td width="40%" valign="top" class=cssTDTextLabel align=right>Entertainment&nbsp;</td>
      <td width="60%" valign="top"><select size="1" name="Entertainment" class=cssInputText><%Call ListEntertainment(Request.Form("Entertainment"),conn)%></select></td></tr>
    <tr>
      <td width="40%" valign="top" class=cssTDTextLabel align=right>Price range&nbsp;</td>
      <td width="65%" colspan="3" valign="top"><input type="text" name="MinPrice" size="8" class=cssInputText value="<%=Request.Form("MinPrice")%>"> -&gt; <input type="text" name="MaxPrice" size="8" class=cssInputText value="<%=Request.Form("MaxPrice")%>"> USD</td></tr>	
    <%
    'Form tim kiem Museum
    Case 6%>
    <tr>
      <td width="40%" valign="top" class=cssTDTextLabel align=right>Admission range&nbsp;</td>
      <td width="60%" colspan="3" valign="top"><input type="text" name="MinPrice" size="8" class=cssInputText value="<%=Request.Form("MinPrice")%>"> -&gt; <input type="text" name="MaxPrice" size="8" class=cssInputText value="<%=Request.Form("MaxPrice")%>"> USD</td></tr>	
    <%
    'Form tim kiem Transport
    Case 7%>
    <tr>
      <td width="40%" valign="top" class=cssTDTextLabel align=right>Transport&nbsp;</td>
      <td width="60%" valign="top"><select size="1" name="Transport" class=cssInputText><%Call ListTransport(Request.Form("Transport"),conn)%></select></td></tr>
    <tr>
      <td width="40%" valign="top" class=cssTDTextLabel align=right>Price range&nbsp;</td>
      <td width="60%" colspan="3" valign="top"><input type="text" name="MinPrice" size="8" class=cssInputText value="<%=Request.Form("MinPrice")%>"> -&gt; <input type="text" name="MaxPrice" size="8" class=cssInputText value="<%=Request.Form("MaxPrice")%>"> USD</td></tr>	
    <%
    'Form tim kiem Medical services
    Case 8%>
    <tr>
      <td width="40%" valign="top" class=cssTDTextLabel align=right>Medical service&nbsp;</td>
      <td width="60%" valign="top"><select size="1" name="MedicalService" class=cssInputText><%Call ListMedicalService(Request.Form("MedicalService"),conn)%></select></td></tr>
    <%
    'Form tim kiem Book
    Case 9%>
    <tr>
      <td width="40%" valign="top" class=cssTDTextLabel align=right>Book is stored&nbsp;</td>
      <td width="60%" valign="top"><select size="1" name="Book" class=cssInputText><%Call ListBook(Request.Form("Book"),conn)%></select></td></tr>
    <%
    'Form tim kiem Visa extensions
    Case 10%>
    <%
    'Form tim kiem Bank
    Case 11%>
    <%
    'Form tim kiem Communication
    Case 12%>
    <tr>
      <td width="40%" valign="top" class=cssTDTextLabel align=right>Communication&nbsp;</td>
      <td width="60%" valign="top"><select size="1" name="Communication" class=cssInputText><%Call ListCommunication(Request.Form("Communication"),conn)%></select></td></tr>
	<%
	'Form tim kiem Booking-office
	Case 13%>	
    <tr>
      <td width="40%" valign="top" class=cssTDTextLabel align=right>Booking-office&nbsp;</td>
      <td width="60%" valign="top"><select size="1" name="BookingOffice" class=cssInputText><%Call ListBookingOffice(Request.Form("BookingOffice"),conn)%></select></td></tr>
	<%
	'Form tim kiem travel agencies
	Case 14%>
    <tr>
      <td width="40%" align="right">
			<%If Request.Form("Inbound") = "1" Then%>
				<input type="checkbox" name="Inbound" id="Inbound" value="1" checked>
			<%Else%>
				<input type="checkbox" name="Inbound" id="Inbound" value="1">
			<%End If%>
        <label for="Inbound" valign="top" class=cssTDTextLabel align=right>Inbound</label>&nbsp;&nbsp;</td>
      <td width="60%"><%If Request.Form("Trekking") = "1" Then%>
						<input type="checkbox" name="Trekking" id="Trekking" value="1" checked>
						<%Else%>
 						<input type="checkbox" name="Trekking" id="Trekking" value="1">
 						<%End If%>
        <label for="Trekking" valign="top" class=cssTDTextLabel align=right>Trekking</label></td></tr>
    <tr>
      <td width="40%" align="right">
			<%If Request.Form("Outbound") = "1" Then%>
				<input type="checkbox" name="Outbound" id="Outbound" value="1" checked>
			<%Else%>
				<input type="checkbox" name="Outbound" id="Outbound" value="1">
			<%End If%>
        <label for="Outbound" valign="top" class=cssTDTextLabel align=right>Outbound</label></td>
      <td width="60%"><%If Request.Form("MotorbikingTour") = "1" Then%>
						<input type="checkbox" name="MotorbikingTour" id="MotorbikingTour" value="1" checked>
						<%Else%>
 						<input type="checkbox" name="MotorbikingTour" id="MotorbikingTour" value="1">
 						<%End If%>
        <label for="MotorbikingTour" valign="top" class=cssTDTextLabel align=right>Motorbiking speciality tour</label></td></tr>
	<%
	Case 15  
End Select%>
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
    <input type="hidden" name="MainImage"      value="<%=Request.Form("MainImage")%>">
    <input type="hidden" name="MainSound"      value="<%=Request.Form("MainSound")%>">
    <input type="hidden" name="MainMovie"      value="<%=Request.Form("MainMovie")%>">
    
    <input type="hidden" name="tpCategory" value="<%=Request.Form("Category")%>">

    <input type="hidden" name="EnglishIntroduction" value="<%=Request.Form("EnglishIntroduction")%>">

<!--Nut thi hanh-->
<p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="10%"><input type="submit" value="Back" name="Back" onClick=FormBack(<%=ID%>,"<%=flagEdit%>")></td>
    <td width="70%"></td>
	<%If flagEdit = "Add" Then%>
    <td width="10%"><input type="submit" value="Add"    name="Add"    onClick='FinishEdit(this.form,<%=ID%>,"AddNewLocation.asp")'></td>
	<%Else%>
    <td width="10%"><input type="submit" value="Delete" name="Delete" onClick='DeleteLocation(this.form,<%=ID%>,"DeleteLocation.asp"); return false;'></td>
    <td width="10%"><input type="submit" value="Update" name="Update" onClick='FinishEdit(this.form,<%=ID%>,"UpdateLocation.asp")'></td>
  	<%End If%>
	<td width="10%"><input type="reset" value="Cancel" name="Cancel"  onClick='CancelEditLocation(this.form,"<%=flagEdit%>")'></td></tr>
</table>

</center>
</form>

<%
conn.Close
Set conn = nothing
%>
</body>

