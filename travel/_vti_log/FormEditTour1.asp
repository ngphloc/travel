<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Form Edit Tour 1</title>
<link rel="stylesheet" type="text/css" href="webnews.css">

<script language="JavaScript">
//Next
	function FormNext(TourID,flagEdit){
		document.FormEditTour1.action = "FormEditTour2.asp?TourID=" + TourID + "&flagEdit=" + flagEdit + "&flagAccess=1"
	}
</script>

</head>

<body background="IMAGES/Bgr2.jpg" bgproperties="fixed">

<!--#INCLUDE FILE="GeneralInformation.asp"-->
<!--#INCLUDE FILE="LibErrors.asp"-->
<!--#INCLUDE FILE="LibJavascript.asp"-->

<%
on error resume next
attempt = "Create connection object" 'thong bao ve loi kiem tra

'Mo ket noi server
'ConnectionString = Session("cnString")
ConnectionString = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("Data/Travel.mdb")
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open ConnectionString
Call CheckErrorVBScript(attempt)

TourID = Request.QueryString("TourID")'Ma tour
flagEdit = Request.QueryString("flagEdit")
flagAccess = Request.QueryString("flagAccess") ' =1 : truy cap co so du lieu
											   ' =0 : lay trong cac form hidden
										
If flagAccess = 1 Then
	Select Case flagEdit
		Case "Update"
			'Thong tin tong quat ve tour
			SQL = "SELECT * FROM Tours WHERE ID=" & TourID
			
			Set rs = Server.CreateObject("ADODB.Recordset")
			rs.Open SQL, conn
			Call CheckErrorVBScript(attempt)
			Call CheckErrorDatabase(SQL,conn)
		
			EnglishName			= rs("EnglishName")	
			EnglishIntroduction = rs("EnglishIntroduction")

			rs.Close
			Set rs = nothing
			
			SQL = "SELECT Count(*) As CountLocation FROM LocationTours WHERE TourID=" & TourID
			
			Set rs = Server.CreateObject("ADODB.Recordset")
			rs.Open SQL, conn
			Call CheckErrorVBScript(attempt)
			Call CheckErrorDatabase(SQL,conn)

			AmountLocation = rs("CountLocation")
			
			rs.Close
			Set rs = nothing

			'Cac dia danh trong tour
			SQL = "SELECT LocationID, Transport FROM LocationTours WHERE TourID=" & TourID
			
			Set rs = Server.CreateObject("ADODB.Recordset")
			rs.Open SQL, conn
			Call CheckErrorVBScript(attempt)
			Call CheckErrorDatabase(SQL,conn)

			If Not rs.BOF Then
				LocationIDs = CStr(AmountLocation) & ":"
				Transports  = CStr(AmountLocation) & ":"
				
				rs.MoveFirst
				For i = 1 to AmountLocation
					LocationIDs = LocationIDs & rs("LocationID") & ":"
					Transports  = Transports & rs("Transport") & ":"
				
					rs.MoveNext
				Next
			Else
				LocationIDs = "0:"
				Transports  = "0:"
			End If

			rs.Close
			Set rs = nothing
		Case "Add"
			LocationIDs = "0:"
			Transports  = "0:"
	End Select

Else
	EnglishName			= Request.Form("EnglishName")
	EnglishIntroduction = Request.Form("EnglishIntroduction")
	AmountLocation		= Request.Form("AmountLocation")
	LocationIDs			= Request.Form("LocationIDs")
	Transports			= Request.Form("Transports")
End If

%>

<form name="FormEditTour1" method="POST">
<center>
<table border="1" width="600" class=cssTableLayout cellspacing=0 cellpadding=2 bgColor="#eeeeee" bordercolor="#EEEEEE">
  <tr height=25>
	<td colspan="2" width="600" class=cssTDHeader align=center>Information tour</td></tr>
  <tr><td width="600" colspan="2" align="center" class=cssTDText>Step 1 of 2<p></td></tr>
  <tr>
    <td width="28%" valign="top" class=cssTDTextLabel align=right>Name</td>
    <td width="76%" valign="top"><input type="text" name="EnglishName" size="40" class=cssInputText value="<%=EnglishName%>"></td></tr>
  <tr>
    <td width="28%" valign="top" class=cssTDTextLabel align=right>Introduction</td>
    <td width="76%" valign="top"><textarea rows="3" cols="48" name="EnglishIntroduction" class=cssInputText><%=EnglishIntroduction%></textarea></td></tr>
  <tr>
    <td width="28%" valign="top" class=cssTDTextLabel align=right>Amount locations</td>
    <td width="76%" valign="top"><select size="1" name="AmountLocation" class=cssInputText><%Call ListNumLocationInTour(AmountLocation,20)%></select></td></tr>
</table>

	<!--Luu thong tin-->
	<INPUT type="hidden" name="LocationIDs" value="<%=LocationIDs%>">
	<INPUT type="hidden" name="Transports" value="<%=Transports%>">

<p>
<table border="0" width="92%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="10%"><input type="submit" value="Next" name="Next" onClick=FormNext(<%=TourID%>,"<%=flagEdit%>")></td>
    <td width="70%"></td>
     <%If flagEdit="Add" Then%>
    <td width="10%"><input type="submit" value="Add" name="Add" onClick=FinishEditTour(this.form,<%=TourID%>,"Add")></td>
    <%Else%>
    <td width="10%"><input type="submit" value="Delete" name="Delete" onClick=FinishEditTour(this.form,<%=TourID%>,"Delete")></td>
    <td width="10%"><input type="submit" value="Update" name="Update" onClick=FinishEditTour(this.form,<%=TourID%>,"Update")></td>
   <%End If%>
    <td width="10%"><input type="reset" value="Cancel" name="Cancel" onClick='CancelEditTour(this.form,"<%=flagEdit%>")'></td>
  </tr>
</table>

</center>
</form>
<%
conn.Close
Set conn = nothing
%>
</body>

</html>
