<%response.buffer=true%>
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

'Lay thong tin can cap nhat cua dia danh
ID = Request.QueryString("ID")

EnglishName = Request.Form("EnglishName")

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

	'Xoa thong tin gioi thieu ve dia danh
	SQL = "DELETE " &_
			" FROM LocationInfo" &_
			" WHERE ID="&ID
	conn.Execute(SQL)
	Call CheckErrorVBScript(attempt)
	If CheckErrorDatabase(SQL,conn) = false Then	flagComplete = false
	
	'Xoa thong tin dia danh	
	SQL = "DELETE " &_
			" FROM Location " &_
			" WHERE ID="&ID
	conn.Execute(SQL)
	Call CheckErrorVBScript(attempt)
	If CheckErrorDatabase(SQL,conn) = false Then	flagComplete = false
	
'End TRANSACTION
If (flagComplete = true)Then
	conn.CommitTrans()
	Response.Write "Site <font color='#FF0000'>"&EnglishName&"</font> have just been delete from database."
Else
	conn.RollbackTrans()
	Response.Write "<h2>Error!!!</h2><br>Site <h2>"&EnglishName&"</h2> haven't been delete from database."
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
<title>Delete Location</title>

</head>

<body>

</body>

</html>
