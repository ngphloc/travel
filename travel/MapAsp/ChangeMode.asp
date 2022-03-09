<%Response.Buffer=True%>
<%
iidx=Request.QueryString("idx")
llid=Session("lid")
mode=Request.QueryString("mode")
flagedit=Request.QueryString("flagedit")
iidd=Request.QueryString("iidd")
If mode="normal" Then
	Session("mode")="zoom"
Else
	Session("mode")="normal"
	Session("zoom")=1
End If
Response.Redirect "Map.asp?idx=" & iidx & "&iidd=" & iidd & "&flagedit=" & flagedit
%>
