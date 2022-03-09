<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1252">
<TITLE>MapInfo</TITLE>
<style type="text/css">
	#layer {position:absolute; top:0; left:0}
</style>
</HEAD>

<BODY>
<div id=layer>
<EM>
<FONT  FACE=".VnTime" COLOR="BLUE" SIZE=-1> 
<%=Request.QueryString("info")%>
<!--#include file="LibJavaScript.htm"-->
<script language="JavaScript">
	var info=GetCookie("BriefInfo");
	if(info!=null)
		document.write(info);
</script>
</FONT>
</EM>
</div>
</BODY>
</HTML>
