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


Session("chk")=chk
Session("tourSelect")=tourSelect
Session("lid")=llid

Response.Redirect "ParentMap.asp?idx=" & iidx & _
     "&iidd=" & iidd & "&flagedit=" & flagedit & "&coords=" & coords & _
	  "&chk=" & chk & "&tourSelect=" & tourSelect
%>
