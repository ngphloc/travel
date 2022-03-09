<HTML>
<HEAD>
<TITLE>IS-Education Home</TITLE>
<LINK href="ep.css" rel=stylesheet REF>
<SCRIPT language=JavaScript src="navscrpt.js" type=text/javascript></SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<META content="Microsoft FrontPage 4.0" name=GENERATOR>
<base target="Main">
</HEAD>
<BODY leftMargin=0 
	onmousedown=DepressButton(); 
	onmouseover=RaiseButton(); 
	onmouseup=RaiseButton(); topMargin=0 
	MARGINHEIGHT="0" MARGINWIDTH="0">
<TABLE border=0 cellPadding=0 cellSpacing=0 height="100%">
	<TBODY>
		<TR>
			<TD bgColor=#0066cc rowSpan=2 vAlign=top width=170>
				<TABLE bgColor=#6699cc border=0 cellPadding=0 cellSpacing=0 width=170>
					<TBODY>
						<TR  height=30>
							<TD valign="middle" align=center>
								<font color=#003366 face="Times New Roman" size=2><b>
                                    <SCRIPT language=JavaScript>
										//<!--
										today = new Date(); 
										//weekday = today.getDay();
										month = today.getMonth();
										if (month == 0) document.write('January, ');
										if (month == 1) document.write('February, ');
										if (month == 2) document.write('March, ');
										if (month == 3) document.write('April, ');
										if (month == 4) document.write('May, ');
										if (month == 5) document.write('June, ');
										if (month == 6) document.write('July, ');
										if (month == 7) document.write('August, ');
										if (month == 8) document.write('September, ');
										if (month == 9) document.write('October, ');
										if (month == 10) document.write('November, ');
										if (month == 11) document.write('December, '); 
										date = today.getDate(); 
										document.write(date); 
										year=today.getYear();
										if (year <= 1999) 
											document.write (', ',1900+year);
										else document.write (', ',year);									today = new Date(); 
										//-->
									</SCRIPT></b></font>
							</TD>
						</TR>
					</TBODY>
				</TABLE>

			<TABLE border=0 cellPadding=0 cellSpacing=0 width="150">
				 <TBODY>
					<TR>
						<TD align=left vAlign=top width="150">

							<!--Home-->
							<IMG alt="" border=0 height=2 src="images/linenavdns.gif" width=170><BR>
							<DIV id=Home onclick=navClick(Home1,Homep)>
								<A href="Home.htm" target="Main">
								<SPAN class=LeftNavOff id="Homep" buttonType="LeftNav">
									Home
								</SPAN> </A>
								<DIV id=Home1 onclick="window.event.cancelBubble = true;"  style="DISPLAY: none">
								</DIV>
							</DIV>

							<!--Map-->
							<IMG alt="" border=0 height=2 src="images/linenavdns.gif" width=170><BR>
							<DIV id=Map onclick=navClick(Map1,Mapp)>
								<A href="HCMMapSimple.asp?zoom=100" target="Main">
								<SPAN class=LeftNavOff id="Mapp" buttonType="LeftNav">
									Map
								</SPAN> </A>
								<DIV id=Map1 onclick="window.event.cancelBubble = true;"  style="DISPLAY: none">
								</DIV>
							</DIV>

							<!--History-->
							<IMG alt="" border=0 height=2 src="images/linenavdns.gif" width=170><BR>
							<DIV id=History onclick=navClick(History1,Historyp)>
								<A href="History.htm" target="Main">
								<SPAN class=LeftNavOff id="Historyp" buttonType="LeftNav">
									History
								</SPAN> </A>
								<DIV id=History1 onclick="window.event.cancelBubble = true;"  style="DISPLAY: none">
								</DIV>
							</DIV>

							<%If Session("Access")=false Then%>
							<!--Search-->
							<IMG alt="" border=0 height=2 src="images/linenavdns.gif" width=170><BR>
							<DIV id=Search onclick=navClick(Search1,Searchp)>
								<A href="FormSearch.asp?arg=0" target="Main">
								<SPAN class=LeftNavOff id="Searchp" buttonType="LeftNav">
									Search
								</SPAN> </A>
								<DIV id=Search1 onclick="window.event.cancelBubble = true;"  style="DISPLAY: none">
								</DIV>
							</DIV>

							<!--Sites-->
							<IMG alt="" border=0 height=2 src="images/linenavdns.gif" width=170><BR>
							<DIV id=Site onclick=navClick(Site1,Sitep)>
								<a href="IndexMenuLocation.asp" target="Main">
									<SPAN class=LeftNavOff id="Sitep" buttonType="LeftNav">
										Sites
									</SPAN>
								</a>
								<DIV id=Site1 onclick="window.event.cancelBubble = true;"  style="DISPLAY: none">
								</DIV>
							</DIV>

							<!--Tour-->
							<IMG alt="" border=0 height=2 src="images/linenavdns.gif" width=170><BR>
							<DIV id=Tour onclick=navClick(Tour1,Tourp)>
								<A href="FormSearchTour.asp" target="Main">
									<SPAN class=LeftNavOff id="Tourp" buttonType="LeftNav">
										Tours
									</SPAN>
								</A>
								<DIV id=Tour1 onclick="window.event.cancelBubble = true;"  style="DISPLAY: none">
								</DIV>
							</DIV>

							<!--Login-->
							<IMG alt="" border=0 height=2 src="images/linenavdns.gif" width=170><BR>
							<DIV id=Login onclick=navClick(Login1,Loginp)>
								<A HREF="Login.asp" target="Main">
								<SPAN class=LeftNavOff id="Loginp" buttonType="LeftNav">
									Admin
								</SPAN></A>
								<DIV id=Login1 onclick="window.event.cancelBubble = true;"  style="DISPLAY: none">
								</DIV>
							</DIV>
							<%End If%>

							<!--Link website-->
							<IMG alt="" border=0 height=2 src="images/linenavdns.gif" width=170><BR>
							<DIV id=LinkWebsite onclick=navClick(LinkWebsite1,LinkWebsitep)>

								<A HREF="LinkWebsites.htm" target="Main">
								<SPAN class=LeftNavOff id="LinkWebsitep" buttonType="LeftNav">
									Link
								</SPAN></A>
								<DIV id=LinkWebsite1 onclick="window.event.cancelBubble = true;"  style="DISPLAY: none">
								</DIV>
							</DIV>
							
							<%If Session("Access")=true Then%>
							<!--Database-->
							<IMG alt="" border=0 height=2 src="images/linenavdns.gif" width=170><BR>
							<DIV id=Database onclick=navClick(Database1,Databasep)>

								<SPAN class=LeftNavOff id="Databasep" buttonType="LeftNav">
									Manage
								</SPAN>
								<DIV id=Database1 onclick="window.event.cancelBubble = true;"  style="DISPLAY: none">

									<A HREF="MenuEdit.asp#Sites" target="Main">
									<SPAN class=LeftNavSubOff  buttonType="LeftNavSub">
										Sites
									</SPAN></A><br>

									<A HREF="MenuEdit.asp#Tour" target="Main">
									<SPAN class=LeftNavSubOff buttonType="LeftNavSub">
										Tours
									</SPAN></A>
					
									<A HREF="MapAsp/Map.asp" target="_top">
									<SPAN class=LeftNavSubOff buttonType="LeftNavSub">
										Map
									</SPAN></A>

								</DIV>
							</DIV>
							<%End If%>
							<IMG alt="" border=0 height=2 src="images/linenavdns.gif" width=170><P>				
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
		</TBODY>
	</TABLE>
</BODY>
</HTML>
