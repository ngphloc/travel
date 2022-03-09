<%response.buffer=true%>

<!--#INCLUDE FILE="LibErrors.asp"-->
<!--#INCLUDE FILE="GeneralInformation.asp"-->
<!--#INCLUDE FILE="LibJavascript.asp"-->

<%
on error resume next
attempt = "Create connection object"

'Mo ket noi server
'ConnectionString = Session("cnString")
ConnectionString = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("Data/Travel.mdb")
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open ConnectionString
Call CheckErrorVBScript(attempt)

'Lay kieu cap nhat thong tin : update, add, delete
flagEdit = Request.QueryString("flagEdit")

'Lay ID cua dia danh
ID = Request.QueryString("ID")
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Form Edit 2</title>
<link rel="stylesheet" type="text/css" href="webnews.css">

<script language=JavaScript>
//Next
	function FormNext(ID,flagEdit){
		document.FormEdit2.action = "FormEdit3.asp?ID=" + ID + "&flagEdit=" + flagEdit
	}
//Back
	function FormBack(ID,flagEdit){
		document.FormEdit2.action = "FormEdit1.asp?ID=" + ID + "&flagEdit=" + flagEdit
	}
</script>

</head>

<body background="IMAGES/Bgr2.jpg" bgproperties="fixed">

<form name="FormEdit2" method="POST">
  <!--Thong tin chinh trong form cua mot dia danh-->
<center>
<table border="1" width="600" class=cssTableLayout cellspacing=0 cellpadding=2 bgColor="#eeeeee" bordercolor="#EEEEEE">
	<tr height=25>
		<td colspan="4" width="600" class=cssTDHeader align=center>Introduction site</td></tr>
	<tr><td width="600" colspan="4" align="center" class=cssTDText>Step 2 of 3<p></td></tr>
    <tr>
      <td width="17%" height="121" valign="top" class=cssTDTextLabel align=right>Introduction&nbsp;</td>
      <td width="83%" height="124" valign="top"><textarea name="EnglishIntroduction" rows="7" cols="75" class=cssInputText><%=Request.Form("EnglishIntroduction")%></textarea></td></tr>
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

    <input type="hidden" name="Design"   value="<%=Request.Form("Design")%>">
    <input type="hidden" name="Standard" value="<%=Request.Form("Standard")%>">
    <input type="hidden" name="MinPrice" value="<%=Request.Form("MinPrice")%>">
    <input type="hidden" name="MaxPrice" value="<%=Request.Form("MaxPrice")%>">
    <input type="hidden" name="Food" value="<%=Request.Form("Food")%>">
    <input type="hidden" name="PrincipalDish" value="<%=Request.Form("PrincipalDish")%>">
    <input type="hidden" name="Worship" value="<%=Request.Form("Worship")%>">
    <input type="hidden" name="Shopping" value="<%=Request.Form("Shopping")%>">
	<input type="hidden" name="Entertainment" value="<%=Request.Form("Entertainment")%>">		
	<input type="hidden" name="Transport" value="<%=Request.Form("Transport")%>">		
	<input type="hidden" name="MedicalService" value="<%=Request.Form("MedicalService")%>">		
	<input type="hidden" name="Book" value="<%=Request.Form("Book")%>">		
	<input type="hidden" name="Communication" value="<%=Request.Form("Communication")%>">		
	<input type="hidden" name="BookingOffice" value="<%=Request.Form("BookingOffice")%>">		
	<input type="hidden" name="Inbound"  value="<%=Request.Form("Inbound")%>">		
	<input type="hidden" name="Outbound" value="<%=Request.Form("Outbound")%>">		
	<input type="hidden" name="Trekking" value="<%=Request.Form("Trekking")%>">		
	<input type="hidden" name="MotorbikingTour" value="<%=Request.Form("MotorbikingTour")%>">		
    
<!--Nut thi hanh-->
  <p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
    <tr>
      <td width="10%"><input type="submit" value="Back" name="Back" onClick=FormBack(<%=ID%>,"<%=flagEdit%>")></td>
      <td width="10%"><input type="submit" value="Next" name="Next" onClick=FormNext(<%=ID%>,"<%=flagEdit%>")></td>
      <td width="60%"></td>
	  <%If flagEdit = "Add" Then%>
      <td width="10%"><input type="submit" value="Add"    name="Add"    onClick='FinishEdit(this.form,<%=ID%>,"AddNewLocation.asp")'></td>
      <%Else%>
	  <td width="10%"><input type="submit" value="Delete" name="Delete" onClick='DeleteLocation(this.form,<%=ID%>,"DeleteLocation.asp"); return false;'></td>
      <td width="10%"><input type="submit" value="Update" name="Update" onClick='FinishEdit(this.form,<%=ID%>,"UpdateLocation.asp")'></td>
      <%End If%>
      <td width="10%"><input type="reset"  value="Cancel" name="Cancel" onClick='CancelEditLocation(this.form,"<%=flagEdit%>")'></td>
    </tr>
</table>
</center>
</form>
<%
'Dong ket noi server
conn.Close
Set conn = nothing
%>

</body>

</html>
