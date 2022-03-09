<%Response.Buffer=True%>
<%
tour=0
If Request.QueryString("tour")="" Then
	tour=0
Else
	tour=1*Request.QueryString("tour")
End If

Sub FindTour(cchk,ttourSelect,lllid) 'vao:cchk, ttourSelect ra: lllid
	'chk=1&tourSelect=1&lid=20,30

	If cchk=0 Then
		ttourSelect=0
		lllid=""
		Exit Sub
	End If
	
	If 1*ttourSelect <> 0 Then
		Set conn = Server.CreateObject("ADODB.Connection")
		conn.Open Session("cnString")

		SQL="SELECT LocationID FROM LocationTours WHERE TourID=" & ttourSelect
		Set rs=Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		lllid=""
		If Not rs.EOF Then
			Do While Not rs.EOF
				lllid=lllid & rs("LocationID") & ","
				rs.MoveNext
			Loop
			length=Len(lllid)
			If length>0 Then
				lllid=Left(lllid,length-1)
			End If
		End If

		rs.Close
		Set rs=Nothing
		Set conn=Nothing
	Else
		lllid=""
	End If	
End Sub
chk=1
tourSelect=tour
llid=""

FindTour chk,tourSelect,llid
Session("chk")=chk
Session("tourSelect")=tourSelect
Session("lid")=llid

Response.Redirect "Map.asp?idx=search" 
%>
