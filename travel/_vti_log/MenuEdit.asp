<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Menu Edit</title>
<link rel="stylesheet" type="text/css" href="ep.css">
<script LANGUAGE="JavaScript">
<!--
// (c) by Manfred Renner

IMG01 = "Images/on.gif"  //image when mouse is over the link
IMG02 = "Images/off.gif" //image when mouse isn't over the link

function imgover(imgname){
     imgname.src = IMG01
}

function imgout(imgname){
     imgname.src = IMG02
}

//-->
</script>

</head>

<body BGCOLOR="#FFFFFF" background="IMAGES/Bgr2.jpg" bgproperties="fixed">

<%If Session("Access")= false Then%>
	You must login system!!! <a href='Login.asp?checkForm=0'>Login</a>
<%Else%>
<font color="red"><h2><a name="Sites">Sites</a></h2></font>
<img NAME="IMG01" SRC="Images/off.gif" WIDTH="10" HEIGHT="10" BORDER="0">
	<a href="FormSearch.asp?arg=0" onMouseOver="imgover(IMG01)" onMouseOut="imgout(IMG01)">Detail</a><br>
<img NAME="IMG02" SRC="Images/off.gif" WIDTH="10" HEIGHT="10" BORDER="0">
	<a href="FormEdit1.asp?ID=0&flagAccess=1&flagEdit=Add" onMouseOver="imgover(IMG02)" onMouseOut="imgout(IMG02)">Add</a><br>
<img NAME="IMG03" SRC="Images/off.gif" WIDTH="10" HEIGHT="10" BORDER="0">
	<a href="FormSearch.asp?arg=Update" onMouseOver="imgover(IMG03)" onMouseOut="imgout(IMG03)">Delete</a><br>
<img NAME="IMG04" SRC="Images/off.gif" WIDTH="10" HEIGHT="10" BORDER="0">
	<a href="FormSearch.asp?arg=Update" onMouseOver="imgover(IMG04)" onMouseOut="imgout(IMG04)">Update</a>
<p>
<font color="red"><h2><a name="Tours">Tours</a></h2></font>
<img NAME="IMG05" SRC="Images/off.gif" WIDTH="10" HEIGHT="10" BORDER="0">
 <a href="FormSearchTour.asp?flagEdit=Detail" onMouseOver="imgover(IMG05)" onMouseOut="imgout(IMG05)">Detail</a><br>
<img NAME="IMG06" SRC="Images/off.gif" WIDTH="10" HEIGHT="10" BORDER="0">
	<a href="FormEditTour1.asp?TourID=0&flagEdit=Add&flagAccess=1" onMouseOver="imgover(IMG06)" onMouseOut="imgout(IMG06)">Add</a><br>
<img NAME="IMG07" SRC="Images/off.gif" WIDTH="10" HEIGHT="10" BORDER="0">
 <a href="FormSearchTour.asp?flagEdit=Update" onMouseOver="imgover(IMG07)" onMouseOut="imgout(IMG07)">Delete</a><br>
<img NAME="IMG08" SRC="Images/off.gif" WIDTH="10" HEIGHT="10" BORDER="0">
 <a href="FormSearchTour.asp?flagEdit=Update" onMouseOver="imgover(IMG08)" onMouseOut="imgout(IMG08)">Update</a>
<%End If %>

</body>
</html>


