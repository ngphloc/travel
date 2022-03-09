<%Response.Buffer=True%>
<%
zoom=1*Request.QueryString("zoom")
llid=Session("lid")
iidx=Request.QueryString("idx")
flagedit=Request.QueryString("flagedit")
iidd=Request.QueryString("iidd")

If zoom=1 Then
	widths=Request.QueryString("widths")
	heights=Request.QueryString("heights")
	If heights<>"" Then
		hList=Split(heights,"_")

		l=LBound(hList)
		u=UBound(hList)
		H=0
		For i=l to u
			value=1*hList(i)
			If value=0 Then
				H=0
				Exit For
			Else
				H=H+value
			End If
		Next
		Session("Heights")=heights
		Session("TotalHeight")=H
	Else
		Session("Heights")=""
		Session("TotalHeight")=0
	End If
	If widths<>"" Then
		wList=Split(widths,"_")
		l=LBound(wList)
		u=UBound(wList)
		W=0
		For i=l to u
			value=1*wList(i)
			If value=0 Then
				W=0
				Exit For
			Else
				W=W+value
			End If
		Next
		Session("Widths")=widths
		Session("TotalWidth")=W
	Else
		Session("Widths")=""
		Session("TotalWidth")=0
	End If
End If
Response.Redirect "ParentMap.asp?idx=" & iidx & "&iidd=" & iidd & "&flagedit=" & flagedit
%>
