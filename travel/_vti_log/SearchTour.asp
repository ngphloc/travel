<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" type="text/css" href="webnews.css">
<title>Search tour</title>
</head>

<body background="IMAGES/Bgr2.jpg" bgproperties="fixed">

<!--#INCLUDE FILE="GeneralInformation.asp"-->
<!--#INCLUDE FILE="LibErrors.asp"-->

<%
on error resume next
attempt = "Create connection object"

'Mo ket noi server
'ConnectionString = Session("cnString")
ConnectionString = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("Data/Travel.mdb")
Set conn = server.CreateObject("ADODB.Connection")
conn.Open ConnectionString
Call CheckErrorVBScript(attempt)

Location = Request.Form("Location")
Transport = Request.Form("Transport")

flagPredicate = false 'Khong phai truy cap lan dau

'Cach truy cap co so du lieu
flagEdit = Request.QueryString("flagEdit")

'Ket noi co so du lieu va hien thi theo trang
numPage = Request.QueryString("numPage")
If numPage="" Then
	flagPredicate = true 'Lan dau truy cap, tao SQL
	numPage = 1 'Khoi tao trang dau tien
End If

'Khoi tao cau SQL cho trang dau tien co numpage = 1
If flagPredicate = true Then
	SQLSelect = " SELECT distinct ID, EnglishName As Name "
	SQLFrom   = " FROM Tours, LocationTours "
	SQLWhere  = " WHERE ID=TourID "
	SQLConnect = " AND "
	If (Location <> "" AND Location <> 0) Then
		SQLWhere  = SQLWhere & SQLConnect & " LocationID=" & Location 
		SQLConnect = " AND "
	End If
	If (Transport <> "" AND Transport <> 0) Then
		SQLWhere = SQLWhere & SQLConnect & " Transport='" & Transport & "'"
	End If
	
	SQL = SQLSelect & SQLFrom & SQLWhere
	'SQL = SQL & " GROUP BY ID"
	
	'Response.Write SQL
	'Response.End
	
	Session("SQL") = SQL
	
Else'flagPredicate=false
	'Cau lenh SQL luu tru truoc do
	SQL = Session("SQL")
End If 'Ket thuc phien khoi tao lan dau : flagPredicate=true

'Mo recordset
Set rs = Server.CreateObject("ADODB.Recordset")
rs.CursorLocation = 3 'adUseClient
rs.PageSize = 10
rs.Open SQL,conn
'Call CheckErrorVBScript(attempt)
Call CheckErrorDatabase(SQL,conn)

'Neu khong co du lieu
If rs.BOF AND flagPredicate=true Then
	Response.Write "Don't have any tour"
	maxPage = 0
Else 'Co du lieu%>
<table border="1" width="600" class=cssTableLayout cellspacing="0" cellpadding="2" bordercolor="#EEEEEE" bgcolor="#EEEEEE" bordercolorlight="#0182DD" bordercolordark="#EEEEEE">
  <tr height=25 bgcolor="#0182DD" align=center class=cssSearchHeader>
	<td colspan=3 align="center" class=cssTDHeader>Tours</td></tr>
  <tr height=25 bgcolor="#0182DD" align=center class=cssSearchHeader>
    <td width="30"  align="center" >No</td>
    <td width="300" align="center" >Name</td></tr>
<%	'Trang can xuat
	maxPage = CInt(rs.PageCount) 'so trang se hien thi theo cau SQL
	rs.Absolutepage = numPage	' trang hien thi
	howmanyrecs = 1
	'Xuat du lieu theo trang hien thi
	Do while not rs.eof and howmanyrecs<=rs.PageSize%>
  <tr class=cssSearchResult  bgcolor="#eeeeee">
    <td align="center"><%=(howmanyrecs+(numpage-1)*rs.PageSize)%></td>
    <td><%Select Case flagEdit
			Case "Update"%>
				<a href="FormEditTour1.asp?TourID=<%=rs("ID")%>&flagAccess=1&flagEdit=Update">
			<%Case Else'Detail%>
				<a href="DetailTour.asp?TourID=<%=rs("ID")%>">
		<%End Select%>
		<%=rs("Name")%></a></td></tr>
	  <%rs.MoveNext
		howmanyrecs = howmanyrecs + 1
	Loop%>
</table>
<%End If%>

<%
'Dong ket noi du lieu
rs.Close
set rs = nothing
conn.Close
set conn = nothing
'Lay ten file dang thi hanh
scriptname = Request.ServerVariables("script_name")

'Hien thi cac  so trang cua mot danh sach dia danh duoc the hien theo yeu cau
pad = "0"
If maxPage <> 0 Then
	For counter = 1 to maxPage
		If counter >= 10 Then	pad = ""
		href = "<a href='" & scriptname & "?numpage=" & counter & "&flagEdit=" & flagEdit &"'>"
		href = href & pad & counter & "</a> "
		Response.Write href
		If counter mod 10 = 0 Then	Response.Write "<br>"
	Next
End If
%>

</body>

</html>
