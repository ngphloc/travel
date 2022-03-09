<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Tour</title>
<link rel="stylesheet" type="text/css" href="webnews.css">

</head>

<body background="IMAGES/Bgr2.jpg" bgproperties="fixed">

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

SQL = "SELECT ID, EnglishName As Name FROM Tours"
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open SQL, conn
Call CheckErrorVBScript(attempt)
Call CheckErrorDatabase(SQL,conn)

If Not rs.BOF Then%>
<center>
<table border="1" width="400" class=cssTableLayout cellspacing="0" cellpadding="2" bordercolor="#EEEEEE" bgcolor="#EEEEEE" bordercolorlight="#0182DD" bordercolordark="#EEEEEE">
  <tr height=25 bgcolor="#0182DD" align=center class=cssSearchHeader>
	<td colspan=2 align="center" class=cssTDHeader>Tours</td></tr>
  <tr height=25 bgcolor="#0182DD" align=center class=cssSearchHeader>
    <td width="30"  align="center" >No</td>
    <td width="370" align="center" >Name</td></tr>
	<%
	rs.MoveFirst
	howmanyrecs = 1
	Do While Not rs.EOF%>
  <tr class=cssSearchResult  bgcolor="#eeeeee">
	<td align="center"><%=howmanyrecs%></td>
	<td><%Select Case Request.QueryString("flagEdit")
			Case "Update"%>
				<a href="FormEditTour1.asp?TourID=<%=rs("ID")%>&flagAccess=1&flagEdit=Update">
			<%Case Else'Detail%>
				<a href="DetailTour.asp?TourID=<%=rs("ID")%>">
		<%End Select%>
		<%=rs("Name")%></td></tr>
		<%rs.MoveNext
		howmanyrecs = howmanyrecs + 1
	Loop%>
</table></center>	
<%End If

rs.Close
Set rs = nothing
conn.Close
Set conn = nothing
%>

</body>

