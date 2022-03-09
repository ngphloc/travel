<%Response.Buffer=True%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" type="text/css" href="webnews.css">
<title>Map Menu</title>

<base target="Main">

<script lanuage="JavaScript">
	function changeMove(str) {
		document.frmSelection.action = "HCMMapSimple.asp?selection="+str; 
		document.frmSelection.submit();
	}
</script>

</head>

<body bgcolor="#6699CC">

<center>
<form name="frmSelection">
<table border="0" cellspacing="0" cellpadding="0" >
	<tr>
		<td align="right" valign="bottom"><Img id="LeftTop" src="Images/LeftTop.gif" border="0" alt="Left Top" onClick='changeMove("LeftTop")'></td>
		<td align="center" valign="bottom"><Img id="CenterTop" src="Images/CenterTop.gif" border="0" alt="Center Top" onClick='changeMove("CenterTop")'></td>
		<td align="left" valign="bottom"><Img id="RightTop" src="Images/RightTop.gif" border="0" alt="Right Top" onClick='changeMove("RightTop")'></td>
	</tr>
	<tr>
		<td align="right" valign="center"><Img id="CenterLeft" src="Images/CenterLeft.gif" border="0" alt="Center Left" onClick='changeMove("CenterLeft")'></td>
		<td ></td>
		<td align="left" valign="center"><Img id="CenterRight" src="Images/CenterRight.gif" border="0" alt="Center Right" onClick='changeMove("CenterRight")'></td>
	</tr>		
	<tr>
		<td align="left" valign="top"><Img id="LeftBottom" src="Images/LeftBottom.gif" border="0" alt="Left Bottom" onClick='changeMove("LeftBottom")'></td>
		<td align="center" valign="top"><Img id="CenterBottom" src="Images/CenterBottom.gif" border="0" alt="Center Bottom" onClick='changeMove("CenterBottom")'></td>
		<td align="left" valign="top"><Img id="RightBottom" src="Images/RightBottom.gif" border="0" alt="Right Bottom" onClick='changeMove("RightBottom")'></td>
	</tr>
</table>
</form>
</center>

</body>

