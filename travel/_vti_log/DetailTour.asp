<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Detail Tour</title>
<link rel="stylesheet" type="text/css" href="webnews.css">
</head>

<body background="IMAGES/Bgr2.jpg" bgproperties="fixed" text="#0000FF">

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

TourID = Request.QueryString("TourID")

SQL = "SELECT EnglishIntroduction As Introduction, EnglishName As TourName FROM Tours WHERE ID=" & TourID
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open SQL, conn
Call CheckErrorVBScript(attempt)
Call CheckErrorDatabase(SQL,conn)
%>

<form method="POST" action="DetailLocation.asp" name="DetailLocation">
<table border="1" width="600" class=cssTableLayout cellspacing=0 cellpadding=2 bgColor="#eeeeee" bordercolor="#EEEEEE">
	<tr height="35">
	  <td width=5% bgcolor="#0182DD"><a href="FormCustomizeTour.asp?TourID=<%=TourID%>&flagAccess=1&flagAccessx=1"><IMG src="Images/Customize.gif" alt="Customize tour" border="0"></a>&nbsp;</td>
	  <td width="570" class=cssTDHeader align="center" colspan="2"><%=rs("TourName")%></td></tr>
	<!--Hien thi thong tin gioi thieu tong quat-->
	<tr height=25 bgcolor="#0182DD" class=cssSearchHeader>
	  <td colspan="3">Introduction</td></tr>
	<tr>
	  <td colspan="3"><%=rs("Introduction")%><br></td></tr>
	<tr height=25 bgcolor="#0182DD" class=cssSearchHeader>
	  <td width=5%%>No</td>
	  <td width=80%>To </td>
	  <td width=15%>By</td></tr>

<%
rs.Close
Set rs = nothing

SQL = "SELECT Location.ID As ID, Location.EnglishName As Name, Transport"
SQL = SQL & " FROM LocationTours, Location "
SQL = SQL & " WHERE TourID=" & TourID & " AND LocationID = Location.ID"
SQL = SQL & " ORDER BY Orders"
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open SQL, conn
Call CheckErrorVBScript(attempt)
Call CheckErrorDatabase(SQL,conn)

If Not rs.BOF Then
	rs.MoveFirst
	count = 1%>
	<%Do While Not rs.EOF%>
		<tr><td><%=count%>.</td>
			<td><a href="DetailLocation.asp?ID=<%=rs("ID")%>"><%=rs("Name")%></a></td>
			<td><%=rs("Transport")%></tr>
		<%rs.MoveNext
		  count = count + 1
	  Loop
Else%>
		<tr><td colspan="2">Don't have any location in tour!!!</td></tr>
<%End If%>
</table>
<%
rs.Close
Set rs = nothing
conn.Close
Set conn = nothing
%>

</body>

