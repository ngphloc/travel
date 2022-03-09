<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Form customize tour</title>
<link rel="stylesheet" type="text/css" href="webnews.css">

<script language="JavaScript">
	function DisplayForm(ID,flagAccess){
		document.FormCustomizeTour.action = "FormCustomizeTour.asp?TourID=" + ID + "&flagAccess=" + flagAccess + "&flagAccessx=0"
		document.FormCustomizeTour.submit()
	}	
	function ReceiveForm(form){
			var flag=1;
			var LocationIDs = form.LocationIDs.value;
			var LocationID  = LocationIDs.split(":");
			//if(LocationID[0]!= LocationID.length-1)	return;
			for (i=1; i<=LocationID[0]; i++){
				if (LocationID[i] == 0){
					flag = 0;
					break;
				}
			} 
			if(flag==0){
				if (confirm("You don't choose entire site.Do you want to continue?")==true){
					document.FormCustomizeTour.action = "ReceiveCustomize.asp"
					document.FormCustomizeTour.submit()
				}
			}
			else{
				document.FormCustomizeTour.action = "ReceiveCustomize.asp"
				document.FormCustomizeTour.submit()
			}
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

TourID = Request.QueryString("TourID")

'Response.Write Request.QueryString("flagAccessx")& "<p>"
'Nhap chuoi LocatonIDs
If Request.QueryString("flagAccessx")=1 Then
		'Lay so dia danh co trong tour
		SQL = " SELECT Count(TourID) As countLocation FROM LocationTours WHERE TourID="&TourID
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		AmountLocation = rs("countLocation")

			'Cac dia danh trong tour
			SQL = "SELECT LocationID, Transport FROM LocationTours WHERE TourID=" & TourID
			
			Set rs = Server.CreateObject("ADODB.Recordset")
			rs.Open SQL, conn
			Call CheckErrorVBScript(attempt)
			Call CheckErrorDatabase(SQL,conn)

			If Not rs.BOF Then
				LocationIDs = CStr(AmountLocation) & ":"
				Transports  = CStr(AmountLocation) & ":"
				
				rs.MoveFirst
				For i = 1 to AmountLocation
					LocationIDs = LocationIDs & rs("LocationID") & ":"
					Transports  = Transports & rs("Transport") & ":"
				
					rs.MoveNext
				Next
			Else
				LocationIDs = "0:"
				Transports  = "0:"
			End If

			rs.Close
			Set rs = nothing

Else
		AmountLocation = Request.Form("AmountLocation")
		LocationIDs = Request.Form("LocationIDs")
		Transports  = Request.Form("Transports")
End If

'Response.Write LocationIDs & "<p>"
'Response.Write Transports & "<p>"
'Response.End

flagAccess = Request.QueryString("flagAccess")

NumLocation = Request.Form("NumLocation")
	If NumLocation = "" Then	NumLocation = 1
Category = Request.Form("Category")

Email = Request.Form("Email")
Location  = Request.Form("Location")'ma ID dia danh dang chon hien tai
Transport = Request.Form("Transport")

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

<form name="FormCustomizeTour" method="POST">
<center>
<table border="1" width="650" class=cssTableLayout cellspacing=0 cellpadding=2 bgColor="#eeeeee" bordercolor="#EEEEEE">
  <tr height=25>
	  <td colspan="4" width="100%" class=cssTDHeader align=center>Customize tour</td></tr>
  <tr>
    <td width="15%" valign="top" class=cssTDTextLabel align=right>Amount site</td>
    <td width="24%" valign="top" colspan="3"><select size="1" name="AmountLocation" class=cssInputText onChange='DisplayForm(<%=TourID%>,"1")'><%Call ListNumLocationInTour(AmountLocation,20)%></select></td></tr>
	<tr>
    <td width="13%" valign="top" class=cssTDTextLabel align=right>Email</td>
    <td width="24%" valign="top" colspan="3"><input type="text" name="Email" class=cssInputText value="<%=Email%>"></td></td>
  <tr>
    <td width="13%" valign="top" class=cssTDTextLabel align=right>Number</td>
    <td width="24%" valign="top"><select size="1" name="NumLocation" class=cssInputText  onChange='DisplayForm(<%=TourID%>,"1")'><%Call ListNumLocationInTour(NumLocation,AmountLocation)%></select></td>
    <td width="15%" valign="top" class=cssTDTextLabel align=right>By transport</td>
    <td width="48%" valign="top"><select size="1" name="Transport" class=cssInputText onChange='DisplayForm(<%=TourID%>,"0")'><%Call ListTransportInTour(Transport,1)%></select></td></tr>
  <tr>
    <td width="13%" valign="top" class=cssTDTextLabel align=right>Category</td>
    <td width="24%" valign="top"><select size="1" name="Category" class=cssInputText onChange='DisplayForm(<%=TourID%>,"-1")'><%Call ListCategory(Category,conn,0)%></select></td>
    <td width="15%" valign="top" class=cssTDTextLabel align=right>Site</td>
    <td width="48%" valign="top"><select size="1" name="Location" class=cssInputText  onChange='DisplayForm(<%=TourID%>,"0")'><%Call ListLocation(Location,Category,conn)%></select></td></tr>
</table>
  
  <!--Luu thong tin FormEditTour1
  <INPUT type="hidden" name="AmountLocation" value="<%=AmountLocation%>">-->
  <INPUT type="hidden" name="LocationIDs" value="<%=LocationIDs%>">
  <INPUT type="hidden" name="Transports" value="<%=Transports%>">
  
  
	<!--Nut dieu khien-->  
<p>
	<INPUT type="submit" value="Send" id="Send" onClick="ReceiveForm(this.form)"><INPUT type="reset" value="Reset" name="Reset">
</center>
</form>
<%
'Dong ket noi server
conn.Close
Set conn = nothing
%>

</body>

</html>
