<%@ Language=VBScript %>
<%response.buffer=true%>

<!--#include File="GeneralInformation.asp"-->

<% 
on error resume next
attempt = "Create connecttion object"

'Mo ket noi server
'ConnectionString = Session("cnString")
ConnectionString = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("Data/Travel.mdb")
Set conn = server.CreateObject("ADODB.Connection")
conn.Open ConnectionString
Call CheckErrorVBScript(attempt)

'Lay chi so cua form tim kiem
arg = Request.QueryString("arg")
flagEdit = Request.QueryString("flagEdit")

If flagEdit = "" Then
	Select Case arg
		Case "Update"
			arg = 0
			flagEdit = "Update" ' xac nhan chon menu cap nhat thong tin 
		Case "SearchMap"
			arg = 0
			flagEdit = "SearchMap"
		Case Else
			flagEdit = "Detail" ' neu khong con menu cap nhat thong tin hay tim tren ban do trong mnuManage
	End Select
End If

Select Case arg
	Case 0
		strTitle = "Search site"
	Case Else
		SQL = "SELECT EnglishName FROM LocationCategory WHERE ID=" & arg
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		Call CheckErrorVBScript(attempt)
		Call CheckErrorDatabase(SQL, conn)
		
		If Not rs.BOF Then
			strTitle = rs("EnglishName")	
		Else
			Response.Write "Don't access database !!!"
		End If	
End Select

%>


<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Form Search</title>
<link rel="stylesheet" href="webnews.css" type="text/css">

<script language=JavaScript>
	function SearchPrecinct(arg,flagEdit){
		document.SearchIndex.action = "FormSearch.asp?arg=" + arg + "&flagEdit=" + flagEdit
		document.SearchIndex.submit()
	}
	function SearchLocation(type,flagEdit){
		document.SearchIndex.action = "SearchLocation.asp?type=" + type + "&flagEdit=" + flagEdit
	}
	function SearchForm(arg,flagEdit){
		document.SearchIndex.action = "FormSearch.asp?arg=" + document.SearchIndex.frmCategory(document.SearchIndex.frmCategory.selectedIndex).value + "&flagEdit=" + flagEdit
		document.SearchIndex.submit()
	}
</script>

</head>


<body background="IMAGES/Bgr2.jpg" bgproperties="fixed">

<form id="SearchIndex" name="SearchIndex" method="POST">
<center>

<table border="1" width="600" class=cssTableLayout cellspacing=0 cellpadding=2 bordercolor="#0000FF" bordercolorlight="#EEEEEE" bordercolordark="#000000">
	<tr height=25>
		<td width="100%" class=cssSearchHeader bgcolor="#0182DD" align="right">Choose form <select size="1" name="frmCategory" class=cssInputText onChange='SearchForm(<%=arg%>,"<%=flagEdit%>")'><%Call ListCategory(Request.Form("frmCategory"),conn,0)%></select></td></tr>
</table>
<p>

<table border="1" width="600" class=cssTableLayout cellspacing=0 cellpadding=2 bgColor="#eeeeee" bordercolor="#EEEEEE">
	<tr height=25>
		<td colspan=4 width="600" class=cssTDHeader align=center><%=strTitle%></td></tr>
	<tr>
	  <td width="600" colspan="4" align="center" class=cssTDText>Please, enter information to search<p></td></tr>
    <tr>
	  <td width="85" valign="top" class=cssTDTextLabel align=right>Name&nbsp;</td>
	  <td width="447" colspan="3" valign="top"><input type="text" name="Name" size="30" class=cssInputText value="<%=Request.Form("Name")%>"></td></tr>
	<%If arg = 0 Then%>
    <tr>
      <td width="85" valign="top" class=cssTDTextLabel align=right>Category&nbsp;</td>
      <td width="447" colspan="3" valign="top"><select size="1" name="Category" class=cssInputText><%Call ListCategory(Request.Form("Category"),conn,0) 'chon --&-- lam phan tu dau%></select></td></tr>
    <%End If%>
    <tr>
      <td width="85" valign="top" class=cssTDTextLabel align=right>Is Built&nbsp;</td>
      <td width="447" colspan="3" valign="top"><select size="1" name="YearBuilt" class=cssInputText><%Call ListYearBuilt(Request.Form("YearBuilt"))%></select>year ago</td></tr>
    <tr>
      <td width="85" valign="top" class=cssTDTextLabel align=right>District&nbsp;</td>
      <td width="215" valign="top"><select size="1" name="District" class=cssInputText onChange=SearchPrecinct(<%=arg%>,"<%=flagEdit%>")><%Call ListDistrict(Request.Form("District"),conn,0) 'chon --&-- lam phan tu dau%></select></td>
      <td width="85" valign="top" class=cssTDTextLabel align=right>Precinct&nbsp;</td>
      <td width="215" valign="top"><select size="1" name="Precinct" class=cssInputText><%Call ListPrecinct(Request.Form("Precinct"),Request.Form("District"),conn) 'chon --&-- lam phan tu dau%></select></td></tr>
    <tr>
      <td width="85" valign="top" class=cssTDTextLabel align=right>Address&nbsp;</td>
      <td width="215" colspan="3" valign="top"><input type="text" name="Address" size="30" class=cssInputText value="<%=Request.Form("Address")%>"></td></tr>
    <tr>
      <td width="85" valign="top" class=cssTDTextLabel align=right>Tel&nbsp;</td>
      <td width="215" valign="top"><input type="text" name="Phone" size="15" class=cssInputText value="<%=Request.Form("Phone")%>"></td>
      <td width="85" valign="top" class=cssTDTextLabel align=right>Fax&nbsp;</td>
      <td width="215" valign="top"><input type="text" name="Fax" size="15" class=cssInputText value="<%=Request.Form("Fax")%>"></td></tr>
    <tr>
      <td width="85" valign="top" class=cssTDTextLabel align=right>Email&nbsp;</td>
      <td width="215" valign="top"><input type="text" name="Email" size="20" class=cssInputText value="<%=Request.Form("Email")%>"></td>
      <td width="85" valign="top" class=cssTDTextLabel align=right>Website&nbsp;</td>
      <td width="215" valign="top"><input type="text" name="Website" size="20" class=cssInputText value="<%=Request.Form("Website")%>"></td></tr>
    <tr>
		<td colspan=4 width="600" align=center>
<%
'Cac dac trung cua tung dia danh trong form tim kiem
Select Case arg
    'Form tim kiem tat ca
	Case 0
	'Form tim kiem Places to stay
	Case 1%>
	<table border="0" width="364" cellspacing=0 cellpadding=2 bgColor="#eeeeee">
    <tr>
      <td width="134" valign="top" class=cssTDTextLabel align=right>Design&nbsp;</td>
      <td width="218" valign="top"><select size="1" name="Design" class=cssInputText><%Call ListDesign(Request.Form("Design"),conn)%></select></td></tr>
    <tr>
      <td width="134" valign="top" class=cssTDTextLabel align=right>Standard&nbsp;</td>
      <td width="218" valign="top"><select size="1" name="Standard" class=cssInputText><%Call ListStandard(Request.Form("Standard"))%></select></td></tr>
    <tr>
      <td width="134" valign="top" class=cssTDTextLabel align=right>Rates&nbsp;</td>
      <td width="218" valign="top"><input type="text" name="MinPrice" size="6" class=cssInputText value="<%=Request.Form("MinPrice")%>"> -&gt; <input type="text" name="MaxPrice" size="6" class=cssInputText value="<%=Request.Form("MaxPrice")%>"> USD</td></tr>
	</table>
	<%
	'Form tim kiem Places to eat
	Case 2%>
	<table border="0" width="362" cellspacing=0 cellpadding=2 bgColor="#eeeeee">
    <tr>
      <td width="134" valign="top" class=cssTDTextLabel align=right>Food&nbsp;</td>
      <td width="216" valign="top"><select size="1" name="Food" class=cssInputText><%Call ListFood(Request.Form("Food"),conn)%></select></td></tr>
    <tr>
        <td width="134" valign="top" class=cssTDTextLabel align=right>Principal dish&nbsp;</td>
        <td width="216" valign="top"><input type="text" name="EnglishPrincipalDish" size="25" class=cssInputText value="<%=Request.Form("EnglishPrincipalDish")%>"></td></tr>
	</table>
	<%
	'Form tim kiem Worship
	Case 3%>
	<table border="0" width="363" cellspacing=0 cellpadding=2 bgColor="#eeeeee">
    <tr>
      <td width="134" valign="top" class=cssTDTextLabel align=right>Worship&nbsp;</td>
      <td width="217" valign="top"><select size="1" name="Worship" class=cssInputText><%Call ListWorship(Request.Form("Worship"),conn)%></select></td></tr>
	</table>
    <%
    'Form tim kiem Shopping
    Case 4%>
	<table border="0" width="359" cellspacing=0 cellpadding=2 bgColor="#eeeeee">
    <tr>
      <td width="134" valign="top" class=cssTDTextLabel align=right>Shopping&nbsp;</td>
      <td width="213" valign="top"><select size="1" name="Shopping" class=cssInputText><%Call ListShopping(Request.Form("Shopping"),conn)%></select></td></tr>
	</table>
    <%
    'Form tim kiem Entertainment & relax
    Case 5%>
	<table border="0" width="360" cellspacing=0 cellpadding=2 bgColor="#eeeeee">
    <tr>
      <td width="134" valign="top" class=cssTDTextLabel align=right>Entertainment&nbsp;</td>
      <td width="204" valign="top"><select size="1" name="Entertainment" class=cssInputText><%Call ListEntertainment(Request.Form("Entertainment"),conn)%></select></td></tr>
    <tr>
      <td width="134" valign="top" class=cssTDTextLabel align=right>Price range&nbsp;</td>
      <td width="214" valign="top" colspan="3"><input type="text" name="MinPrice" size="6" class=cssInputText value="<%=Request.Form("MinPrice")%>"> -&gt; <input type="text" name="MaxPrice" size="6" class=cssInputText value="<%=Request.Form("MaxPrice")%>">USD</td></tr>	
	</table>
    <%
    'Form tim kiem Museum
    Case 6%>
	<table border="0" width="358" cellspacing=0 cellpadding=2 bgColor="#eeeeee">
    <tr>
      <td width="134" valign="top" class=cssTDTextLabel align=right>Admission&nbsp;</td>
      <td width="212" valign="top" colspan="3"><input type="text" name="MinPrice" size="6" class=cssInputText value="<%=Request.Form("MinPrice")%>"> -&gt; <input type="text" name="MaxPrice" size="6" class=cssInputText value="<%=Request.Form("MaxPrice")%>">USD</td></tr>	
	</table>
    <%
    'Form tim kiem Transport
    Case 7%>
	<table border="0" width="357" cellspacing=0 cellpadding=2 bgColor="#eeeeee">
    <tr>
      <td width="134" valign="top" class=cssTDTextLabel align=right>Transport&nbsp;</td>
      <td width="204" valign="top"><select size="1" name="Transport" class=cssInputText><%Call ListTransport(Request.Form("Transport"),conn)%></select></td></tr>
    <tr>
      <td width="134" valign="top" class=cssTDTextLabel align=right>Price range&nbsp;</td>
      <td width="211" valign="top" colspan="3"><input type="text" name="MinPrice" size="6" class=cssInputText value="<%=Request.Form("MinPrice")%>"> -&gt; <input type="text" name="MaxPrice" size="6" class=cssInputText value="<%=Request.Form("MaxPrice")%>">USD</td></tr>	
	</table>
    <%
    'Form tim kiem Medical services
    Case 8%>
	<table border="0" width="355" cellspacing=0 cellpadding=2 bgColor="#eeeeee">
    <tr>
      <td width="134" valign="top" class=cssTDTextLabel align=right>Medical service&nbsp;</td>
      <td width="209" valign="top"><select size="1" name="MedicalService" class=cssInputText><%Call ListMedicalService(Request.Form("MedicalService"),conn)%></select></td></tr>
	</table>
    <%
    'Form tim kiem Book
    Case 9%>
	<table border="0" width="356" cellspacing=0 cellpadding=2 bgColor="#eeeeee">
    <tr>
      <td width="134" valign="top" class=cssTDTextLabel align=right>Book is stored&nbsp;</td>
      <td width="210" valign="top"><select size="1" name="Book" class=cssInputText><%Call ListBook(Request.Form("Book"),conn)%></select></td></tr>
	</table>
    <%
    'Form tim kiem Visa extensions
    Case 10%>
    <%
    'Form tim kiem Bank
    Case 11%>
    <%
    'Form tim kiem Communication
    Case 12%>
	<table border="0" width="360" cellspacing=0 cellpadding=2 bgColor="#eeeeee">
    <tr>
      <td width="134" valign="top" class=cssTDTextLabel align=right>Communication&nbsp;</td>
      <td width="214" valign="top"><select size="1" name="Communication" class=cssInputText><%Call ListCommunication(Request.Form("Communication"),conn)%></select></td></tr>
	</table>
	<%
	'Form tim kiem Booking-office
	Case 13%>	
	<table border="0" width="358" cellspacing=0 cellpadding=2 bgColor="#eeeeee">
    <tr>
      <td width="134" valign="top" class=cssTDTextLabel align=right>Booking-office&nbsp;</td>
      <td width="212" valign="top"><select size="1" name="BookingOffice" class=cssInputText><%Call ListBookingOffice(Request.Form("BookingOffice"),conn)%></select></td></tr>
	</table>
	<%
	'Form tim kiem travel agencies
	Case 14%>
	<table border="0" width="359" cellspacing=0 cellpadding=2 bgColor="#eeeeee">
      <tr>
        <td width="134"><%If Request.Form("Inbound") = "1" Then%>
						<input type="checkbox" name="Inbound" id="Inbound" value="1" checked>
						<%Else%>
						<input type="checkbox" name="Inbound" id="Inbound" value="1">
						<%End If%>
        <label for="Inbound" class=cssTDTextLabel>Inbound</label></td>
        <td width="213"><%If Request.Form("Trekking") = "1" Then%>
						<input type="checkbox" name="Trekking" id="Trekking" value="1" checked>
						<%Else%>
 						<input type="checkbox" name="Trekking" id="Trekking" value="1">
 						<%End If%>
        <label for="Trekking" class=cssTDTextLabel>Trekking</label></td></tr>
      <tr>
        <td width="134"><%If Request.Form("Outbound") = "1" Then%>
						<input type="checkbox" name="Outbound" id="Outbound" value="1" checked>
						<%Else%>
						<input type="checkbox" name="Outbound" id="Outbound" value="1">
						<%End If%>
        <label for="Outbound" class=cssTDTextLabel>Outbound</label></td>
        <td width="213"><%If Request.Form("MotorbikingTour") = "1" Then%>
						<input type="checkbox" name="MotorbikingTour" id="MotorbikingTour" value="1" checked>
						<%Else%>
 						<input type="checkbox" name="MotorbikingTour" id="MotorbikingTour" value="1">
 						<%End If%>
        <label for="MotorbikingTour" class=cssTDTextLabel>Motorbiking speciality tour</label></td></tr>
	</table>
	<%
	Case 15  
	Case Else
		Response.Write "This form is updating so you don't access !!!"    
End Select%>
</td></tr>
<!--  <tr>
    <td colspan=2 width="300" align="right"><input type="submit" value="Search" name="Search" onClick=SearchLocation(<%=arg%>,"<%=flagEdit%>")></td>
    <td colspan=2 width="300" align="left"><input type="reset"  value="Reset"  name="Reset"></td>
  </tr>-->
</table> 
	
	<p>
    <input type="submit" value="Search" name="Search" onClick=SearchLocation(<%=arg%>,"<%=flagEdit%>")>
    <input type="reset"  value="Reset"  name="Reset">
 
</center>
</form>

<%
'Dong ket noi server
conn.Close
Set conn = nothing
%>

</body>










