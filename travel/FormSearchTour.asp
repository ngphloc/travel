<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" type="text/css" href="webnews.css">
<title>Form Search Tour</title>

<script language="JavaScript">
	function SearchLocation(flagEdit){
		document.frmSearchTour.action = "FormSearchTour.asp?flagEdit="+flagEdit
		document.frmSearchTour.submit()
	}
	function SearchTour(flagEdit){
		document.frmSearchTour.action = "SearchTour.asp?flagEdit="+flagEdit
		document.frmSearchTour.submit()
	}
</script>

</head>

<body background="images/Bgr2.jpg" bgproperties="fixed">
<!--#INCLUDE FILE="GeneralInformation.asp"-->
<!--#INCLUDE FILE="LibErrors.asp"-->

<%
on error resume next
attempt = "Create connection object" 'thong bao ve loi kiem tra

'Mo ket noi server
'ConnectionString = Session("cnString")
ConnectionString = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("Data/Travel.mdb")
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open ConnectionString
Call CheckErrorVBScript(attempt)

flagEdit = Request.QueryString("flagEdit")

Location  = Request.Form("Location")
Transport = Request.Form("Transport")
Category  = Request.Form("Category")
%>

<form name="frmSearchTour" method="POST">
<center>

<table border="1" width="650" class=cssTableLayout cellspacing=0 cellpadding=2 bgColor="#eeeeee" bordercolor="#EEEEEE">
	<tr height=25>
		<td colspan="4" width="100%" class=cssTDHeader bgcolor="#0182DD" align="center">Search tours</td></tr>
	<tr>
	  <td width="600" colspan="4" align="center" class=cssTDText>Please, enter information to search<p></td></tr>
    <tr>
      <td width="13%" valign="top" class=cssTDTextLabel align=right>Category</td>
      <td width="24%" valign="top"><select size="1" name="Category" class=cssInputText onChange='SearchLocation("<%=flagEdit%>")'><%Call ListCategory(Category,conn,0)%></select></td>
      <td width="15%" valign="top" class=cssTDTextLabel align=right>Site</td>
      <td width="48%" valign="top"><select size="1" name="Location" class=cssInputText><%Call ListLocation(Location,Category,conn)%></select></td></tr>
	<tr>
      <td width="13%" valign="top" class=cssTDTextLabel align=right>By transport</td>
      <td width="24%" valign="top"><select size="1" name="Transport" class=cssInputText><%Call ListTransportInTour(Transport,0)%></select></td></tr>
</table>

	<!--Nut dieu khien-->  
	<p>
    <input type="submit" value="Search" name="Search" onClick='SearchTour("<%=flagEdit%>")'>
    <input type="reset"  value="Reset"  name="Reset">
    
</center>
</form>
	
<%
conn.Close
Set conn = nothing
%>	
</body>




