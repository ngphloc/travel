<html>
<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>IndexMap</title>
<!--#include file="LibJavaScript.htm"-->
<style type="text/css">
	#layer {position:absolute; top:0; left:0}
</style>
</head>
<body link="#FFFF00" vlink="#FF00FF" alink="#00FF00" bgcolor="#CC0066" text="#FFFF99" OnLoad="loadForm(this)">
<font face=".VNTime" Size=-1>
<%
language=Session("Language")
iidx=Request.QueryString("idx")
flagedit=Request.QueryString("flagedit")
iidd=Request.QueryString("iidd")
coords=Request.QueryString("coords")
z=0
If Request.QueryString("z")="" Then
	z=100
Else
	z=1*Request.QueryString("z")
End If

If coords="" Then 
	coords=0
End If
If iidx="" Then
	iidx="detail"
End If
llid=Session("lid")
selectStr=Session("selectStr")
idStr=Session("idStr")
idChoice=Session("idChoice")
k=-1
If selectStr <> "" And idStr <> ""Then
	selectList=Split(selectStr,"_")
	idList=Split(idStr,"_")
	l=LBound(idList)
	u=UBound(idList)
	For i=l to u
		If idChoice=idList(i) Then
			k=i
			Exit For
		End IF
	Next
End If
%>
<div id=layer>
	<form border="0" method="post" action="ResponseIndexMap.asp?flag=0&idx=<%=iidx%>&lid=<%=llid%>" 
	      name=formIdx OnSubmit="changeSubmit(this)">
	<table border="0" cellspacing="0" cellpadding="0">
	<%If Session("mode")="zoom" Then%>
	<tr>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="zoomout" value="-" OnClick="changeSelectZoom(this)" style="font-style:small; BACKGROUND-COLOR: orange; BORDER-LEFT-COLOR: chartreuse; BORDER-TOP-COLOR: chartreuse; font-family: .VnTime; HEIGHT: 20px; WIDTH: 20px"><input type="button" name="zoomin" value="+" OnClick="changeSelectZoom(this)" style="font-style:small; BACKGROUND-COLOR: orange; BORDER-LEFT-COLOR: chartreuse; BORDER-TOP-COLOR: chartreuse; font-family: .VnTime; HEIGHT: 20px; WIDTH: 20px">
	<br>
	</tr>
	<%End If%>
	<tr>
	<%If language="English" Then%>
	  <%Select Case iidx%>
		  <%Case "detail"%>
				<input type="radio" value="search" name="idx"  OnClick="changeClick(this)"> Search
				<p>
				<%If Session("Access")=True Then%>
				<input type="radio" value="delete" name="idx"  OnClick="changeClick(this)"> Delete<p>
				<%End If%>
				<input type="radio" value="detail" checked name ="idx" OnClick="changeClick(this)"> All
			  <p></p>
		  <%Case "search"%>
				<input type="radio" value="search" checked name="idx"  OnClick="changeClick(this)"> Search
				<p>
				<%If Session("Access")=True Then%>
				<input type="radio" value="delete" name="idx"  OnClick="changeClick(this)"> Delete<p>
				<%End If%>
				<input type="radio" value="detail" name ="idx" OnClick="changeClick(this)"> All
			  <p></p>
		  <%Case "delete"%>
				<input type="radio" value="search" name="idx"  OnClick="changeClick(this)"> Search
				<p>
				<%If Session("Access")=True Then%>
				<input type="radio" value="delete" checked name="idx"  OnClick="changeClick(this)"> Delete<p>
				<%End If%>
				<input type="radio" value="detail" name="idx"  OnClick="changeClick(this)"> All
			  <p></p>
		<%End Select%>
  <%Else%>
	  <%Select Case iidx%>
		  <%Case "detail"%>
				<input type="radio" value="search" name="idx"  OnClick="changeClick(this)"> T×m kiÕm
				<p>
				<%If Session("Access")=True Then%>
				<input type="radio" value="delete" name="idx"  OnClick="changeClick(this)"> Delete<p>
				<%End If%>
			   <input type="radio" value="detail" checked name ="idx" OnClick="changeClick(this)"> TÊt c¶
			   <p></p>
		  <%Case "search"%>
				<input type="radio" value="search" checked name ="idx" OnClick="changeClick(this)"> T×m kiÕm
				<p>
				<%If Session("Access")=True Then%>
				<input type="radio" value="delete" name="idx"  OnClick="changeClick(this)"> Delete<p>
				<%End If%>
			   <input type="radio" value="detail" name="idx"  OnClick="changeClick(this)"> TÊt c¶
			   <p></p>
		  <%Case "delete"%>
				<input type="radio" value="search" name="idx" OnClick="changeClick(this)"> T×m kiÕm
				<p>
				<%If Session("Access")=True Then%>
				<input type="radio" value="delete" checked name="idx"  OnClick="changeClick(this)"> Delete<p>
				<%End If%>
			   <input type="radio" value="detail" name="idx" OnClick="changeClick(this)"> TÊt c¶
			   <p></p>
		<%End Select%>
  <%End If%> 
	</tr>
	
	<tr align=left>
	<%If language="English" Then%>
		<%If Session("mode")="normal" Then%>
			<input type="checkbox" name="chkZoom" value="mode" OnClick="changeZoomClick(this)"> Zoom&nbsp;&nbsp;  
		<%Else%>	
			<input type="checkbox" name="chkZoom" checked value="mode" OnClick="changeZoomClick(this)"> Zoom&nbsp;&nbsp;  
		<%End If%>	
	<%Else%>
		<%If Session("mode")="normal" Then%>
			<input type="checkbox" name="chkZoom" value="mode" OnClick="changeZoomClick(this)"> Phãng&nbsp;  
		<%Else%>	
			<input type="checkbox" name="chkZoom" checked value="mode" OnClick="changeZoomClick(this)"> Phãng&nbsp;  
		<%End If%>	
  <%End If%> 
	<%If Session("mode")="zoom" Then%>
		<select size="1" name="selectZoom" style="font-family: .VnTime; HEIGHT: 10px; WIDTH: 54px"
		     OnChange="changeSelectZoom(this)">
			<option value=-1>--&-- 
			<option value=25>25% 
			<option value=50>50% 
			<option value=75>75% 
			<option value=100>100% 
			<option value=125>125% 
			<option value=150>150% 
			<option value=175>175% 
			<option value=200>200% 
			<option value=0 > none 
		</select>
	<%End If%>
	</tr> 
	<tr>	
	&nbsp;
	</tr>	
	<tr align=left>
		<%If k=-1 Then %>
			<%If language="English" Then%>
			<input value="Search text here" name=locatetext type="text"  maxlength=32 style="font-family: .VnTime;WIDTH: 116px"  
						OnChange="changeText(this)" >
			<%Else%>
			<input value="Chuçi cÇn t×m" name=locatetext type="text"  maxlength=32 style="font-family: .VnTime;WIDTH: 116px"  
						OnChange="changeText(this)">
			<%End If%>
		<%Else%>
			<input name=locatetext type="text"  maxlength=32 style="font-family: .VnTime;WIDTH: 116px"  
		        OnChange="changeText(this)" value="<%=selectList(k)%>" >
		<%End If%>
	</tr>
	
	<tr align=left>
	<%If selectStr <> "" And idStr <> ""Then%>
	<!--<select scroll=auto  name=locateselect size=5 style="font-family: .VnTime; HEIGHT: 81px; WIDTH: 116px" 
		       OnChange="changeSelect(this)">-->
	<select scroll=auto  name=locateselect size=5 style="font-family: .VnTime;WIDTH: 116px" 
		       OnChange="changeSelect(this)">
		<%
			For i=l to u
				If i=k And k<>-1Then
		%>
					<option value="<%=idList(i)%>" selected > <%=selectList(i)%> 
				<%Else%>
					<option value="<%=idList(i)%>" > <%=selectList(i)%> 
				<%End If%>
			<%Next%>
		</select>
	<%End If%>
	
	<tr align=left>
	<br>
	</tr>
	
	<tr align=left>
		<td>
		<%If language="English" Then%>
		<INPUT OnClick="changeClick(this)" Type=button name=coords value="Get coords" style="font-family: .VnTime; BACKGROUND-COLOR: paleturquoise; BORDER-BOTTOM-COLOR: khaki; BORDER-LEFT-COLOR: khaki; BORDER-RIGHT-COLOR: khaki; BORDER-TOP-COLOR: khaki; HEIGHT: 22px; WIDTH: 116px">
		<%Else%>
		<INPUT OnClick="changeClick(this)" Type=button name=coords value="LÊy täa ®é" style="font-family: .VnTime; BACKGROUND-COLOR: paleturquoise; BORDER-BOTTOM-COLOR: khaki; BORDER-LEFT-COLOR: khaki; BORDER-RIGHT-COLOR: khaki; BORDER-TOP-COLOR: khaki; HEIGHT: 22px; WIDTH: 116px">
		<%End If%>
    </td>
	</tr>
	<tr align=left>
		<td>
		<%If language="English" Then%>
		<INPUT OnClick="changeClick(this)" visible Type=button name=reset value=Reset style="font-family: .VnTime; BACKGROUND-COLOR: darkorange; BORDER-BOTTOM-COLOR: lawngreen; BORDER-LEFT-COLOR: chartreuse; BORDER-RIGHT-COLOR: greenyellow; BORDER-TOP-COLOR: lawngreen; HEIGHT: 22px; WIDTH: 58px"><INPUT name=home OnClick="changeClick(this)" style="font-family: .VnTime; BACKGROUND-COLOR: orange; BORDER-LEFT-COLOR: chartreuse; BORDER-TOP-COLOR: chartreuse; HEIGHT: 22px; WIDTH: 58px" type=button value=Home>&nbsp; 
		<%Else%>
		<INPUT OnClick="changeClick(this)" Type=button name=reset value="Lµm l¹i" style="font-family: .VnTime; BACKGROUND-COLOR: darkorange; BORDER-BOTTOM-COLOR: lawngreen; BORDER-LEFT-COLOR: chartreuse; BORDER-RIGHT-COLOR: greenyellow; BORDER-TOP-COLOR: lawngreen; HEIGHT: 22px; WIDTH: 58px"><INPUT name=home OnClick="changeClick(this)" style="font-family: .VnTime; BACKGROUND-COLOR: orange; BORDER-LEFT-COLOR: chartreuse; BORDER-TOP-COLOR: chartreuse; HEIGHT: 22px; WIDTH: 58px" type=button value="VÒ chñ">&nbsp; 
		<%End If%>
    </td>
	</tr>
  </table>
</form>

<form name=formGoto border="0" method="get" action="Goto.asp?idx=<%=iidx%>&lid=<%=llid%>&iidd=<%=iidd%>&flagedit=<%=flagedit%>" 
     OnSubMit="changeGotoSubmit(this)" target="_top">
	<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<%If language="English" Then%>
		<td><font face=".VNTime" size=-1>Goto&nbsp&nbsp&nbsp</font></td>
		<%Else%> 
		<td><font face=".VNTime" size=-1>§Õn&nbsp&nbsp&nbsp&nbsp</font></td>
		<%End If%>
		<td><input name=goto size=8 type=text OnChange="changeGotoText(this)" style="font-family: .VnTime;"></td>
	</tr>
	</table>
</form>
<form name=formWH border="0" method="get" OnSubMit="changeWHSubmit(this)">
	<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<%If language="English" Then%>
		<td><font face=".VNTime" size=-1>Mini&nbsp&nbsp</font></td> 
		<%Else%> 
		<td><font face=".VNTime" size=-1>Nhá&nbsp&nbsp&nbsp</font></td> 
		<%End If%>
		<td><input name=WH size=8 type=text OnChange="changeWHText(this)" style="font-family: .VnTime;"></td>
	</tr>
	</table>
</form>

<p></p>
<font face=".VNTime" size=+1>
<%If language="English" Then%>
	<a href="MapHelp.asp" target="hcmmap">Help</a><br>
<%Else%>
	<a href="MapHelp.asp" target="hcmmap">Gióp ®ì</a><br> 
<%End If%>
</font>

<font face=".VNTime" color="blue" size=-1>
<%
zzoom="" & z
If zzoom<>"" Then
	zList=Split(zzoom,".")
	u=UBound(zList)
	If u=0 Then
		zzoom=zList(0)
	Else
		If u=1 Then
			zzoom=zList(0) & "." & Left(zList(1),2)
		End If
	End If
End If
zzoom=zzoom & "%"
%>
rows=<%=Application("Rows")%>&nbsp;cols=<%=Application("Cols")%>
zoom=<%=zzoom%>
</font>
</div>
</font>

<script language="JavaScript">
	var flag=0;
	function loadForm(obj) {
		
	}
	function changeText(obj) {
	}
	function changeZoomClick(obj) {
		mode="<%=Session("mode")%>";
		parent.location.href="ChangeMode.asp?mode=" + mode +
		    "&idx=<%=iidx%>"+"&iidd=<%=iidd%>&flagedit=<%=flagedit%>";		
	}
	function changeSelectZoom(obj) {
		flag=1;
		if(obj.value=="-")
			s="ChangeZoom.asp?z=50" + "&idx=<%=iidx%>";
		else if(obj.value=="+")
			s="ChangeZoom.asp?z=150" + "&idx=<%=iidx%>";
		else {
			if(obj.value==-1)
				flag=0;
			else
				s="ChangeZoom.asp?z=" + obj.value + "&idx=<%=iidx%>";
		}
		s=s+"&iidd=<%=iidd%>&flagedit=<%=flagedit%>";
		if(flag==1)
			parent.location.href=s;
	}
	function changeWHText(obj) {
		var exp=new Date();
		exp.setTime(exp.getTime() + 24*60*60*1000);
		SetCookie("WH",obj.value,exp);
		document.formWH.action="ParentMap.asp?iidd=<%=iidd%>&flagedit=<%=flagedit%>"; 
		document.formWH.target="parentmap";
		document.formWH.submit();
		//parent.parentmap.location.href="ParentMap.asp?"+"&iidd=<%=iidd%>&flagedit=<%=flagedit%>"; 
	}
	function changeGotoText(obj) {
	}
	function changeSubmit(obj) {
	}
	function changeWHSubmit(obj) {
	}
	function changeGotoSubmit(obj) {
	}
	function changeSelect(obj) {
		id=obj.value;
		s="SearchMap.asp?id=" + id + "&idx=search" ; 
		s=s+"&iidd=<%=iidd%>&flagedit=<%=flagedit%>";
		parent.location.href=s;
	}
	
	function changeClick(obj){
		flag=1;
		<%If language="English" Then%>
		if(obj.value!="Get coords") {
		<%Else%>
		if(obj.value!="LÊy täa ®é") {
		<%End If%>
			<%If language="English" Then%>
			if(obj.value == "Home")
			<%Else%>
			if(obj.value == "VÒ chñ")
			<%End If%>
				s="BridgeHome.asp?idx=<%=iidx%>";
			<%If language="English" Then%>
			else if(obj.value =="Reset") {
			<%Else%>
			else if(obj.value =="Lµm l¹i") {
			<%End If%>
					DeleteCookie("Coords");
					DeleteCookie("BriefInfo");
					s="ResponseIndexMap.asp?flag="+flag+"&idx=<%=iidx%>";
				}
			else {
				SQL="";
				if(obj.value=="delete") {
					<%If Session("Access")=False Then%>
						<%If language="English" Then%>
							Username=prompt("User name : ");
							if(Username!=null) {
								Password=prompt("Password : ");
								if(Password!=null) {
									SQL="SELECT * FROM Users WHERE Username='"+
									    Username + "' And Password='" + Password + "'";
									alert("In delete mode. Carefully !");
									
								}
							}
						<%Else%>
							Username=prompt("Tªn user : ");
							if(Username!=null) {
								Password=prompt("MËt khÈu : ");
								if(Password!=null) {
									SQL="SELECT * FROM Users WHERE Username='"+
									    Username + "' And Password='" + Password + "'";
									alert("Ban da vao che do xoa. Hay can than !");
								}
							}
						<%End If%>
					<%Else%>
						<%If language="English" Then%>
							alert("In delete mode. Carefully !");
						<%Else%>
							alert("Ban da vao che do xoa. Hay can than !");
						<%End If%>
					<%End If%>
				}
				s="ResponseIndexMap.asp?flag="+flag+"&idx="+obj.value+"&SQL="+SQL;
			}
			SetCookie("Coords",null);
			<%If language="English" Then%>
				if(obj.value == "Home") {
			<%Else%>
				if(obj.value == "VÒ chñ") {
			<%End If%>
					DeleteCookie("Coords");
					DeleteCookie("BriefInfo");
				}
			s=s+"&iidd=<%=iidd%>&flagedit=<%=flagedit%>";
			parent.location.href=s;		
		}
		else {
			var iMin,iMax,jMin,jMax,partI,partJ;
			i=j=iLeft=iRight=iTop=iBottom=-1;
						
			f=1;
			info=GetCookie("Coords");
			if(info==null || info=="")
				f=0;
			else {
				infoList=info.split(":");
				if(infoList.length==6) {
					ij=infoList[0].split(",");
					if(ij.length==4) {
						iMin=1*ij[0];jMin=1*ij[1];
						iMax=1*ij[2];jMax=1*ij[3];
					
						lt=infoList[1].split(",");
						if(ij.length==4) {
							xLeft=1*lt[0];yTop=1*lt[1];
							xRight=1*lt[2];yBottom=1*lt[3];
								
							widths=infoList[2];
							listWidths=widths.split("_");
					
							heights=infoList[3];
							listHeights=heights.split("_");
					
							partI=1*infoList[4];
					
							partJ=1*infoList[5];
					
							iLeft=findSubXX(widths,iMin*1,jMin*1,xLeft*1);
							iTop=findSubYY(heights,iMin*1,jMin*1,yTop*1);
							iRight=findSubXX(widths,iMax*1,jMax*1,xRight*1);
							iBottom=findSubYY(heights,iMax*1,jMax*1,yBottom*1);
					
							//ket qua
							i=iMin*1;j=jMin*1;
							iRight=(iRight>iLeft)?iRight:listWidths[i*2+j]-1;  
							iBottom=(iBottom>iTop)?iBottom:listHeights[i*2+j]-1;  
						}
						else
							f=0;
					}
					else
						f=0;
				}
				else
					f=0;
			}
			var notice;
			<%If flagedit="" Or iidd="" Then%>
				<%If language="English" Then%>
					notice="Coords: "+iLeft+" "+iTop+" "+iRight+" "+iBottom+"\n"+
				      "Part     : "+(iMin+partI)+" "+(jMin+partJ)+":"+(iMax+partI)+" "+(jMax+partJ);
				<%Else%>
					notice="Toa do: "+iLeft+" "+iTop+" "+iRight+" "+iBottom+"\n"+
				      "Phan     : "+iMin+" "+jMin+":"+iMax+" "+jMax;
				<%End If%>
				alert(notice);	
			<%Else%>
				<%If coords=0 Then%>
					MapLocation="";
					if(f==1)
						MapLocation=MapLocation+(iMin+partI)+"_"+(jMin+partJ)+":"+iLeft+","+iTop+","+iRight+","+iBottom;
					s="EditMapResponse.asp?ID=<%=iidd%>&flagedit=<%=flagedit%>" + 
					  "&MapLocation="+MapLocation;
					SetCookie("Coords",null);
					parent.location.href=s;
				<%Else%>
					<%If language="English" Then%>
						notice="\nLocation already.\nYou must delete old location";
					<%Else%>
						notice="\nDia danh da ton tai.\nBan phai xoa dia danh cu";
					<%End If%>
					alert(notice);
				<%End If%>
			<%End If%>
		}
	}
</script>

</body>
</html>













































































































































