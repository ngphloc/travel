<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" type="text/css" href="webnews.css">
<title>ReceiveCustomize</title>
</head>

<body background="IMAGES/Bgr2.jpg" bgproperties="fixed">
<%
on error resume next
attempt = "Create connection object" 'thong bao ve loi kiem tra

'Mo ket noi server
'ConnectionString = Session("cnString")
ConnectionString = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("Data/Travel.mdb")
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open ConnectionString
Call CheckErrorVBScript(attempt)
%>
<%
AmountLocation = Request.Form("AmountLocation")
LocationIDs = Request.Form("LocationIDs") 
Transports  = Request.Form("Transports")
Email       = Request.Form("Email")

'Lay thong tin ve cac dia danh trong tour
LocationID  = Split(LocationIDs, ":", -1, vbTextCompare)
TransportID = Split(Transports, ":", -1, vbTextCompare)
%>
<font face="Times New Roman" size=-1>
Your email : <%=Email%><br>
Thank you, you request received. We will response you later. 
</font>
<form method="POST" name="ReceiveCustomize">
<table border="1" width="600" class=cssTableLayout cellspacing=0 cellpadding=2 bgColor="#eeeeee" bordercolor="#EEEEEE">
	<tr height="35">
	  <td width="570" class=cssTDHeader align="center" colspan="3">Your customize tour</td></tr>
	<!--Hien thi thong tin gioi thieu tong quat-->
	<tr height=25 bgcolor="#0182DD" class=cssSearchHeader>
	  <td width=5%%>No</td>
	  <td width=80%>To </td>
	  <td width=15%>By</td></tr>

<%
count=1
For i=1 to CInt(LocationID(0))
	If LocationID(i)<>0 Then
		SQL = " SELECT ID, EnglishName As Name, EnglishAddress As Address FROM Location WHERE ID="&LocationID(i)
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		If Not rs.BOF Then
		%>
		<tr>
			<td class="cssTDTextLabel"><%=count%>.</td>
			<td class="cssTDTextLabel"><a href="DetailLocation.asp?ID=<%=rs("ID")%>"><%=rs("Name")%></a></td>
			<td class="cssTDTextLabel"><%=TransportID(i)%></tr>
		<%	
		count = count+1
		End If
		rs.Close
		Set rs = nothing
	End If
Next
%>

<%
'Dong ket noi server
conn.Close
Set conn = nothing
%>

</body>

