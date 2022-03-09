<%Response.Buffer=True %>
<!--#include file="LibAsp.asp"-->
<%
	iidx=Request.QueryString("idx")
	llid=Session("lid")
	flagedit=Request.QueryString("flagedit")
	iidd=Request.QueryString("iidd")
	coords=Request.QueryString("coords")
	
	iLeft=Request.QueryString("left")
	iTop=Request.QueryString("top")
	iRight=Request.QueryString("right")
	iBottom=Request.QueryString("bottom")
	widths=Request.QueryString("widths")
	heights=Request.QueryString("heights")

	ret=FindLocation(iLeft,iTop,iRight,iBottom,widths,heights)
	If ret Then
		coords=1
	Else
		coords=0
	End If
	Session("selectStr")=""
	Session("idStr")=""
	Response.Redirect "Map.asp?idx=" & iidx & "&iidd=" & _
		iidd & "&flagedit=" & flagedit & "&coords=" & coords
%>

