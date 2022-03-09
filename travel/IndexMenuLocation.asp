<%
on error resume next
attempt = "Create connection object" 'thong bao ve loi kiem tra

'Mo ket noi server
'ConnectionString = Session("cnString")
ConnectionString = "DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("Data/Travel.mdb")
Set conn = server.CreateObject("ADODB.Connection")
conn.Open ConnectionString
Call CheckErrorVBScript(attempt)

Category = Request.Form("Category")
If (Category <> "")Then	Response.Redirect ("FormSearch.asp?arg=" & Category)
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Index Menu Location</title>
<link rel="stylesheet" type="text/css" href="webnews.css">

</head>

<body bgcolor="#FFFFFF" alink="#0000FF" link="#0000FF" vlink="#0000FF">

<!--#INCLUDE FILE="GeneralInformation.asp"-->
<font face="Times New Roman" size=-1>

<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="2%"></td>
    <td width="95%">
      <table border="0" width="650" cellspacing="0" cellpadding="0">
      <tr>
        <td valign="bottom"><img src="images/top_l.jpg" width="175" height="10"></td></tr>
      <tr>
        <td bgColor=#0182dd colSpan=3><p align=left><IMG height=5 src="images/blank.gif" width=5></p></td></tr>
      <tr>
        <td width="175" bgcolor="#0182dd"><center><font color="white"><h1>Sites</h1></font></center></td>
        <td bgColor=#0182dd width="450"><img border="0" alt="Welcome to Ho Chi Minh City" class=top src="IMAGES/bannerWelcome.gif"></td>
        <td bgColor=#0182dd width="7"><IMG height=5 src="images/blank.gif" width=5></td></tr>
      <tr>
        <td colspan="3" bgcolor="#0182dd"><img src="images/blank.gif" width="5" height="5"></td></tr>
      <tr>
        <td bgcolor="#FFC800" colspan="2"><img border="0" src="Images/blank.gif" width="2" height="2"></td>
        <td width="7" bgcolor="#0182dd"><img src="/images/blank.gif" width="5" height="5"></td></tr>
    </table>
    </td>
    <td width="3%"></td>
  </tr>
  <tr>
    <td width="2%"></td>
    <td width="95%" bgcolor="#0182dd"><table border="0" width="100%" cellspacing="6" cellpadding="0">
      <tr>
        <td width="100%" bgcolor="#FFFFFF">
          <table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td width="10%" bgcolor="#0066cc" align="center" valign="bottom"><font color="white"><h3>Search form</h3></font></td></tr>
          <tr>
            <td width="25%" bgcolor="#FFC800" valign="top">
              <table border="0" width="100%" cellspacing="0" cellpadding="0">
              <tr>
                <td width="100%" bgcolor="#0066cc">
                  <!--Chon form tim kiem-->
                  <form name="frmSearch" action="IndexMenuLocation.asp" method="POST">
                  <center><table border="0" cellspacing="0" cellpadding="0" width="90">
                    <tr>
                      <td align="center"><small><select name="Category" size="1">
                      	<option value="0">Choose category</option>
                        <%Call ListCategory(Category,conn,1)%>
                      </select></small></td></tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr align="center">
                      <td colspan="3">
						<p><input type="submit" name="SearchForm" width="75" height="15" border="0" style="background-color: #0066CC; color: #FFFFFF; font-family: Times New Roman; font-size: 11pt; border-style: outset" value="Search"></td></tr>
                  </table></center></form></td>
                <!--Ket thuc form tim kiem-->               
              </tr></table></td>
            <td width="75%" valign="top" align="center">&nbsp;
              <!--Menu loai dia danh-->
              <table border="0" width="100%" cellspacing="0" cellpadding="0">
              <tr>
                <td width="15%" valign="top" align="right" height="66">
                		<a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=1">
                			<img src="images/PlaceToStay.gif" width="80" height="80" border="0" alt="Place to stay"></a></td>
                <td width="35%" valign="top">
                		<a class="bar1" href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=1"><strong>Places to stay</strong></a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=1&indexCategory=1">Mini-hotel</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=1&indexCategory=2">Hotel</a> 
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=1&indexCategory=3">Guesthouse</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=1&indexCategory=4">Village</a></td>
                <td width="15%" valign="top" align="right" height="66">
                		<a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=12">
                			<img src="images/Communication.gif"  width="80" height="80" border="0" alt="Communication"></a></td>
                <td width="35%" valign="top">
                		<a class="bar1" href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=12"><strong>Communication</strong></a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=12&indexCategory=4">Email & Internet access</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=12&indexCategory=3">Fax</a> 
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=12&indexCategory=1">Post-office</a> 
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=12&indexCategory=2">Telephone</a></td></tr>
              <tr>
                <td width="15%" valign="top" align="right" height="21"></td>
                <td width="35%" valign="top" height="21"></td>
                <td width="15%" valign="top" align="right" height="21"></td>
                <td width="35%" valign="top" height="21"></td></tr>
              <tr>
                <td width="15%" valign="top" align="right" height="66">
                		<a class="bar1" href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=3">
                			<img src="images/PlaceOfWorship.gif" width="80" height="80" border="0" alt="Place of worship"></a></td>
                <td width="35%" valign="top">
                		<a class="bar1" href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=3"><strong>Places of worship</strong></a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=3&indexCategory=1">Buddhism</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=3&indexCategory=2">Catholicism</a> 
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=3&indexCategory=3">Hinduism</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=3&indexCategory=4">Mohammedanism</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=3&indexCategory=5">Temple</a></td>
                <td width="15%" valign="top" align="right" height="66">
                		<a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=4">
                			<img src="images/Shopping.gif" width="80" height="80" border="0" alt="Shopping"></a></td>
                <td width="35%" valign="top">
                		<a class="bar1" href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=4"><strong>Shopping</strong></a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=4&indexCategory=1">Art & crafts</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=4&indexCategory=2">Clothing</a> 
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=4&indexCategory=3">Markets</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=4&indexCategory=5">Stamps & coins</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=4&indexCategory=4">Suppermarkets</a></td></tr>
              <tr>
                <td width="15%" valign="top" align="right" height="21"></td>
                <td width="35%" valign="top" height="21"></td>
                <td width="15%" valign="top" align="right" height="21"></td>
                <td width="35%" valign="top" height="21"></td></tr>
              <tr>
                <td width="15%" valign="top" align="right" height="66">
                		<a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=2">
                			<img src="images/PlaceToEat.gif"  width="80" height="80" border="0" alt="Place to eat"></a></td>
                <td width="35%" valign="top">
                		<a class="bar1" href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=2"><strong>Places to eat</strong></a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=2&indexCategory=2">Chinese</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=2&indexCategory=6">French</a> 
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=2&indexCategory=5">Indian</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=2&indexCategory=7">International</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=2&indexCategory=4">Japanese</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=2&indexCategory=3">Thailand</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=2&indexCategory=1">Vietnamese</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=2&indexCategory=8">Vegetarian</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=2&indexCategory=9">Cafes</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=2&indexCategory=10">Food stalls</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=2&indexCategory=12">Ice-cream</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=2&indexCategory=11">Self-catering</a></td>
                <td width="15%" valign="top" align="right" height="66">
                		<a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=5">
                			<img src="images/Entertainment.gif" width="80" height="80" border="0" alt="Entertainment & relax"></a></td>
                <td width="35%" valign="top">
                		<a class="bar1" href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=5"><strong>Entertainment & relax</strong></a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=5&indexCategory=1">Amusement parks</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=5&indexCategory=11">Bowling</a> 
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=5&indexCategory=5">Cinemas</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=5&indexCategory=8">Conservatoire</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=5&indexCategory=12">Golf</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=5&indexCategory=4">Massage</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=5&indexCategory=10">Nightclubs</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=5&indexCategory=2">Parks</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=5&indexCategory=9">Pubs</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=5&indexCategory=3">Swimming</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=5&indexCategory=7">Theatre</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=5&indexCategory=6">Water puppets</a></td></tr>
              <tr>
                <td width="15%" valign="top" align="right" height="21"></td>
                <td width="35%" valign="top" height="21"></td>
                <td width="15%" valign="top" align="right" height="21"></td>
                <td width="35%" valign="top" height="21"></td></tr>
              <tr>
                <td width="15%" valign="top" align="right" height="66">
                		<a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=7">
                			<img src="images/Transport.gif" width="80" height="80" border="0" alt="Transport"></a></td>
                <td width="35%" valign="top">
                		<a class="bar1" href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=7"><strong>Transport</strong></a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=7&indexCategory=1">Bicycle</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=7&indexCategory=2">Boat</a> 
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=7&indexCategory=3">Bus</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=7&indexCategory=4">Car & motorbike</a>
               			<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=7&indexCategory=5">Cyclo</a>
               			<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=7&indexCategory=6">Hoda om</a>
               			<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=7&indexCategory=7">Taxi</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=7&indexCategory=8">Xe lam</a></td>
                <td width="15%" valign="top" align="right" height="66">
                		<a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=13">
                			<img src="images/BookingOffice.gif" width="80" height="80" border="0" alt="Booking-office"></a></td>
                <td width="35%" valign="top">
                		<a class="bar1" href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=13"><strong>Booking-offices</strong></a>
                 		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=13&indexCategory=1">Air</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=13&indexCategory=5">Boat</a> 
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=13&indexCategory=2">Bus</a> 
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=13&indexCategory=4">Car</a>  
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=13&indexCategory=3">Train</a></td></tr>               
              <tr>
                <td width="15%" valign="top" align="right" height="21"></td>
                <td width="35%" valign="top" height="21"></td>
                <td width="15%" valign="top" align="right" height="21"></td>
                <td width="35%" valign="top" height="21"></td></tr>
              <tr>
                <td width="15%" valign="top" align="right" height="66">
                		<a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=8">
                			<img src="images/MedicalService.gif"  width="80" height="80" border="0" alt="Medical services"></a></td>
                <td width="35%" valign="top">
                		<a class="bar1" href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=8"><strong>Medical services</strong></a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=8&indexCategory=3">Denstist</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=8&indexCategory=1">Hospitals</a> 
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=8&indexCategory=2">Pharmacies</a></td>
                <td width="15%" valign="top" align="right" height="66">
                		<a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=9">
                			<img src="images/Book.gif" width="80" height="80" border="0" alt="Book"></a></td>
                <td width="35%" valign="top">
                		<a class="bar1" href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=9"><strong>Book</strong></a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=9&indexCategory=1">Bookshops</a>
                		<br>. <a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=9&indexCategory=2">Libraries</a></td></tr>
              <tr>
                <td width="15%" valign="top" align="right" height="21"></td>
                <td width="35%" valign="top" height="21"></td>
                <td width="15%" valign="top" align="right" height="21"></td>
                <td width="35%" valign="top" height="21"></td></tr>
              <tr>
                <td width="15%" valign="top" align="right" height="66">
                		<a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=14">
                			<img src="images/TravelAgency.gif"  width="80" height="80" border="0" alt="Travel agencies"></a></td>
                <td width="35%" valign="top">
                		<a class="bar1" href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=14"><strong>TravelAgencies</strong></a></td>
                <td width="15%" valign="top" align="right" height="66">
                		<a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=6">
                			<img src="images/Museum.gif"  width="80" height="80" border="0" alt="Museums"></a></td>
                <td width="35%" valign="top">
                		<a class="bar1" href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=6"><strong>Museums</strong></a></td></tr>
              <tr>
                <td width="15%" valign="top" align="right" height="21"></td>
                <td width="35%" valign="top" height="21"></td>
                <td width="15%" valign="top" align="right" height="21"></td>
                <td width="35%" valign="top" height="21"></td></tr>
              <tr>
                <td width="15%" valign="top" align="right" height="66">
                		<a href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=11">
                			<img src="images/Bank.gif" width="80" height="80" border="0" alt="Banks"></a></td>
                <td width="35%" valign="top">
                		<a class="bar1" href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=11"><strong>Banks</strong></a></td>
                <td width="15%" valign="top" align="right" height="66">
                <td width="35%" valign="top">
                		<a class="bar1" href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=10"><strong>Visa extension</strong></a><br>
                		<a class="bar1" href="SearchLocation.asp?flagAccess=false&flagEdit=Detail&category=15"><strong>Other location</strong></a></td></tr>
              <tr>
                <td width="15%" valign="top" align="right" height="21"></td>
                <td width="35%" valign="top" height="21"></td>
                <td width="15%" valign="top" align="right" height="21"></td>
                <td width="35%" valign="top" height="21"></td></tr>
              </table>
              <!--Ket thuc menu cac loai dia danh-->
            </td>
          </tr>
    </table>
</font>
<%
conn.Close
Set conn=nothing
%>

</body>






