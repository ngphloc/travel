<%Response.Buffer=True%>
<!--#include file="LibAsp.asp"-->
<%
	iid=Request.QueryString("id")
	llid=Session("lid")
	iidx=Request.QueryString("idx")

	k=DeleteLocation(iid)
	If k<>-1 Then
		DelSplitOnceIdx llid,k,";"
	End If
	
	Response.Redirect "Map.asp?idx=" & iidx 
%>
