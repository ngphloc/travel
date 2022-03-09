<%Response.Buffer=True%>
<!--#include file="LibAsp.asp"-->
<%
z=Request.QueryString("z")
iidx=Request.QueryString("idx")
llid=Session("lid")
flagedit=Request.QueryString("flagedit")
iidd=Request.QueryString("iidd")

If z <> 0 Then
	z=1*Session("zoom")*z
	Session("zoom")=z/100
Else
	z=100
	Session("zoom")=1
End If
Select Case iidx
	Case "search" 
		'DestroyInfoSession
	Case "detail"
		'SearchLocation	
End Select
	
Response.Redirect "Map.asp?idx=" & iidx & "&iidd=" & iidd & "&flagedit=" & flagedit & _
					 "&z=" & z
%>
