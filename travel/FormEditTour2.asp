<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Form Edit Tour 2</title>
<link rel="stylesheet" type="text/css" href="webnews.css">

<script language="JavaScript">
	function DisplayForm(ID,flagEdit,flagAccess){
		document.FormEditTour2.action = "FormEditTour2.asp?TourID=" + ID + "&flagEdit=" + flagEdit + "&flagAccess=" + flagAccess
		document.FormEditTour2.submit()
	}	
//Back
	function FormBack(ID,flagEdit){
		document.FormEditTour2.action = "FormEditTour1.asp?TourID=" + ID + "&flagEdit=" + flagEdit
	}
</script>

</head>

<body background="IMAGES/Bgr2.jpg" bgproperties="fixed">

<!--#INCLUDE FILE="LibErrors.asp"-->
<!--#INCLUDE FILE="LibJavascript.asp"-->
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

TourID     = Request.QueryString("TourID")
flagEdit   = Request.QueryString("flagEdit")
flagAccess = CInt(Request.QueryString("flagAccess"))

AmountLocation = Request.Form("AmountLocation")'tong so dia danh trong tour
NumLocation = Request.Form("NumLocation")'so thu tu cua dia danh duoc chon trong tour
	If NumLocation = "" Then	NumLocation = 1
Category = Request.Form("Category")

Location = Request.Form("Location")'ma ID dia danh dang chon hien tai
Transport = Request.Form("Transport")

LocationIDs = Request.Form("LocationIDs")'Lay chuoi chua cac ID dia danh trong tour
Transports  = Request.Form("Transports")

'Lay thong tin ve cac dia danh trong tour
LocationID  = Split(LocationIDs, ":", -1, vbTextCompare)
TransportID = Split(Transports, ":", -1, vbTextCompare)

'Neu duoc phep truy cap co so du lieu : hien thi thong tin dia danh trong tour theo so thu tu tuong ung
'Nguoc lai : tim cac dia danh co loai tuong ung va cap nhat cac dia danh trong tour theo so thu tu tuong ung
If flagAccess = 1 Then
	
	'Cap nhat so dia danh trong tour neu co su thay doi ve so dia danh
	maxLocation = CInt(LocationID(0))
	If maxLocation <> AmountLocation Then
		If maxLocation < AmountLocation Then
			maxLocation = maxLocation+1
			'Them nhung dia danh can them vao trong tour voi mac dinh ban dau la ma dia danh = 0
			For i = maxLocation To CInt(AmountLocation)
				LocationIDs = LocationIDs & "0:"
				Transports  = Transports & "0:"
			Next
		End If
		LocationID = Split(LocationIDs, ":", -1, vbTextCompare)
		TransportID = Split(Transports, ":", -1, vbTextCompare)
		
		LocationIDs = CStr(AmountLocation) & ":"
		Transports  = CStr(AmountLocation) & ":"
		
		For i = 1 To CInt(AmountLocation)
			LocationIDs = LocationIDs & LocationID(i) & ":"
			Transports  = Transports & TransportID(i) & ":"
		Next
	End If

	'Neu dia danh trong tour chua duoc chon = "0" tuong ung voi so thu tu
	'Nguoc lai co dia danh trong tour tuong ung vou so thu tu
	If LocationID(NumLocation) = "0" Then
		Category = 0
	Else
		Category = 0
		'Dia danh trong tour theo so thu tu
		SQL = "SELECT ID, CategoryID FROM Location WHERE ID=" & LocationID(NumLocation)
			
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		Call CheckErrorDatabase(SQL,conn)

		If Not rs.BOF Then
			Location = rs("ID")
			
			Category = rs("CategoryID")
		End If
		
		rs.Close
		Set rs = nothing

		Transport = TransportID(NumLocation)
			
	End If
Else
	LocationID(NumLocation)  = Location
	TransportID(NumLocation) = Transport
	
	'Dat gia tri dia danh cua so thu tu nay = 0 vi chua chon duoc ten dia danh tuong ung trong loai
	If flagAccess = -1 Then		LocationID(NumLocation) = 0
		
	'Cap nhat lai cac dia danh trong tour
	LocationIDs = CStr(AmountLocation) & ":"'cap nhat thong tin so dia danh da luu
	Transports  = CStr(AmountLocation) & ":"
	For i = 1 To AmountLocation
		LocationIDs = LocationIDs & LocationID(i) & ":"
		Transports  = Transports & TransportID(i) & ":"
	Next
End If

%>

<form name="FormEditTour2" method="POST">
<center>
<table border="1" width="650" class=cssTableLayout cellspacing=0 cellpadding=2 bgColor="#eeeeee" bordercolor="#EEEEEE">
  <tr height=25>
	<td colspan="4" width="100%" class=cssTDHeader align=center>Detail tour</td></tr>
  <tr><td width="100%" colspan="4" align="center" class=cssTDText>Step 2 of 2<p></td></tr>
  <tr>
    <td width="13%" valign="top" class=cssTDTextLabel align=right>Number</td>
    <td width="24%" valign="top"><select size="1" name="NumLocation" class=cssInputText onChange='DisplayForm(<%=TourID%>,"<%=flagEdit%>","1")'><%Call ListNumLocationInTour(NumLocation,AmountLocation)%></select></td>
    <td width="15%" valign="top" class=cssTDTextLabel align=right>By transport</td>
    <td width="48%" valign="top"><select size="1" name="Transport" class=cssInputText onChange='DisplayForm(<%=TourID%>,"<%=flagEdit%>","0")'><%Call ListTransportInTour(Transport,1)%></select></td></tr>
  <tr>
    <td width="13%" valign="top" class=cssTDTextLabel align=right>Category</td>
    <td width="24%" valign="top"><select size="1" name="Category" class=cssInputText onChange='DisplayForm(<%=TourID%>,"<%=flagEdit%>","-1")'><%Call ListCategory(Category,conn,0)%></select></td>
    <td width="15%" valign="top" class=cssTDTextLabel align=right>Site</td>
    <td width="48%" valign="top"><select size="1" name="Location" class=cssInputText onChange='DisplayForm(<%=TourID%>,"<%=flagEdit%>","0")'><%Call ListLocation(Location,Category,conn)%></select></td></tr>
</table>
  
  <!--Luu thong tin FormEditTour1-->
  <INPUT type="hidden" name="EnglishName" value="<%=Request.Form("EnglishName")%>">
  <INPUT type="hidden" name="EnglishIntroduction" value="<%=Request.Form("EnglishIntroduction")%>">
  <INPUT type="hidden" name="AmountLocation" value="<%=Request.Form("AmountLocation")%>">
  <INPUT type="hidden" name="LocationIDs" value="<%=LocationIDs%>">
  <INPUT type="hidden" name="Transports" value="<%=Transports%>">
  
  
	<!--Nut dieu khien-->  
<p>
<table border="0" width="92%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="10%"><input type="submit" value="Back" name="Back" onClick=FormBack(<%=TourID%>,"<%=flagEdit%>")></td>
    <td width="70%"></td>
     <%If flagEdit="Add" Then%>
    <td width="10%"><input type="submit" value="Add" name="Add" onClick=FinishEditTour(this.form,<%=TourID%>,"Add")></td>
    <%Else%>
    <td width="10%"><input type="submit" value="Delete" name="Delete" onClick=FinishEditTour(this.form,<%=TourID%>,"Delete")></td>
    <td width="10%"><input type="submit" value="Update" name="Update" onClick=FinishEditTour(this.form,<%=TourID%>,"Update")></td>
   <%End If%>
   <td width="10%"><input type="reset" value="Cancel" name="Cancel" onClick='CancelEditTour(this.form,"<%=flagEdit%>")'></td>
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
