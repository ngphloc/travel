<!--#INCLUDE FILE="GeneralInformation.asp"-->

<%
on error resume next
attempt = "Create connection object" 'thong bao ve loi kiem tra

'Mo ket noi server
'ConnectionString = Session("cnString")
ConnectionString = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("Data/Travel.mdb")
Set conn = server.CreateObject("ADODB.Connection")
conn.Open ConnectionString
Call CheckErrorVBScript(attempt)

'Lay ID cua dia danh
ID = Request.QueryString("ID")

'Lay thong tin chung	
SQL = "SELECT * FROM Location, LocationInfo WHERE Location.ID=LocationInfo.ID AND Location.ID=" & ID
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open SQL, conn
Call CheckErrorVBScript(attempt)
Call CheckErrorDatabase(SQL,conn)

If Not rs.BOF Then
	Name		 = rs("EnglishName")
	Address		 = rs("EnglishAddress")
	Phone		 = rs("Phone")
	Fax			 = rs("Fax")
	Email		 = rs("Email")
	Website		 = rs("Website")
	Introduction = ReadFile(rs("EnglishIntroduction"),0)
	MainImage	 = rs("MainImageID")
	MainMovie	 = rs("MainMovieID")
	MainSound	 = rs("MainSoundID")
	Category	 = rs("CategoryID")	
End If
rs.Close
Set rs = nothing

'Lay ten loai dia danh
SQL = "SELECT * FROM LocationCategory WHERE ID=" & Category
Set rs = Server.CreateObject("ADODB.Recordset")
rs.Open SQL, conn

CategoryName = rs("EnglishName")	

rs.Close
Set rs = nothing

'Lay duong dan Image chinh cua dia danh
If MainImage <> "" Then
	SQL = "SELECT * FROM Images WHERE ID=" & MainImage
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL, conn

	MainImage = rs("Path")

	rs.Close
	Set rs = nothing
End If
	
'Lay duong dan Sound chinh cua dia danh
If MainSound <> "" Then
	SQL = "SELECT * FROM Sounds WHERE ID=" & MainSound
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL, conn

	MainSound = rs("Path")

	rs.Close
	Set rs = nothing
End If

'Lay duong dan Movie chinh cua dia danh
If MainMovie <> "" Then
	SQL = "SELECT * FROM Movies WHERE ID=" & MainMovie
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL, conn

	MainMovie = rs("Path")

	rs.Close
	Set rs = nothing
End If

Select Case Category
	Case 1'Place to stay
		SQL = "SELECT * FROM PlaceToStay, CategoryDesign WHERE CategoryDesignID=ID AND LocationID=" & ID
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		Call CheckErrorDatabase(SQL,conn)
			
		If Not rs.BOF Then
			Design	 = rs("EnglishName")
			Standard = rs("Standard")
			MinPrice = rs("MinPrice")
			MaxPrice = rs("MaxPrice")
		Else
			Response.Write "Don't access database!!!"
		End If
		rs.Close
		Set rs = nothing
	Case 2'Place to eat
		SQL = "SELECT * FROM PlaceToEat, CategoryFood WHERE CategoryFoodID=ID AND LocationID=" & ID
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		Call CheckErrorDatabase(SQL,conn)
		
		If Not rs.BOF Then
			Food = rs("EnglishName")
			PrincipalDish = rs("EnglishPrincipalDish") 
		Else
			Response.Write "Don't access database!!!"
		End If
		rs.Close
		Set rs = nothing
	Case 3'Place of worship
		SQL = "SELECT * FROM PlaceOfWorship, CategoryWorship WHERE CategoryWorshipID=ID AND LocationID=" & ID
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		Call CheckErrorDatabase(SQL,conn)
		
		If Not rs.BOF Then
			Worship = rs("EnglishName")
		Else
			Response.Write "Don't access database!!!"
		End If
		rs.Close
		Set rs = nothing
	Case 4'Shopping
		SQL = "SELECT * FROM Shopping, CategoryShopping WHERE CategoryShoppingID=ID AND LocationID=" & ID
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		Call CheckErrorDatabase(SQL,conn)
			
		If Not rs.BOF Then
			Shopping = rs("EnglishName")
		Else
			Response.Write "Don't access database!!!"
		End If
		rs.Close
		Set rs = nothing
	Case 5'Entertainment & relax
		SQL = "SELECT * FROM Entertainment, CategoryEntertainment WHERE CategoryEntertainmentID=ID AND LocationID=" & ID
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		Call CheckErrorDatabase(SQL,conn)
			
		If Not rs.BOF Then
			Entertainment = rs("EnglishName")
			MinPrice	  = rs("MinPrice")
			MaxPrice	  = rs("MaxPrice")
		Else
			Response.Write "Don't access database!!!"
		End If
		rs.Close
		Set rs = nothing
	Case 6'Museum
		SQL = "SELECT * FROM Museum WHERE LocationID=" & ID
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		Call CheckErrorDatabase(SQL,conn)
		
		If Not rs.BOF Then
			MinPrice = rs("MinPrice")
			MaxPrice = rs("MaxPrice")
		Else
			Response.Write "Don't access database!!!"
		End If
		rs.Close
		Set rs = nothing
	Case 7'Transport
		SQL = "SELECT * FROM Transport, CategoryTransport WHERE CategoryTransportID=ID AND LocationID=" & ID
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		Call CheckErrorDatabase(SQL,conn)
			
		If Not rs.BOF Then
			Transport = rs("EnglishName")
			MinPrice  = rs("MinPrice")
			MaxPrice  = rs("MaxPrice")
		Else
			Response.Write "Don't access database!!!"
		End If
		rs.Close
		Set rs = nothing
	Case 8'Medical service
		SQL = "SELECT * FROM MedicalService, CategoryMedicalService WHERE CategoryMedicalServiceID=ID AND LocationID=" & ID
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		Call CheckErrorDatabase(SQL,conn)
			
		If Not rs.BOF Then
			MedicalService = rs("EnglishName")
		Else
			Response.Write "Don't access database!!!"
		End If
		rs.Close
		Set rs = nothing
	Case 9'Book
		SQL = "SELECT * FROM Book, CategoryBook WHERE CategoryBookID=ID AND LocationID=" & ID
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		Call CheckErrorDatabase(SQL,conn)
		
		If Not rs.BOF Then
			Book = rs("EnglishName")
		Else
			Response.Write "Don't access database!!!"
		End If
		rs.Close
		Set rs = nothing
	Case 10'VisaExtension
	Case 11'Bank
	Case 12'Communication
		SQL = "SELECT * FROM Communication, CategoryCommunication WHERE CategoryCommunicationID=ID AND LocationID=" & ID
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		Call CheckErrorDatabase(SQL,conn)
		
		If Not rs.BOF Then
			Communication = rs("EnglishName")
		Else
			Response.Write "Don't access database!!!"
		End If
		rs.Close
		Set rs = nothing
	Case 13'Booking-office
		SQL = "SELECT * FROM BookingOffice, CategoryBookingOffice WHERE CategoryBookingOfficeID=ID AND LocationID=" & ID
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		Call CheckErrorDatabase(SQL,conn)
			
		If Not rs.BOF Then
			BookingOffice = rs("EnglishName")
		Else
			Response.Write "Don't access database!!!"
		End If
		rs.Close
		Set rs = nothing
	Case 14'Travel agency
		SQL = "SELECT * FROM TravelAgency WHERE LocationID=" & ID
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		Call CheckErrorDatabase(SQL,conn)
			
		If Not rs.BOF Then
			If rs("Inbound") = true Then	Inbound = 1
			If rs("Outbound") = true Then	Outbound = 1
			If rs("Trekking") = true Then	Trekking = 1
			If rs("MotorbikingTour") = true Then	MotorbikingTour = 1
		Else
			Response.Write "Don't access database!!!"
		End If
		rs.Close
		Set rs = nothing
	Case 15'Others
	Case Else
		Response.Write "Don't access database!!!"
End Select	
	
conn.Close
set conn = nothing
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Detail location</title>
</head>

<body leftMargin="0" topMargin="0" marginheight="0" marginwidth="0" text="#3366FF" background="IMAGES/Bgr3.gif" bgproperties="fixed">
<font face="Times New Roman">
<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
  <TBODY>
  <TR><TD>&nbsp;</TD></TR>
  <TR>
    <TD width="10%"></TD>
    <TD bgColor=#793d00 width="80%">
      <TABLE border=0 cellPadding=0 cellSpacing=1 width="100%">
        <TBODY>
        <TR>
          <TD bgColor=#ffffff width="100%">
            <TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
              <TBODY>
              <TR>
                <TD bgColor=#ffffff colspan="2" width="100%"><IMG src="images/blank.gif" height=2 width=1></TD></TR>
              <TR>
   				<%If MainImage <> "" Then%>
				<td width="1%">&nbsp;<img width=150 height=150 src="<%=MainImage%>"></td>
				<%End If%>
				<td width="149%" align="center"><h1><%=Name%></h1></td></tr>
			  <TR>
                <TD bgColor=#808040 colspan="2"><IMG src="images/blank.gif" height=2 width=1></TD></TR>
              <TR>
				<TD colspan="2" bgcolor="#FFFFCC">
					<a href="Default.htm" target="_top"><IMG src="Images/Home.gif" alt="Home" border="0" width="51" height="37"></a>
					<IMG height=4 src="images/blank1.gif" width=29>
					<a href="HCMMapSimple.asp?ID=<%=ID%>"><IMG src="Images/Map.gif" alt="Map" border="0"></a></TD></TR>
			  <TR>
                <TD bgColor=#ffffff colspan="2"><IMG src="images/blank.gif" height=1 width=1></TD></TR></TBODY></TABLE>
            <TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
              <TBODY>
              <TR>
                <TD width="100%"><IMG src="Images/bar1.jpg" height=45 width=525></TD></TR>
              <TR>
                <TD width="76%">
                  <TABLE border=0 cellPadding=0 cellSpacing=0 width="95%">
                    <TBODY>
                    <TR>
                      <TD width="6%"></TD>
                      <TD width="94%">
                          <P align=justify><%=Introduction%></P></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD width="75%"></TD></TR></TBODY></TABLE>
            <P><IMG src="Images/bar2.jpg" height=45 width=525></P>
            <TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
              <TBODY>
              <TR>
                <TD width="6%"></TD>
                <TD width="94%">
					<IMG src="Images/a.gif"><%=CategoryName%>
				<%Select Case Category
					'Place to stay
					Case 1%>
						- <%=Design%> <P>
						<IMG src="Images/a.gif">Standard : <%=Standard%> <P>
						<%If MinPrice <> "" Or MaxPrice <> "" Then%>
							<IMG src="Images/a.gif">Rates : <%=MinPrice%> -> <%=MaxPrice%> USD<P>
						<%End If%>
					<%'Place to eat
					Case 2%>
						- <%=Food%><P>
						<%If PrincipalDish <> "" Then%>
							<IMG src="Images/a.gif">Principal dish : <%=PrincipalDish%><P>
						<%End If%>
					<%'Place of worship
					Case 3%>
						- <%=Worship%><P>
					<%'Shopping
					Case 4%>
						- <%=Shopping%><P>
					<%'Entertainment & relax
					Case 5%>
						- <%=Entertainment%><P>
						<%If MinPrice <> "" Or MaxPrice <> "" Then%>
							<IMG src="Images/a.gif">Admission range : <%=MinPrice%> -> <%=MaxPrice%> USD<P>
						<%End If%>
					<%'Museum
					Case 6%>
						<%If MinPrice <> "" Or MaxPrice <> "" Then%>
							<IMG src="Images/a.gif">Admission range : <%=MinPrice%> -> <%=MaxPrice%> USD<P>
						<%End If%>
					<%'Transport
					Case 7%>
						- <%=Transport%><P>
						<%If MinPrice <> "" Or MaxPrice <> "" Then%>
							<IMG src="Images/a.gif">Price range : <%=MinPrice%> -> <%=MaxPrice%> USD<P>
						<%End If%>
					<%'Medical service
					Case 8%>
						- <%=MedicalService%><P>
					<%'Book
					Case 9%>
						- <%=Book%><P>
					<%'VisaExtension
					Case 10
					'Bank
					Case 11
					'Communication
					Case 12%>
						- <%=Communication%><P>
					<%'Booking-office
					Case 13%>
						- <%=BookingOffice%><P>
					<%'Travel agency
					Case 14
						strConnect = " "
						str = "Organize :"
						If Inbound = 1 Then
							str = str & strConnect & "inbound"
							strConnect = ", "
						End If
						If Outbound = 1 Then
							str = str & strConnect & "outbound"
							strConnect = ", "
						End If
						If Trekking = 1 Then
							str = str & strConnect & "trekking"
							strConnect = ", "
						End If
						If MotorbikingTour = 1 Then	
							str = str & strConnect & "motorbiking tour"
						End If%>
						<IMG src="Images/a.gif"><%=str%><P>
					<%'Others
					Case 15%>
				<%End Select%></TD></TR></TBODY></TABLE>
            <P><IMG src="Images/bar3.jpg" height=36 width=526></P>
            <TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
              <TBODY>
              <TR>
                <TD width="6%"></TD>
                <TD width="94%">
				  <%If Address <> "" Then%>
					<IMG src="Images/a.gif">Address : <%=Address%><P>
		 		  <%End If%>
				  <%If Phone <> "" Then%>		
					<IMG src="Images/a.gif">Tel : <%=Phone%><P>
				  <%End If%>
				  <%If Fax <> "" Then%>     	
					<IMG src="Images/a.gif">Fax : <%=Fax%><P>
				  <%End If%>
				  <%If Email <> "" Then%>		
					<IMG src="Images/a.gif">Email : <a href='mailto:<%=Email%>'><%=Email%></a><P>
				  <%End If%>
				  <%If Website <> "" Then%>	
					<IMG src="Images/a.gif">Website : <a href='<%=Website%>' target='_top'> <%=Website%> </a><P>
				  <%End If%></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
    <TD width="10%"></TD></TR>
  <TR><TD>&nbsp;</TD></TR></TBODY></TABLE>
<font> 
</body>








