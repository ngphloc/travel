
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta http-equiv="Content-Language" content="en-us">
<title>Default.htm</title>
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<base target="_self">
</head>
<%
flagedit=Request.QueryString("flagedit")
flagaccess=Request.QueryString("flagaccess")
ID=Request.QueryString("ID")
MapLocation=Request.QueryString("MapLocation")
%>
<frameset rows="16%,84%" border="0" frameborder="0" framespacing="0">
	<frame name="Title" src="../Title.htm" scrolling="no" noresize target="_self" >
	<frameset cols="20%,80%">
		<frame name="MainMenu" src="../MainMenu.asp" target="Main" scrolling="no" noresize target="Main">
		<frame name="Main" src="BridgeEditForm.asp?ID=<%=ID%>&flagaccess=<%=flagaccess%>&flagedit=<%=flagedit%>&MapLocation=<%=MapLocation%>" target="_top" scrolling="auto"> 
	</frameset>
	
</frameset>

</html>
