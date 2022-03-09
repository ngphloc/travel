<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Edit Tour</title>

</head>

<body>

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

ff = true

flagEdit = Request.QueryString("flagEdit")'= Add : them moi
										  '= Update : Cap nhat	
										  '= Delete : xoa
TourID = Request.QueryString("TourID")	

EnglishName = Request.Form("EnglishName")
EnglishIntroduction = Request.Form("EnglishIntroduction")

'Cac ID dia danh trong tour							
LocationIDs = Request.Form("LocationIDs")
Transports  = Request.Form("Transports")

'Lay tung ID dia danh trong tour
LocationID = Split(LocationIDs, ":", -1, vbTextCompare)
Transport  = Split(Transports, ":", -1, vbTextCompare)

'Start TRANSACTION
conn.BeginTrans()

	'Xoa cac dia danh da san co trong tour
	SQL = "DELETE " &_
		  "FROM LocationTours " &_
		  "WHERE TourID=" & TourID
	conn.Execute(SQL)
	Call CheckErrorVBScript(attempt)
	If CheckErrorDatabase(SQL,conn) = false Then	ff = false		

	'Lay ma tour
	If flagEdit="Add" Then
		SQL = "SELECT Max(ID) As MaxID FROM Tours"
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		Call CheckErrorVBScript(attempt)
		If CheckErrorDatabase(SQL,conn) = false Then	ff = false
		TourID = rs("MaxID")+1
		rs.Close
		Set rs = nothing
	End If

	'Cap nhat thong tin tour
	Select Case flagEdit
		Case "Update"
			SQL = "UPDATE Tours " &_
				  "SET EnglishName='" & EnglishName & "', EnglishIntroduction='" & EnglishIntroduction & "' " &_
				  "WHERE ID=" & TourID
		Case "Delete"
			SQL = "DELETE " &_
				  "FROM Tours " &_
				  "WHERE ID=" & TourID
		Case "Add"
			SQL = "INSERT INTO Tours (ID, EnglishName, EnglishIntroduction) " &_
				  "VALUES (" & TourID & ", '" & EnglishName & "', '" & EnglishIntroduction & "')"
	End Select
	conn.Execute(SQL)
	Call CheckErrorVBScript(attempt)
	If CheckErrorDatabase(SQL,conn) = false Then	ff = false
	
	'Cap nhat thong tin cac dia danh trong tour
	If flagEdit <> "Delete" Then
		AmountLocation = CInt(LocationID(0))
		intOrder = 1
		For i = 1 To AmountLocation
			If CInt(LocationID(i)) <> 0 Then
				SQL = "INSERT INTO LocationTours (LocationID, TourID, Orders, Transport) " &_
					  "VALUES (" & LocationID(i) & ", " & TourID &", "& intOrder & ", '" & Transport(i) &"')"
				conn.Execute(SQL)
				Call CheckErrorVBScript(attempt)
				If CheckErrorDatabase(SQL,conn) = false Then	ff = false
				intOrder=intOrder+1
			End If
		Next
	End If

If ff = false Then
	conn.RollbackTrans
'Hoan tat TRANSACTION
Else
	conn.CommitTrans
End If

If ff = false Then
	Response.Write "<h2>Information must update, have error so don't update database!!!!</h2>"
Else
	Select Case flagEdit
		Case "Delete"
			Response.Write "<font>Tour <b><i>" & EnglishName & " </i></b> has been deleted.</font>"
		Case Else
%>
			<script language="javascript">
				document.location = "DetailTour.asp?TourID=<%=TourID%>"
			</script>
<%
	End Select
End If

'Dong ket noi server
conn.Close
Set conn = nothing
%>

</body>

</html>
