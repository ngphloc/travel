<html>

<head>
<link rel="stylesheet" type="text/css" href="webnews.css">
<title></title>
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
	'Khong truy cap co so du lieu thong qua cac chi tiet duoc nhap
	If Request.QueryString("flagAccess")="false" Then
		'Cau lenh SQl hien thi danh sach cac dia danh tuy thuoc loai dia danh hay chi muc loai dia danh chuyen biet
		Category	  = Request.QueryString("category")
		indexCategory = Request.QueryString("indexCategory")
		If (Category <> "" And Category <> 0) Then
			SQLSelect = " SELECT Location.ID As ID, Location.EnglishName As Name, Location.EnglishAddress As Address "
			SQLFrom	  = " FROM Location "
			SQLWhere  = " Where Location.CategoryID=" & Category
		
			'Co tim theo chuyen biet cua tung loai dia danh
			If (indexCategory <> "") Then
				Select Case Category
					Case 1'Place to stay
						SQLFrom  = SQLFrom & " , PlaceToStay "
						SQLWhere = SQLWhere & " AND Location.ID = LocationID AND PlaceToStay.CategoryDesignID=" & indexCategory
					Case 2'Place to eat
						SQLFrom	 = SQLFrom & " , PlaceToEat "
						SQLWhere = SQLWhere & " AND Location.ID = LocationID AND PlaceToEat.CategoryFoodID=" & indexCategory
					Case 3'Place of worship
						SQLFrom	 = SQLFrom & " , PlaceOfWorship "
						SQLWhere = SQLWhere & " AND Location.ID = LocationID AND PlaceOfWorship.CategoryWorshipID=" & indexCategory
					Case 4'Shopping
						SQLFrom	 = SQLFrom & " , Shopping "
						SQLWhere = SQLWhere & " AND Location.ID = LocationID AND Shopping.CategoryShoppingID=" & indexCategory
					Case 5'Entertainment
						SQLFrom	 = SQLFrom & " , Entertainment "
						SQLWhere = SQLWhere & " AND Location.ID = LocationID AND Entertainment.CategoryEntertainmentID=" & indexCategory
					Case 6'Museum
					Case 7'Transport
						SQLFrom	 = SQLFrom & " , Transport "
						SQLWhere = SQLWhere & " AND Location.ID = LocationID AND Transport.CategoryTransportID=" & indexCategory
					Case 8'Medical service
						SQLFrom	 = SQLFrom & " , MedicalService "
						SQLWhere = SQLWhere & " AND Location.ID = LocationID AND MedicalService.CategoryMedicalServiceID=" & indexCategory
					Case 9'Book
						SQLFrom	 = SQLFrom & " , Book "
						SQLWhere = SQLWhere & " AND Location.ID = LocationID AND Book.CategoryBookID=" & indexCategory
					Case 10'Visa extension
					Case 11'Bank
					Case 12'Communication
						SQLFrom	 = SQLFrom & " , Communication "
						SQLWhere = SQLWhere & " AND Location.ID = LocationID AND Communication.CategoryCommunicationID=" & indexCategory
					Case 13'Booking-office
						SQLFrom	 = SQLFrom & " , BookingOffice "
						SQLWhere = SQLWhere & " AND Location.ID = LocationID AND BookingOffice.CategoryBookingOfficeID=" & indexCategory
					Case 14'Travel agency
					Case 15'Other
				End Select	
			End If
		End If
	'Truy cap co so du lieu thong qua cac chi tiet duoc nhap de tim kiem chinh xac	
	Else
		'Thong tin chung
		Name     = Request.Form("Name")
		YearBuilt= Request.Form("YearBuilt")
		District = Request.Form("District")
		Precinct = Request.Form("Precinct")
		Address  = Request.Form("Address")
		Phone    = Request.Form("Phone")
		Fax		 = Request.Form("Fax")	
		Email 	 = Request.Form("Email")
		Website  = Request.Form("Website")

		'Thong tin rieng cua tung truy cap theo cac phuong thuc  tim kiem khac nhau
		numType = Request.QueryString("type")
	
		SQLSelect = " SELECT ID, EnglishName As Name, EnglishAddress As Address "
		SQLWhere = " "
		SQLConnect = " WHERE "
	
		Select Case numType
			Case 0'Tat ca dia danh
				Category = Request.Form("Category")
		
				SQLFrom  = " FROM Location "
				If Category <> 0 Then'Tim kiem theo loai dia danh	    
					SQLWhere = SQLWhere  & SQLConnect & " CategoryID=" & Category
					SQLConnect = " AND "
				End If
			Case 1'Tieu chuan Places to Stay
				Design	 = Request.Form("Design")
				Standard = Request.Form("Standard")
				MinPrice = Request.Form("MinPrice")
				MaxPrice = Request.Form("MaxPrice")

				SQLFrom  = " FROM Location, PlaceToStay "
				SQLWhere = SQLWhere & SQLConnect & " ID=LocationID"
				SQLConnect = " AND "
				If Design <> 0 Then		SQLWhere = SQLWhere & SQLConnect & " CategoryDesignID=" & Design
				If Standard <> 0 Then	SQLWhere = SQLWhere & SQLConnect & " Standard =" & Standard
				If MinPrice <> "" Then	SQLWhere = SQLWhere & SQLConnect & " MinPrice>=" & MinPrice 
				If MaxPrice <> "" Then	SQLWhere = SQLWhere & SQLConnect & " MaxPrice<=" & MaxPrice
			Case 2'Tieu chuan Places to eat
				Food = Request.Form("Food")
				EnglishPrincipalDish = Request.Form("EnglishPrincipalDish")
							
				SQLFrom  = " FROM Location, PlaceToEat "
				SQLWhere = SQLWhere & SQLConnect & " ID=LocationID"
				SQLConnect = " AND "
				If Food <> 0 Then	SQLWhere = SQLWhere & SQLConnect & " CategoryFoodID=" & Food
				If EnglishPrincipalDish <> "" Then		SQLWhere = SQLWhere & SQLConnect & " EnglishPrincipalDish LIKE '" & Session("Wildcards") & EnglishPrincipalDish & Session("Wildcards") & "'"
			Case 3'Tieu chuan Places of worship
				Worship = Request.Form("Worship")
					
				SQLFrom  = " FROM Location, PlaceOfWorship "
				SQLWhere = SQLWhere & SQLConnect & " ID=LocationID"
				SQLConnect = " AND "
				If Worship <> 0 Then	SQLWhere = SQLWhere & SQLConnect & " CategoryWorshipID=" & Worship
			Case 4'Tieu chuan Shopping
				Shopping = Request.Form("Shopping")
			
				SQLFrom  = " FROM Location, Shopping "
				SQLWhere = SQLWhere & SQLConnect & " ID=LocationID"
				SQLConnect = " AND "
				If Shopping <> 0 Then	SQLWhere = SQLWhere & SQLConnect & " CategoryShoppingID=" & Shopping
			Case 5'Tieu chuan Entertainment
				Entertainment = Request.Form("Entertainment")
				MinPrice	  = Request.Form("MinPrice")
				MaxPrice	  = Request.Form("MaxPrice")
					
				SQLFrom  = " FROM Location, Entertainment "
				SQLWhere = SQLWhere & SQLConnect & " ID=LocationID"
				SQLConnect = " AND "
				If Entertainment <> 0 Then	SQLWhere = SQLWhere & SQLConnect & " CategoryEntertainmentID=" & Entertainment
				If MinPrice <> "" Then		SQLWhere = SQLWhere & SQLConnect & " MinPrice>=" & MinPrice
				If MaxPrice <> "" Then		SQLWhere = SQLWhere & SQLConnect & " MaxPrice<=" & MaxPrice
			Case 6'Tieu chuan Museum
				MinPrice = Request.Form("MinPrice")
				MaxPrice = Request.Form("MaxPrice")
					
				SQLFrom  = " FROM Location, Museum "
				SQLWhere = SQLWhere & SQLConnect & " ID=LocationID"
				SQLConnect = " AND "
				If MinPrice <> "" Then		SQLWhere = SQLWhere & SQLConnect & " MinPrice>=" & MinPrice
				If MaxPrice <> "" Then		SQLWhere = SQLWhere & SQLConnect & " MaxPrice<=" & MaxPrice
			Case 7'Tieu chuan Transport
				Transport = Request.Form("Transport")
				MinPrice  = Request.Form("MinPrice")
				MaxPrice  = Request.Form("MaxPrice")
					
				SQLFrom  = " FROM Location, Transport "
				SQLWhere = SQLWhere & SQLConnect & " ID=LocationID"
				SQLConnect = " AND "
				If Transport <> 0 Then	SQLWhere = SQLWhere & SQLConnect & " CategoryTransportID=" & Transport
				If MinPrice <> "" Then		SQLWhere = SQLWhere & SQLConnect & " MinPrice>=" & MinPrice
				If MaxPrice <> "" Then		SQLWhere = SQLWhere & SQLConnect & " MaxPrice<=" & MaxPrice
			Case 8'Tieu chuan Medical services
				MedicalService = Request.Form("MedicalService")
			
				SQLFrom  = " FROM Location, MedicalService "
				SQLWhere = SQLWhere & SQLConnect & " ID=LocationID"
				SQLConnect = " AND "
				If MedicalService <> 0 Then	SQLWhere = SQLWhere & SQLConnect & " CategoryMedicalServiceID=" & MedicalService
			Case 9'Tieu chuan Book
				Book = Request.Form("Book")

				SQLFrom  = " FROM Location, Book "
				SQLWhere = SQLWhere & SQLConnect & " ID=LocationID"
				SQLConnect = " AND "
				If Book <> 0 Then	SQLWhere = SQLWhere & SQLConnect & " CategoryBookID=" & Book
			Case 10'Tieu chuan Visa extensions
				SQLFrom  = " FROM Location "
				SQLWhere = SQLWhere  & SQLConnect & " CategoryID=10"
				SQLConnect = " AND "
			Case 11'Tieu chuan Bank
				SQLFrom  = " FROM Location "
				SQLWhere = SQLWhere  & SQLConnect & " CategoryID=11"
				SQLConnect = " AND "
			Case 12'Tieu chuan Communication
				Communication = Request.Form("Communication")
				
				SQLFrom  = " FROM Location, Communication "
				SQLWhere = SQLWhere & SQLConnect & " ID=LocationID"
				SQLConnect = " AND "
				If Communication <> 0 Then	SQLWhere = SQLWhere & SQLConnect & " CategoryCommunicationID=" & Communication
			Case 13'Tieu chuan Booking-office
				BookingOffice = Request.Form("BookingOffice")
			
				SQLFrom  = " FROM Location, BookingOffice "
				SQLWhere = SQLWhere & SQLConnect & " ID=LocationID"
				SQLConnect = " AND "
				If BookingOffice <> 0 Then	SQLWhere = SQLWhere & SQLConnect & " CategoryBookingOfficeID=" & BookingOffice
			Case 14'Tieu chuan TravelAgency
				Inbound  = Request.Form("Inbound")
				Outbound = Request.Form("Outbound") 
				Trekking = Request.Form("Trekking")
				MotorbikingTour = Request.Form("MotorbikingTour")
	
				SQLFrom  = " FROM Location, TravelAgency "
				SQLWhere = SQLWhere & SQLConnect & " ID=LocationID"
				SQLConnect = " AND "
				If Inbound <> "" Then	SQLWhere = SQLWhere & SQLConnect & " Inbound=" & Inbound
				If Outbound <> "" Then	SQLWhere = SQLWhere & SQLConnect & " Outbound=" & Outbound
				If Trekking <> "" Then	SQLWhere = SQLWhere & SQLConnect & " Trekking=" & Trekking
				If MotorbikingTour <> "" Then	SQLWhere = SQLWhere & SQLConnect & " MotorbikingTour=" & MotorbikingTour
			Case 15'Truong hop khac
				SQLFrom  = " FROM Location"
				SQLWhere = SQLWhere & SQLConnect & " CategoryID=15 "
				SQLConnect = " AND "
			Case Else'Truong hop chua thuc hien
				Response.Write "This form is updating so you don't access !!!"
		End Select

		'Tim kiem theo ten
		If Name <> "" Then
			SQLWhere = SQLWhere & SQLConnect & " EnglishName LIKE '" & Session("Wildcards") & Name & Session("Wildcards") & "'"
			SQLConnect = " AND "
		End If
		'Tim kiem theo khoang cach nam thanh lap so voi hien tai
		If YearBuilt <> "0" Then
			datToday = Date()
			thisYear = Year(datToday)
		
			Select case YearBuilt
				Case "5-10"
					SQLWhere = SQLWhere & SQLConnect & " YearBuilt>=" & (thisYear-10) & " AND YearBuilt<=" & (thisYear-5)
				Case "10-15"
					SQLWhere = SQLWhere & SQLConnect & " YearBuilt>=" & (thisYear-15) & " AND YearBuilt<=" & (thisYear-10)
				Case "15-20"
					SQLWhere = SQLWhere & SQLConnect & " YearBuilt>=" & (thisYear-20) & " AND YearBuilt<=" & (thisYear-15)
				Case "20-30"
					SQLWhere = SQLWhere & SQLConnect & " YearBuilt>=" & (thisYear-30) & " AND YearBuilt<=" & (thisYear-20)
				Case "30-50" 
					SQLWhere = SQLWhere & SQLConnect & " YearBuilt>=" & (thisYear-50) & " AND YearBuilt<=" & (thisYear-30)
				Case "50-100"
					SQLWhere = SQLWhere & SQLConnect & " YearBuilt>=" & (thisYear-100) & " AND YearBuilt<=" & (thisYear-50)
				Case "More 100"
					SQLWhere = SQLWhere & SQLConnect & " YearBuilt<=" & (thisYear-100)
				Case "H,n 100"
					SQLWhere = SQLWhere & SQLConnect & " YearBuilt<=" & (thisYear-100)
				Case Else
					SQLWhere = SQLWhere & SQLConnect & " YearBuilt="  & (thisYear-CInt(YearBuilt))
			End Select
	  		SQLConnect = " AND "
		End If
		'Tim kiem theo quan
		If District <> 0 Then
			SQLWhere = SQLWhere & SQLConnect & " DistrictID=" & District 
			SQLConnect = " AND "
		End If
		'Tim kiem theo phuong
		If Precinct <> 0 Then
			SQLWhere = SQLWhere & SQLConnect & " PrecinctID =" & Precinct
			SQLConnect = " AND "
		End If
		'Tim kiem theo dia chi
		If Address <> "" Then
			SQLWhere = SQLWhere & SQLConnect & " EnglishAddress LIKE '" & Session("Wildcards") & Address & Session("Wildcards") & "'"
			SQLConnect = " AND "
		End If
		'Tim kiem theo phone
		If Phone <> "" Then
			SQLWhere = SQLWhere & SQLConnect & " Phone LIKE '" & Session("Wildcards") & Phone & Session("Wildcards") & "'"
			SQLConnect = " AND "
		End If
		'Tim kiem theo fax
		If Fax <> "" Then
			SQLWhere = SQLWhere & SQLConnect & " Fax LIKE '" & Session("Wildcards") & Fax & Session("Wildcards") & "'"
			SQLConnect = " AND "
		End If
		'Tim kiem theo email
		If Email <> "" Then
			SQLWhere = SQLWhere & SQLConnect & " Email LIKE '" & Session("Wildcards") & Email & Session("Wildcards") & "'"
			SQLConnect = " AND "
		End If
		'Tim kiem theo Website
		If Website <> "" Then
			SQLWhere = SQLWhere & SQLConnect & " Website LIKE '" & Session("Wildcards") & Website & Session("Wildcards") & "'"
			SQLConnect = " AND "
		End If
	End If

	SQL = SQLSelect & SQLFrom & SQLWhere
	SQL = SQL & " ORDER BY Location.EnglishName"
	Session("SQL") = SQL
	
Else'flagPredicate=false
	'Cau lenh SQL luu tru truoc do
	SQL = Session("SQL")
End If 'Ket thuc phien khoi tao lan dau : flagPredicate=true

'Mo recordset
Set rs = Server.CreateObject("ADODB.Recordset")
rs.CursorLocation = 3 'adUseClient
rs.PageSize = 20
rs.Open SQL,conn
Call CheckErrorVBScript(attempt)
Call CheckErrorDatabase(SQL,conn)

'Neu khong co du lieu
If rs.BOF AND flagPredicate=true Then
	Response.Write "Don't have any location"
	maxPage = 0
Else 'Co du lieu%>
<table border="1" width="850" class=cssTableLayout cellspacing="0" cellpadding="2" bordercolor="#EEEEEE" bgcolor="#EEEEEE" bordercolorlight="#0182DD" bordercolordark="#EEEEEE">
  <tr height=25 bgcolor="#0182DD" align=center class=cssSearchHeader>
	<td colspan=3 align="center" class=cssTDHeader>Sites</td></tr>
  <tr height=25 bgcolor="#0182DD" align=center class=cssSearchHeader>
    <td width="30"  align="center" >No</td>
    <td width="350" align="center" >Name</td>
    <td width="470"  align="center" >Address</td>
  </tr>
<%	'Trang can xuat
	maxPage = CInt(rs.PageCount) 'so trang se hien thi theo cau SQL
	rs.Absolutepage = numPage	' trang hien thi
	howmanyrecs = 1
	'Xuat du lieu theo trang hien thi
	Do while not rs.eof and howmanyrecs<=rs.PageSize%>
  <tr class=cssSearchResult  bgcolor="#eeeeee">
    <td align="center"><%=(howmanyrecs+(numpage-1)*rs.PageSize)%></td>
    <td><%Select Case flagEdit
			Case "Detail"%>
				<a href="DetailLocation.asp?ID=<%=rs("ID")%>">
			<%Case "Update"%>
				<a href="FormEdit1.asp?ID=<%=rs("ID")%>&flagAccess=1&flagEdit=Update"><!--flag = 0 : chua duoc truy cap du lieu ban dau-->
			<%Case "SearchMap"%>
				<a href="DetailLocation.asp?ID=<%=rs("ID")%>">
		<%End Select%>
		<%=rs("Name")%></a></td>
    <td><%=rs("Address")%></td></tr>
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

