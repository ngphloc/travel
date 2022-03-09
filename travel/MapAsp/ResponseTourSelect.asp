<%Response.Buffer=True%>
<%
iidx=Request.QueryString("idx")
flagedit=Request.QueryString("flagedit")
iidd=Request.QueryString("iidd")
coords=Request.QueryString("coords")

llid=Request.QueryString("lid")'Tap cac dia danh cua tour
chk=0
If Request.QueryString("chk")="" Then
	chk=0
Else
	chk=1*Request.QueryString("chk")
End If
tourSelect=0
If Request.QueryString("tourSelect")="" Then
	tourSelect=0
Else
	tourSelect=1*Request.QueryString("tourSelect")
End If

If tourSelect=0 Then
	llid=""
End If

If 1*tourSelect <> 0 Then
	Set conn = Server.CreateObject("ADODB.Connection")
	conn.Open Session("cnString")

	SQL="SELECT LocationID FROM LocationTours WHERE TourID=" & tourSelect
	Set rs=Server.CreateObject("ADODB.Recordset")
	rs.Open SQL, conn
	llid=""
	If Not rs.EOF Then
		Do While Not rs.EOF
			llid=llid & rs("LocationID") & ","
			rs.MoveNext
		Loop
		length=Len(llid)
		If length>0 Then
			llid=Left(llid,length-1)
		End If
	End If

	rs.Close
	Set rs=Nothing
	Set conn=Nothing
Else
	llid=""
End If

Session("chk")=chk
Session("tourSelect")=tourSelect
Session("lid")=llid

Response.Redirect "ParentMap.asp?idx=" & iidx & _
     "&iidd=" & iidd & "&flagedit=" & flagedit & "&coords=" & coords & _
	  "&chk=" & chk & "&tourSelect=" & tourSelect
%>
