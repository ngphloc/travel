<%Response.Buffer=True %>
<!--#include file="LibAsp.asp"-->
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 4.0">
<TITLE>ResponseClick</TITLE>
</HEAD>
<BODY>
<%
	iidx=Request.QueryString("idx")
	flagedit=Request.QueryString("flagedit")
	iidd=Request.QueryString("iidd")
	coords=Request.QueryString("coords")

	llid=Session("lid")
	chk=0
	chk=1*Session("chk")
	tourSelect=0
	tourSelect=1*Session("tourSelect")

	Session("part0")=Request.QueryString("part0")
	Session("part1")=Request.QueryString("part1")
	Session("part2")=Request.QueryString("part2")
	Session("part3")=Request.QueryString("part3")
	Session("selectStr")=""
	Session("idStr")=""
	Select Case iidx
		Case "search" 
			DestroyInfoSession
		Case "detail"
			SearchLocation	
	End Select
	Response.Redirect "Map.asp?idx=" & iidx & "&iidd=" & _
		iidd & "&flagedit=" & flagedit & "&coords=" & coords & "&chk=" & chk & _
		"&tourSelect=" & tourSelect
%>
<script language="JavaScript">
</script>
</BODY>
</HTML>
