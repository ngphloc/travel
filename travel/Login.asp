<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="webnews.css">

</head>

<body background="IMAGES/Bgr2.jpg" bgproperties="fixed">

<%If Request.QueryString("checkForm")=0 Then%>
<form name="Login" action="Login.asp?checkForm=1" method="POST">
<center>
<table border="1" width="400" class=cssTableLayout cellspacing=0 cellpadding=2 bgColor="#eeeeee" bordercolor="#EEEEEE">
  <tr height=25>
	<td colspan=2 width="400" class=cssTDHeader align=center>Admin</td></tr>
  <tr>
	<td width="600" colspan="2" align="center" class=cssTDText>Please, enter your username and password to login system<p></td></tr>
  <tr>
    <td width="40%" valign="top" class=cssTDTextLabel align=right>Username&nbsp;</td>
    <td width="60%" valign="top"><input name="Username" size="12" class=cssInputText></td></tr>
  <tr>
    <td width="40%" valign="top" class=cssTDTextLabel align=right>Password&nbsp;</td>
    <td width="60%" valign="top"><input type="password" name="Password" size="20" class=cssInputText></td></tr>
</table>

<p><table border="0" width="25%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="50%" align="right"><input type="submit" value="Login" name="Login"></td>
    <td width="50%" align="left"><input type="reset" value="Reset" name="Reset"></td>
  </tr>
</table>

</center></form>
<%
Else
	on error resume next
	attempt = "Create connection object" 'thong bao ve loi kiem tra

	'Mo ket noi server
	'ConnectionString = Session("cnString")
	ConnectionString = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("Data/Travel.mdb")
	Set conn = server.CreateObject("ADODB.Connection")
	conn.Open ConnectionString
	Call CheckErrorVBScript(attempt)

	Username = Request.Form("Username")
	Password = Request.Form("Password")

	SQL = "SELECT * FROM Users WHERE Username='" & Username & "' AND Password='" & Password & "'"
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL, conn
	Call CheckErrorVBScript(attempt)
	Call CheckErrorDatabase(SQL,conn)

	Response.Write "<font>"
	If Not rs.BOF Then
		Session("Access") = true
		Response.Write "Login is successful. <a href='Default.htm' target='_top'>Refresh</a>"
	Else
		Session("Access") = false
		Response.Write "Username and password are invalid. <a href='Login.asp?checkForm=0' target='Main'>Back</a>"
	End If
	Response.Write "</font>"

	rs.Close
	Set rs = nothing
	conn.Close
	set conn = nothing
End If
%>

</body>

</html>








