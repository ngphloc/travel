<html>
<head>
<title>Map</title>
</head>
<!--#include file="LibAsp.asp"-->

<%
iidx=Request.QueryString("idx")
If IsNull(iidx) Or iidx="" Then
	iidx="search"
	DestroyInfoSession
End If
flagedit=Request.QueryString("flagedit")
iidd=Request.QueryString("iidd")
coords=Request.QueryString("coords")
z=Request.QueryString("z")

chk=0
chk=1*Session("chk")
tourSelect=0
tourSelect=1*Session("tourSelect")
llid=Session("lid")
%>
<frameset cols="22%,78%" >
	<noframes>
		Web page can't open. Browser didn't support frame
	</noframes>

	<frameset frameborder="0" framespacing="1" rows="64%,36%">
		<frame  src= "IndexMap.asp?z=<%=z%>&idx=<%=iidx%>&lid=<%=llid%>&iidd=<%=iidd%>&flagedit=<%=flagedit%>&coords=<%=coords%>&chk=<%=chk%>&tourSelect=<%=tourSelect%>" name="indexmap" noresize>
		<frame  src= "ParentMap.asp?idx=<%=iidx%>&lid=<%=llid%>&iidd=<%=iidd%>&flagedit=<%=flagedit%>&coords=<%=coords%>&chk=<%=chk%>&tourSelect=<%=tourSelect%>" name="parentmap"  noresize noscrolling scrolling="no">
	</frameset>
	<frameset frameborder="0" framespacing="0" rows="90%, 10%">
		<frame src= "HCMMap.asp?idx=<%=iidx%>&lid=<%=llid%>&iidd=<%=iidd%>&flagedit=<%=flagedit%>&coords=<%=coords%>&chk=<%=chk%>&tourSelect=<%=tourSelect%>" name="hcmmap" noresize>
		<frame src="MapInfo.asp" name="mapinfo" scrolling=no noresize>
	</frameset>
</frameset>
</html>
