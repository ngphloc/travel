<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>General Information</title>

<!--#INCLUDE FILE="LibErrors.asp"-->

<%
Sub ListTransportInTour(Transport, num)
	If num = 0 Then
		Response.Write "<option value='0' selected> --&-- </option>"
	End If

	Response.Write "<option value='Bus' "
		If Transport = "Bus" Then		Response.Write " selected"
		Response.Write ">"&"Bus"&"</option>"
	Response.Write "<option value='Bicycle' "
		If Transport = "Bicycle" Then	Response.Write " selected"
		Response.Write ">"&"Bicycle"&"</option>"
	Response.Write "<option value='Car' "
		If Transport = "Car" Then		Response.Write " selected"
		Response.Write ">"&"Car"&"</option>"
	Response.Write "<option value='Cyclo' "
		If Transport = "Cyclo" Then		Response.Write " selected"
		Response.Write ">"&"Cyclo"&"</option>"
	Response.Write "<option value='Motorbike' "
		If Transport = "Motorbike" Then	Response.Write " selected"
		Response.Write ">"&"Motorbike"&"</option>"
End Sub

'Hien thi danh sach dia danh theo loai
Sub ListLocation(Location, Category, conn)
	on error resume next
	attempt = "Create connection object"

	Response.Write "<option value='0' selected> --&-- </option>"

	If Category = "" Or Category = 0 Then	Exit Sub

	SQL = "SELECT ID, EnglishName As Name FROM Location WHERE CategoryID=" & Category & " ORDER BY EnglishName"
	
	Set rs = Server.CreateObject("ADODB.Recordset")		
	rs.Open SQL, conn
    Call CheckErrorVBScript(attempt)
    Call CheckErrorDatabase(SQL,conn)

	If Not rs.BOF Then
		rs.MoveFirst
		Do While Not rs.EOF
			Response.Write "<option value='" & rs("ID") & "' "
			If rs("ID") = CInt(Location) Then		Response.Write " selected"
			Response.Write ">" & rs("Name") & "</option>"
			rs.MoveNext
		Loop
	End If

	rs.Close
	Set rs = nothing
End Sub

'Hien thi danh sach loai dia danh
Sub ListCategory(Category, conn, flag)
	on error resume next
	attempt = "Create connection object"

	SQL = "Select ID, EnglishName As Name From LocationCategory"
	
    Set rs = server.CreateObject("ADODB.Recordset")
    rs.Open SQL, conn
    Call CheckErrorVBScript(attempt)
    Call CheckErrorDatabase(SQL,conn)

    If Not (rs.BOF) Then
        rs.MoveFirst
        If flag = 0 Then	Response.Write "<option value='0'> --&-- </option>"
        Do While Not rs.EOF
            Response.Write "<option value='" & rs("ID") & "' "
            If rs("ID") = CInt(Category) Then	Response.Write " selected"
            Response.Write ">" & rs("Name") & "</option>"
            rs.MoveNext
        Loop
    Else
		Response.Write "Don't have any category or don't access database !!!"
    End If
    
    rs.Close
    Set rs = Nothing
End Sub

'Hien thi danh sach quan
Sub ListDistrict(District, conn, flag)
	on error resume next
	attempt = "Create connection object"

    SQL = "Select ID, EnglishName As Name From District Order By EnglishName"
    Set rs = server.CreateObject("ADODB.Recordset")
    rs.Open SQL, conn
    Call CheckErrorVBScript(attempt)
    Call CheckErrorDatabase(SQL,conn)
    
    If Not (rs.BOF) Then
        rs.MoveFirst
		If flag = 0 Then		Response.Write "<option value=0> --&-- </option>"
        Do While Not rs.EOF
            Response.Write "<option value='" & rs("ID") & "' "
            If rs("ID") = CInt(District) Then Response.Write " selected"
            Response.Write ">" & rs("Name") & "</option>"
            rs.MoveNext
        Loop
    Else
		Response.Write "Don't have any district or don't access database !!!"
    End If

    rs.Close
    Set rs = Nothing
End Sub

'Hien thi danh sach phuong
Sub ListPrecinct(Precinct, District, conn)
	on error resume next
	attempt = "Create connection object"
	
    If District = 0 Then	Exit Sub
  
	SQL = "SELECT ID, EnglishName As Name FROM Precinct WHERE DistrictID="&District&" ORDER BY EnglishName"
    Set rs = server.CreateObject("ADODB.Recordset")
    rs.Open SQL, conn
    Call CheckErrorVBScript(attempt)
    Call CheckErrorDatabase(SQL,conn)
    
    If Not (rs.BOF) Then
        rs.MoveFirst
		Response.Write "<option value='0' selected> --&-- </option>"
        Do While Not rs.EOF
            Response.Write "<option value='" & rs("ID") & "' "
			If (Precinct <> 0 Or Precinct <> "") Then
				If (rs("ID") = CInt(Precinct)) Then		Response.Write " selected"
			End If
            Response.Write ">" & rs("Name") & "</option>"
            rs.MoveNext
        Loop
    Else
		Response.Write "Don't have any precinct or don't access database !!!"
    End If

    rs.Close
    Set rs = Nothing
End Sub

'Ham hien thi danh sach cac kieu design cua mot noi o cho du khach : minihotel, hotel, guesthouse, village
'	. Tham so vao : + Design : kieu phai chon trong danh sach design
'					+ conn	 : bien truy cap co so du lieu
'	. Tham so ra  : khong co	
Sub ListDesign(Design, conn)
	on error resume next
	attempt = "Create connection object"

	SQL = "SELECT ID, EnglishName As Name FROM CategoryDesign"
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL, conn
    Call CheckErrorVBScript(attempt)
    Call CheckErrorDatabase(SQL,conn)

    If Not (rs.BOF) Then
        rs.MoveFirst
		Response.Write "<option value='0' selected> --&-- </option>"
        Do While Not rs.EOF
            Response.Write "<option value='" & rs("ID") & "' "
			If (Design <> "") Then
				If (rs("ID")=CInt(Design)) Then		Response.Write " selected "
			End If
            Response.Write ">" & rs("Name") & "</option>"
            rs.MoveNext
        Loop
    Else
		Response.Write "Don't have any design don't access database"
	End If	
	
	rs.Close
	Set rs = nothing
End Sub

'Ham hien thi danh sach cac loai mon an cua cac nuoc. Vd: Viet nam, Thai, Hoa, Nhat, ...
'	. Tham so vao : + Food : loai mon an trong danh sach food
'					+ conn : bien truy cap co so du lieu
'	. Tham so ra  : khong co	
Sub ListFood(Food, conn)
	on error resume next
	attempt = "Create connection object"

	SQL = "SELECT ID, EnglishName As Name FROM CategoryFood"
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL, conn
    Call CheckErrorVBScript(attempt)
    Call CheckErrorDatabase(SQL,conn)

	Response.Write "<option value='0' selected> --&-- </option>"
	If Not rs.BOF Then
		rs.MoveFirst
		Do While Not rs.EOF
            Response.Write "<option value='" & rs("ID") & "' "
			If (Food <> "") Then
				If (rs("ID") = CInt(Food)) Then Response.Write " selected"
            End If
            Response.Write ">" & rs("Name") & "</option>"
            rs.MoveNext
		Loop
	Else
		Response.Write "Don't have any category food don't access database"
	End If	
	
	rs.Close
	Set rs = nothing
End Sub

'Ham hien thi danh sach mot so tin nguong, tho phung
'	. Tham so vao : + Worship : tin nguong hay tho phung trong danh sach
'					+ conn	 : bien truy cap co so du lieu
'	. Tham so ra  : khong co	
Sub ListWorship(Worship, conn)
	on error resume next
	attempt = "Create connection object"

	SQL = "SELECT ID, EnglishName As Name FROM CategoryWorship"
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL, conn
    Call CheckErrorVBScript(attempt)
    Call CheckErrorDatabase(SQL,conn)

	Response.Write "<option value='0' selected> --&-- </option>"
	If Not rs.BOF Then
		rs.MoveFirst
		Do While Not rs.EOF
            Response.Write "<option value='" & rs("ID") & "' "
            If (Worship<>"") Then
				If (rs("ID") = CInt(Worship)) Then Response.Write " selected"
			End If
            Response.Write ">" & rs("Name") & "</option>"
            rs.MoveNext
		Loop
	Else
		Response.Write "Don't have any worship don't access database"
	End If	
	
	rs.Close
	Set rs = nothing
End Sub

'Ham hien thi danh dach cac noi co the shopping
'	. Tham so vao : + Shopping : tin nguong hay tho phung trong danh sach
'					+ conn	   : bien truy cap co so du lieu
'	. Tham so ra  : khong co	
Sub ListShopping(Shopping, conn)
	on error resume next
	attempt = "Create connection object"

	SQL = "SELECT ID, EnglishName As Name FROM CategoryShopping"
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL, conn
    Call CheckErrorVBScript(attempt)
    Call CheckErrorDatabase(SQL,conn)

	Response.Write "<option value='0' selected> --&-- </option>"
	If Not rs.BOF Then
		rs.MoveFirst
		Do While Not rs.EOF
            Response.Write "<option value='" & rs("ID") & "' "
            If (Shopping<>"") Then
				If (rs("ID") = CInt(Shopping)) Then Response.Write " selected"
			End If
            Response.Write ">" & rs("Name") & "</option>"
            rs.MoveNext
		Loop
	Else
		Response.Write "Don't have any shopping don't access database"
	End If	
	
	rs.Close
	Set rs = nothing
End Sub

'Ham hien thi danh sach cac loai hinh giai tri
'	. Tham so vao : + Entertainment : loai hinh giai tri
'					+ conn			: bien truy cap co so du lieu
'	. Tham so ra  : khong co	
Sub ListEntertainment(Entertainment, conn)
	on error resume next
	attempt = "Create connection object"

	SQL = "SELECT ID, EnglishName As Name FROM CategoryEntertainment ORDER BY EnglishName"
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL, conn
    Call CheckErrorVBScript(attempt)
    Call CheckErrorDatabase(SQL,conn)

	Response.Write "<option value='0' selected> --&-- </option>"
	If Not rs.BOF Then
		rs.MoveFirst
		Do While Not rs.EOF
            Response.Write "<option value='" & rs("ID") & "' "
			If (Entertainment<>"") Then
				If rs("ID") = CInt(Entertainment) Then Response.Write " selected"
			End If
            Response.Write ">" & rs("Name") & "</option>"
            rs.MoveNext
		Loop
	Else
		Response.Write "Don't have any design don't access database"
	End If	
	
	rs.Close
	Set rs = nothing
End Sub

'Ham hien thi danh sach cac loai xe dung di chuyen trong thanh pho
'	. Tham so vao : + Transport : loai hinh giai tri
'					+ conn		: bien truy cap co so du lieu
'	. Tham so ra  : khong co	
Sub ListTransport(Transport, conn)
	on error resume next
	attempt = "Create connection object"

	SQL = "SELECT ID, EnglishName As Name FROM CategoryTransport ORDER BY EnglishName"
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL, conn
    Call CheckErrorVBScript(attempt)
    Call CheckErrorDatabase(SQL,conn)

	Response.Write "<option value='0' selected> --&-- </option>"
	If Not rs.BOF Then
		rs.MoveFirst
		Do While Not rs.EOF
            Response.Write "<option value='" & rs("ID") & "' "
			If (Transport<>"") Then
				If rs("ID") = CInt(Transport) Then Response.Write " selected"
			End If
            Response.Write ">" & rs("Name") & "</option>"
            rs.MoveNext
		Loop
	Else
		Response.Write "Don't have any design don't access database"
	End If	
	
	rs.Close
	Set rs = nothing
End Sub

'Ham hien thi danh sach cac noi co chua (ban, cho muon) sach
'	. Tham so vao : + Book : loai hinh giai tri
'					+ conn		: bien truy cap co so du lieu
'	. Tham so ra  : khong co	
Sub ListBook(Book, conn)
	on error resume next
	attempt = "Create connection object"

	SQL = "SELECT ID, EnglishName As Name FROM CategoryBook"
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL, conn
    Call CheckErrorVBScript(attempt)
    Call CheckErrorDatabase(SQL,conn)

	Response.Write "<option value='0' selected> --&-- </option>"
	If Not rs.BOF Then
		rs.MoveFirst
		Do While Not rs.EOF
            Response.Write "<option value='" & rs("ID") & "' "
            If (Book<>"") Then
				If rs("ID") = CInt(Book) Then Response.Write " selected"
			End If
            Response.Write ">" & rs("Name") & "</option>"
            rs.MoveNext
		Loop
	Else
		Response.Write "Don't have any design don't access database"
	End If	
	
	rs.Close
	Set rs = nothing
End Sub

'Ham hien thi danh sach cac loai hinh thong tin lien lac
'	. Tham so vao : + Communication : loai hinh lien lac
'					+ conn			: bien truy cap co so du lieu
'	. Tham so ra  : khong co	
Sub ListCommunication(Communication, conn)
	on error resume next
	attempt = "Create connection object"

	SQL = "SELECT ID, EnglishName As Name FROM CategoryCommunication ORDER BY EnglishName"
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL, conn
    Call CheckErrorVBScript(attempt)
    Call CheckErrorDatabase(SQL,conn)

	Response.Write "<option value='0' selected> --&-- </option>"
	If Not rs.BOF Then
		rs.MoveFirst
		Do While Not rs.EOF
            Response.Write "<option value='" & rs("ID") & "' "
            If (Communication<>"") Then
				If rs("ID") = CInt(Communication) Then Response.Write " selected"
            End If
            Response.Write ">" & rs("Name") & "</option>"
            rs.MoveNext
		Loop
	Else
		Response.Write "Don't have any communication type don't access database"
	End If	
	
	rs.Close
	Set rs = nothing
End Sub

'Ham hien thi danh sach cac dich vu y te
'	. Tham so vao : + MedicalService : loai dich vu y te
'					+ conn			 : bien truy cap co so du lieu
'	. Tham so ra  : khong co	
Sub ListMedicalService(MedicalService, conn)
	on error resume next
	attempt = "Create connection object"

	SQL = "SELECT ID, EnglishName As Name FROM CategoryMedicalService ORDER BY EnglishName"
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL, conn
    Call CheckErrorVBScript(attempt)
    Call CheckErrorDatabase(SQL,conn)

	Response.Write "<option value='0' selected> --&-- </option>"
	If Not rs.BOF Then
		rs.MoveFirst
		Do While Not rs.EOF
            Response.Write "<option value='" & rs("ID") & "' "
            If (MedicalService<>"") Then
				If rs("ID") = CInt(MedicalService) Then Response.Write " selected"
            End If
            Response.Write ">" & rs("Name") & "</option>"
            rs.MoveNext
		Loop
	Else
		Response.Write "Don't have any communication type don't access database"
	End If	
	
	rs.Close
	Set rs = nothing
End Sub

'Ham hien thi danh sach cac loai ve duoc dat
'	. Tham so vao : + BookingOffice : loai hinh lien lac
'					+ conn			: bien truy cap co so du lieu
'	. Tham so ra  : khong co	
Sub ListBookingOffice(BookingOffice, conn)
	on error resume next
	attempt = "Create connection object"

	SQL = "SELECT ID, EnglishName As Name FROM CategoryBookingOffice ORDER BY EnglishName"
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL, conn
    Call CheckErrorVBScript(attempt)
    Call CheckErrorDatabase(SQL,conn)

	Response.Write "<option value='0' selected> --&-- </option>"
	If Not rs.BOF Then
		rs.MoveFirst
		Do While Not rs.EOF
            Response.Write "<option value='" & rs("ID") & "' "
			If (BookingOffice<>"") Then
				If rs("ID") = CInt(BookingOffice) Then Response.Write " selected"
            End If
            Response.Write ">" & rs("Name") & "</option>"
            rs.MoveNext
		Loop
	Else
		Response.Write "Don't have any communication type don't access database"
	End If	
	
	rs.Close
	Set rs = nothing
End Sub

'Hien thi danh sach hinh anh
Sub ListImage(ID, MainImage, conn)
	on error resume next
	attempt = "Create connection object"
    
    SQL = "SELECT ID, Path FROM Images"
    If ID<>"" Then	SQL = SQL & ", LocationImages WHERE ID=ImageID AND LocationID=" & ID
    Set rs = server.CreateObject("ADODB.Recordset")
    rs.Open SQL, conn
    Call CheckErrorVBScript(attempt)
    Call CheckErrorDatabase(SQL,conn)
    
    If ID<>"" Then	Response.Write "<option value='0' selected> --&-- </option>"
    
    If Not (rs.BOF) Then
        rs.MoveFirst
        Do While Not rs.EOF
            'Lay ten anh
            'tempPath = Split(rs("Path"), "/", -1, vbTextCompare)
            Response.Write "<option value='" & rs("ID") & "' "
            If rs("ID") = CInt(MainImage) Then Response.Write " selected"
            Response.Write ">" & rs("Path") & "</option>"
            rs.MoveNext
        Loop
    Else
		Response.Write "Don't have any image or don't access database !!!"
    End If
    
    rs.Close
    Set rs = Nothing
End Sub

'Hien thi danh sach am thanh
Sub ListSound(ID, MainSound, conn)
	on error resume next
	attempt = "Create connection object"
    
    SQL = "SELECT ID, Path FROM Sounds"
    If ID<>"" Then	SQL = SQL & ", LocationSounds WHERE Sounds.ID=SoundID AND LocationID=" & ID
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open SQL, conn
    Call CheckErrorVBScript(attempt)
    Call CheckErrorDatabase(SQL,conn)
    
    If ID<>"" Then	Response.Write "<option value='0' selected> --&-- </option>"
    
    If Not (rs.BOF) Then
        rs.MoveFirst
        Do While Not rs.EOF
            'Lay ten anh
'            tempPath = Split(rs("Path"), "/", -1, vbTextCompare)
            Response.Write "<option value='" & rs("ID") & "' "
            If rs("ID") = CInt(MainSound) Then Response.Write " selected"
            Response.Write ">" & rs("Path") & "</option>"
            rs.MoveNext
        Loop
    Else
		Response.Write "Don't have any soundor don't access database !!!"
    End If
    
    rs.Close
    Set rs = Nothing

End Sub

'Hien thi danh sach phim
Sub ListMovie(ID, MainMovie, conn)
	on error resume next
	attempt = "Create connection object"
    
    SQL = "SELECT ID, Path FROM Movies"
    If ID<>0 Then	SQL = SQL & ",LocationMovies WHERE Movies.ID=MovieID AND LocationID=" & ID
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open SQL, conn
    Call CheckErrorVBScript(attempt)
    Call CheckErrorDatabase(SQL,conn)
    
    Response.Write "<option value='0' selected> --&-- </option>"
    
    If Not (rs.BOF) Then
        rs.MoveFirst
        Do While Not rs.EOF
            'Lay ten anh
'            tempPath = Split(rs("Path"), "/", -1, vbTextCompare)
            Response.Write "<option value='" & rs("ID") & "' "
            If rs("ID") = MainMovie Then Response.Write " selected"
            Response.Write ">" & rs("Path") & "</option>"
            rs.MoveNext
        Loop
    Else
		Response.Write "Don't have any movie or don't access database !!!"
    End If
    
    rs.Close
    Set rs = Nothing
End Sub

'Ham them hinh anh vao mot dia danh
'	. Tham so vao : .ID: ma dia danh
'					.Image: ma hinh anh
'					.conn: bien ket noi server
Sub AddImage(ID,Image,conn)
	on error resume next
	attempt = "Create connection object"

	SQL = "INSERT INTO LocationImages (LocationID, ImageID) " &_
				" VALUES ("&ID&", "&Image&")"
	conn.Execute(SQL)
    Call CheckErrorVBScript(attempt)
    Call CheckErrorDatabase(SQL,conn)
End Sub

'Ham them am thanh vao mot dia danh
'	. Tham so vao : .ID: ma dia danh
'					.Sound: ma am thanh
'					.conn: bien ket noi server
Sub AddSound(ID,Sound,conn)
	on error resume next
	attempt = "Create connection object"

	SQL = "INSERT INTO LocationSounds (LocationID, SoundID) " &_
				" VALUES ("&ID&", "&Sound&")"
	conn.Execute(SQL)
    Call CheckErrorVBScript(attempt)
    Call CheckErrorDatabase(SQL,conn)
End Sub

Sub DelImage(ID,Image,conn)
	on error resume next
	attempt = "Create connection object"

	SQL = "DELETE " &_
			" FROM LocationImages " &_
			" WHERE LocationID="&ID&" AND ImageID=" & Image
	conn.Execute(SQL)
    Call CheckErrorVBScript(attempt)
    Call CheckErrorDatabase(SQL,conn)
End Sub

Sub DelSound(ID,Sound,conn)
	on error resume next
	attempt = "Create connection object"

	SQL = "DELETE " &_
			" FROM LocationSounds " &_
			" WHERE LocationID="&ID&" AND SoundID=" & Sound
	conn.Execute(SQL)
    Call CheckErrorVBScript(attempt)
    Call CheckErrorDatabase(SQL,conn)
End Sub

'Hien thi danh sach chuan khach san
Sub ListStandard(Standard)
    Response.Write "<option value='0' selected> --&-- </option>"
    For i=1 To 5
        Response.Write "<option value='" & i & "' "
        If (Standard<>"") Then
			If (i=CInt(Standard)) Then	Response.Write " selected"
		End If
        Response.Write ">" & i & "</option>"
    Next
End Sub

'Hien thi danh sach nam xay dung
Sub ListYearBuilt(YearBuilt)
	Response.Write "<option value='0' selected> --&-- </option>"
    Response.Write "<option value='1' "
		If YearBuilt = "1" Then		Response.Write " selected"
    Response.Write ">1</option>"
    Response.Write "<option value='2' "
    	If YearBuilt = "2" Then		Response.Write " selected"
    Response.Write ">2</option>"
    Response.Write "<option value='3' "
    	If YearBuilt = "3" Then			Response.Write " selected"
	Response.Write ">3</option>"
    Response.Write "<option value='4' "
   		If YearBuilt = "4" Then			Response.Write " selected"
	Response.Write ">4</option>"
    Response.Write "<option value='5' "
   		If YearBuilt = "5" Then			Response.Write " selected"
	Response.Write ">5</option>"
    Response.Write "<option value='5-10' "
    	If YearBuilt = "5-10" Then		Response.Write " selected"
	Response.Write ">5-10</option>"
    Response.Write "<option value='10-15' "
    	If YearBuilt = "10-15" Then		Response.Write " selected"
	Response.Write ">10-15</option>"
    Response.Write "<option value='15-20' "
    	If YearBuilt = "15-20" Then		Response.Write " selected"
	Response.Write ">15-20</option>"
    Response.Write "<option value='20-30' "
    	If YearBuilt = "20-30" Then		Response.Write " selected"
	Response.Write ">20-30</option>"
    Response.Write "<option value='30-50' "
    	If YearBuilt = "30-50" Then		Response.Write " selected"
	Response.Write ">30-50</option>"
    Response.Write "<option value='50-100' "
    	If YearBuilt = "50-100" Then	Response.Write " selected"
	Response.Write ">50-100</option>"
	Response.Write "<option value='More 100' "
		If YearBuilt = "More 100" Then	Response.Write " selected"
	Response.Write ">More 100</option>"
End Sub

'Danh sach so dia danh trong tour du lich
Sub ListNumLocationInTour(numLocation,numMaxLocation)
	For i=1 to numMaxLocation
		Response.Write "<option value='" & i & "' "
		If i = CInt(numLocation)Then	Response.Write " selected"
		Response.Write ">" & i & "</option>"
	Next
End Sub

'Ghi thong tin len file
'	.Tham so vao : .FileName : ten file
'				   .Text	 : thong tin can ghi len file
'	. Tham so tra ve : ten file duoc ghi
Function WriteFile (FileName, Text)
	'Khong co thong tin dia danh thi khong ghi file
	If Text = "" Then	
		WriteFile = ""
		Exit Function
	End If

	whichname = FileName & ".txt"
	whichdir  = "/Travel/Text/"
	whichfile = whichdir & whichname
	whichFN   = Server.MapPath (whichfile)

	Set fstemp = Server.CreateObject("Scripting.FileSystemObject")
	'Neu file da ton tai thi ghi de len file
	Set filetemp = fstemp.CreateTextFile(whichFN, true)
	Call CheckErrorVBScript("Create file object")

	filetemp.WriteLine Text

	filetemp.close
	Set filetemp = nothing
	set fstemp = nothing
	
	WriteFile = whichname
End Function

'Doc file 
'	.Tham so vao : .ten file
'				   .co nhan biet doc trong area hay o ngoai
'	.Tham so tra ve : noi dung trong file
Function ReadFile(FileName, flag)
	'Neu dia danh chua co thong tin gioi thieu
	If FileName = "" Then	
		ReadFile = ""
		Exit Function
	End If
	
	whichdir  = "/Travel/Text/"
	whichfile = whichdir & FileName
	whichFN   = Server.MapPath (whichfile)
	
	Set fs = Server.CreateObject("Scripting.FileSystemObject")
	Set thisfile = fs.OpenTextFile(whichFN, 1, true)
	Call CheckErrorVBScript("Create file object")

	text = ""
	chrConnect = ""
	do while not thisfile.AtEndOfStream
		thisline = chrConnect & thisfile.readline 
		If flag = 1 Then
			chrConnect = Chr(13)
		Else
			chrConnect = "<br>"
		End If
		text = text & thisline
	loop

	thisfile.Close
	Set thisfile = nothing
	Set fs = nothing
	
	ReadFile = text
End Function

'Hoan doi chuoi (dung hoan doi textbox hay area): kiem tra chuoi xet co rong hay khong
'	.Tham so vao : str : chuoi can xet
'	.Ham tra ve  : . Neu rong hay : tra ve chuoi = NULL
'				   . Nguoc lai tra ve chuoi binh thuong
Function SwapText(str)
	SwapText = "NULL"
	If str <> "" Then	SwapText = "'" & str & "'"
End Function

'Hoam doi so (dung hoan doi listbox) : kiem tra so co = 0
'	.Tham so vao : num : so can xet
'	.Ham tra ve  : . Neu num = 0 : tra ve chuoi NULL
'				   . Nguoc lai : tra ve int
Function SwapSelect(num)
	SwapSelect = "NULL"
	If num <> "0" AND num <> "" Then	SwapSelect = num
End Function

'Hoan doi viec check (dung hoan doi checkbox) : kiem tra checkbox co chieck (= 0)
'	.Tham so vao : num : so can xet
'	.Ham tra ve  : . Neu num = 0 : tra ve chuoi NULL
'				   . Nguoc lai : tra ve int
Function SwapCheckbox(num)
	SwapCheckbox = 1
	If num <> "1" Then	SwapCheckbox = 0
End Function

'Kiem tra co khac NULL hay khong (dung kiem tra viec bat buoc phai nhap vao mot field)
'	.Tham so vao : .value : gia tri can kiem tra can xet
'				   .str   : chuoi can phai tra ve neu kiem tra la dung
'	.Ham tra ve  : . Neu la NULL : tra ve chuoi rong
'				   . Nguoc lai tra ve chuoi str 
Function CheckValue(value, str)
	CheckValue = str
	If value <> "NULL" Then	CheckValue = ""
End Function

'Ham lay cau SQL xoa bo dac trung theo loai cua dia danh
'	.Tham so vao : .category : Loai cua dia danh
'	.Ham tra ve cau lenh SQL thi hanh lenh xoa dac trung cua dia danh
Function SQLDeleteCategoryLocation(ID, conn)
	SQL = "SELECT CategoryID FROM Location WHERE ID=" & ID
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL, conn
	Call CheckErrorVBScript(attempt)
	Call CheckErrorDatabase(SQL,conn)
	SQL = ""
	'Xoa thong tin dac trung ve dia danh
	Select Case rs("CategoryID")
		'Place to stay
		Case 1
			SQL = " DELETE " &_
						" FROM PlaceToStay " &_
						" WHERE LocationID="&ID
		'Place to eat
		Case 2
			SQL = " DELETE " &_
						" FROM PlaceToEat " &_
						" WHERE LocationID="&ID
		'Place of worship
		Case 3
			SQL = " DELETE " &_
						" FROM PlaceOfWorship " &_
						" WHERE LocationID="&ID
		'Shopping
		Case 4
			SQL = " DELETE " &_
						" FROM Shopping " &_
						" WHERE LocationID="&ID
		'Entertainment & relax
		Case 5
			SQL = " DELETE " &_
						" FROM Entertainment " &_
						" WHERE LocationID="&ID
		'Museum
		Case 6
			SQL = " DELETE " &_
						" FROM Museum " &_
						" WHERE LocationID="&ID
		'Transport
		Case 7
			SQL = " DELETE " &_
						" FROM Transport " &_
						" WHERE LocationID="&ID
		'Medical service
		Case 8
			SQL = " DELETE " &_
						" FROM MedicalService " &_
						" WHERE LocationID="&ID
		'Book
		Case 9
			SQL = " DELETE " &_
						" FROM Book " &_
						" WHERE LocationID="&ID
		'VisaExtension
		Case 10
		'Bank
		Case 11
		'Communication
		Case 12
			SQL = " DELETE " &_
						" FROM Communication " &_
						" WHERE LocationID="&ID
		'Booking-office
		Case 13
			SQL = " DELETE " &_
						" FROM BookingOffice " &_
						" WHERE LocationID="&ID
		'Travel agency
		Case 14
			SQL = " DELETE " &_
						" FROM TravelAgency " &_
						" WHERE LocationID="&ID
		'Others
		Case 15
	End Select
	SQLDeleteCategoryLocation = SQL
End Function

%>	

</head>

<body>

</body>

</html>
