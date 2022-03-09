<%Response.Buffer=True %>
<%
	llid=Session("lid")
	iidx=Request.QueryString("idx")
	
	flagedit=Request.QueryString("flagedit")
	iidd=Request.QueryString("iidd")
	coords=Request.QueryString("coords")
	
	width=1*Request.QueryString("width")
	height=1*Request.QueryString("height")
	q=Request.QueryString("q")
	Session("ParentWidth")=width
	Session("ParentHeight")=height
	
	If width>0 And height>0 Then
		If Not Session("visit") Then
			Session("visit")=true
		End If
	Else
		Session("visit")=false
	End If
	If q=1 Then
		Response.Redirect "ParentMap2.asp?idx=" & iidx & "&iidd=" & iidd & "&flagedit=" & flagedit & "&coords=" & coords
	Else
		Response.Redirect "ParentMap1.asp?idx=" & iidx & "&iidd=" & iidd & "&flagedit=" & flagedit & "&coords=" & coords
	End If
%>
