<%Response.Buffer=True%>
<!--#include file="LibSimpleAsp.asp"-->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="webnews.css" type="text/css">
<title>New Page 1</title>
<style type="text/css">
	#layer {position:absolute; top:40px}
	#layerToolbar {position:absolute; top:1px;left:20px}
</style>
</head>

<body background="IMAGES/Bgr4.gif">
<%
ID=Request.QueryString("ID")

Dim shape(2,2)
Dim name(2,2)
Dim identifier(2,2)
Dim zzzoom
Dim rows,cols
Dim all
Dim ii,jj,iii,jjj

w=Session("w")
h=Session("h")
all="no"
zzzoom=100
ii=0
jj=0
If ID="" Then
	info=Session("Simple")
	flag=True
	If info="" Then
		flag=false
	Else
		infoList=Split(info,":")
		If UBound(infoList)<>3 Then
			flag=false
		End If
	End If
	If Not flag Then
		all="no"
		zzzoom=100
		ii=0		
		jj=0
	Else
		all=infoList(0)
		If infoList(1)="" Then
			zzzoom=100
		Else
			zzzoom=1*infoList(1)
		End If
		If zzzoom<>100 And zzzoom<>50 And zzzoom<>25 And zzzoom<>125 And zzzoom<>150 Then
			zzzoom=100
		End If

		If infoList(2)="" Then
			ii=0
		Else
			ii=1*infoList(2)
		End If
		If infoList(3)="" Then
			jj=0
		Else
			jj=1*infoList(3)
		End If
	End If

	
	If zzzoom<>100 Then
		all="no"
	End If
	If all="yes" Then
		SearchLocation ii,jj,shape,name,identifier
	End If
Else
	all="no"
	zzzoom=100
	SearchLocationID ID,20,16,ii,jj,shape,name,identifier
End If

iii=ii
jjj=jj
Select Case zzzoom
	Case 25 
		rows=5
		cols=4
	Case 50
		rows=10
		cols=8
	Case 100
		rows=20
		cols=16
	Case 125
		rows=25
		cols=20
	Case 150
		rows=30
		cols=24
End Select
If iii<0 Then
	iii=0
End If
If iii>=rows-2 Then
	iii=rows-2
End If
If jjj<0 Then
	jjj=0
End If
If jjj>=cols-2 Then
	jjj=cols-2
End If

%>

<div id="layerToolbar">
<form border="0" name=formCtrl method="POST" action="GotoSimple.asp?all=<%=all%>&zoom=<%=zzzoom%>">
<table border="1" width="600" class=cssTableLayout cellspacing=0 cellpadding=2 bordercolor="#0000FF" bordercolorlight="#EEEEEE" bordercolordark="#000000">
	<tr height=15 class=cssSearchHeader bgcolor="#0182DD" align="center">
		<td width=120px valign="center">Zoom&nbsp;
						<SELECT name=zoom class=cssInputText style="HEIGHT: 7px; WIDTH:60px" onchange="changeZoom(this)">
				<%If zzzoom=25 Then%>
					<OPTION selected value=25>25%</OPTION>
				<%Else%>
					<OPTION value=25>25%</OPTION>
				<%End If%>
				<%If zzzoom=50 Then%>
					<OPTION selected value=50>50%</OPTION>
				<%Else%>
					<OPTION value=50>50%</OPTION>
				<%End If%>
				<%If zzzoom=100 Then%>
					<OPTION selected value=100>100%</OPTION>
				<%Else%>
					<OPTION value=100>100%</OPTION>
				<%End If%>
				<%If zzzoom=125 Then%>
					<OPTION selected value=125>125%</OPTION>
				<%Else%>
					<OPTION value=125>125%</OPTION>
				<%End If%>
				<%If zzzoom=150 Then%>
					<OPTION selected value=150>150%</OPTION>
				<%Else%>
					<OPTION value=150>150%</OPTION>
				<%End If%>
			</SELECT></td>
		<td width=100px valign="center">Go to&nbsp;<INPUT class=cssInputText type="text" name="goto" onchange="changeGoto(this)" style="HEIGHT: 20px; WIDTH: 50px"></td>  
		<%If all="yes" Then%>
			<td width=60px> <INPUT type="checkbox" id="iidx" checked onclick="changeView(this)" style="HEIGHT: 20px; WIDTH: 50px" ><label for="iidx" valign=center>All</label></td>
		<%Else%>
			<td width=60px> <INPUT type="checkbox" id="iidx" onclick="changeView(this)" style="HEIGHT: 20px; WIDTH: 50px" ><label for="iidx" valign=center>All</label></td>
		<%End If%>
		<td	width=10px valign="center"><Img id="LeftTop" src="Images/LeftTop.gif" border="0" alt="Left Top" onClick="changeMove(id)"></td>
		<td width=10px valign="center"><Img id="CenterTop" src="Images/CenterTop.gif" border="0" alt="Center Top" onClick="changeMove(id)"></td>
		<td width=10px valign="center"><Img id="RightTop" src="Images/RightTop.gif" border="0" alt="Right Top" onClick="changeMove(id)"></td>

		<td width=10px valign="center"><Img id="CenterLeft" src="Images/CenterLeft.gif" border="0" alt="Center Left" onClick="changeMove(id)"></td>
		<td width=10px valign="center"><Img id="CenterRight" src="Images/CenterRight.gif" border="0" alt="Center Right" onClick="changeMove(id)"></td>

		<td width=10px valign="center"><Img id="LeftBottom" src="Images/LeftBottom.gif" border="0" alt="Left Bottom" onClick="changeMove(id)"></td>
		<td width=10px valign="center"><Img id="CenterBottom" src="Images/CenterBottom.gif" border="0" alt="Center Bottom" onClick="changeMove(id)"></td>
		<td width=10px valign="center"><Img id="RightBottom" src="Images/RightBottom.gif" border="0" alt="Right Bottom" onClick="changeMove(id)"></td>
	</tr>   		
</table>
</form>

<div id="layer">
<center>
<form border="0" name=formImg method="POST">
<table border="0" cellspacing="0" cellpadding="0" >
<%
	For i=0 to 1
		Response.Write "<tr> "
		For j=0 to 1
			Response.Write "<td id=" & "'" & (i+iii) & "_" & (j+jjj) & "' " & _
				"OnClick=" & "'" & "changeClick(id)" & "' " & "> "
				 
			Response.Write "<img border='0' " & "name=" & "'" & "Img" & (i+iii) & "_" & (j+jjj) & "' "  
			s="src=" & "'" & "images/map/HCMMap" & zzzoom & "_" & (i+iii) & "_" & (j+jjj) & ".gif" & "' "  
			s=s & "' " & "usemap='#HCMMap" & (i+iii) & "_" & (j+jjj) & "' " & " ></td>"
			Response.Write s
		Next
		Response.Write "</tr>"
	Next
%>
</table>
</form>

<% 
For i=0 to 1
	For j=0 to 1
		Response.Write "<map name=" & "'" & "HCMMap" & (i+iii) & "_" & (j+jjj) & "' " & "> "
		If identifier(i,j)=""	Then
			l=0
			u=-1
		Else
			spe=Split(shape(i,j),";")
			nme=Split(name(i,j),";")
			id=Split(identifier(i,j),";")
			u=UBound(id)
			l=LBound(id)
		End If
		For k=l to u			
			if spe(k)<>"" And id(k)<>"" then		
				s="<area shape='rect' " & "coords=" & "'" & Trim(spe(k)) & "' "
				s=s & "alt=" & Chr(34) & id(k) & ": " & Trim(nme(k)) & Chr(34) & " " & "title='You are Welcome' "
				If id(k)="" Or id(k)=";" then
					s=s & "href='DetailLocation.asp?id=0' > "
				Else
					s=s & "href=" & "'" & "DetailLocation.asp?ID=" & Trim(id(k)) & "' > " 
				End If
				Response.Write s
			End If
		Next
		Response.Write "<area shape='default' nohref>"
		Response.Write "</map>"
	Next
Next
%>

<script language="JavaScript">
document.write("<style type='text/css'>");
var images=new Array();
for(i=0;i<2;i++) 
	for(j=0;j<2;j++) {
		mapname="Img"+(i+<%=iii%>) + "_" + (j+<%=jjj%>);
		images[i*2+j]=document.images(mapname);
	}
<%
For i=0 to 1
	For j=0 to 1
		row=i+iii
		col=j+jjj
		If identifier(i,j)=""	Then
			l=0
			u=-1
		Else
			spe=Split(shape(i,j),";")
			id=Split(identifier(i,j),";")
			u=UBound(id)
			l=LBound(id)
		End If
		For k=l to u			
			If spe(k)<>"" And id(k)<>"" Then
				list=Split(spe(k),",")
				If UBound(list)=3 Then
					width0=1*list(2)-1*list(0)
					height0=1*list(3)-1*list(1)
					left0=Int(list(0)+width0/2-w/2)
					top0=Int(list(1)+height0/2-h/2)
					m=i
					n=j
%>
					w=<%=w%>;
					h=<%=h%>;
					left0=<%=left0%>;
					top0=<%=top0%>;
					m=<%=m%>;
					n=<%=n%>;
					for(i=0;i<m;i++)
						top0=top0+images[i*2+<%=j%>*1].height;
					for(j=0;j<n;j++)
						left0=left0+images[<%=i%>*2+j*1].width;
	
					s="#<%=row%>_<%=col%>_<%=id(k)%> {position:absolute; left:" + left0 + "px; "+ 
						"top:" + top0 +"px; " + "width: " + w + "px; " +	"height:" + h +	"px }";
					document.write(s);	
<%
				End If
			End If
		Next
	Next
Next
%>
document.write("</style>");

<%
For i=0 to 1
	For j=0 to 1
		row=i+iii
		col=j+jjj
		If identifier(i,j)=""	Then
			l=0
			u=-1
		Else
			id=Split(identifier(i,j),";")
			u=UBound(id)
			l=LBound(id)
		End If
		For k=l to u	
%>
			s="<Img src='images/location/Locate.gif' id='<%=row%>_<%=col%>_<%=id(k)%>' " 
			+ " OnClick='changeClickImg(id)' >";
  
			document.write(s);

<%
		Next
	Next
Next
%>
</script>
</div>
</div>

<script language="JavaScript">
	function changeGoto(obj) {
		event.returnValue=false;
		document.formCtrl.action="GotoSimple.asp?all=<%=all%>&zoom=<%=zzzoom%>";
		document.formCtrl.submit();
	}
	function changeZoom(obj) {
		i=<%=iii%>*obj.value/<%=zzzoom%>;
		j=<%=jjj%>*obj.value/<%=zzzoom%>;
		document.formCtrl.action="WriteInfo.asp?all=<%=all%>&zoom="+obj.value+"&i="+i+"&j="+j;
		document.formCtrl.submit();
	}
	function changeView(obj) {
		if(obj.checked) {
			all="yes";
			i=<%=iii%>*100/<%=zzzoom%>;
			j=<%=jjj%>*100/<%=zzzoom%>;
			s="WriteInfo.asp?all="+all+"&zoom=100&i="+i+"&j="+j;
		}
		else {
			all="no";
			s="WriteInfo.asp?all="+all+"&zoom=<%=zzzoom%>&i=<%=iii%>&j=<%=jjj%>";
		}
		document.formCtrl.action=s;
		document.formCtrl.submit();
	}
	function changeClick(id) {
		s=""+id;
		if(s=="") return;
		sList=s.split("_");
		if(sList.length!=2) return;
		
		w=1*document.images("Img"+id).width;
		h=1*document.images("Img"+id).height;
		m=1*<%=rows%>;
		n=1*<%=cols%>;
		i=sList[0];
		j=sList[1];
		x=event.offsetX;
		y=event.offsetY;
		var part=new Array();
		find4NeighbourEx(w,h,m,n,i,j,x,y,part);
		
		document.formImg.action="WriteInfo.asp?all=<%=all%>&zoom=<%=zzzoom%>"+"&i="+part[0]+"&j="+part[1];
		document.formImg.submit();
	}
	
	function changeMove(id) {
		var i,j;
		i=<%=iii%>;
		j=<%=jjj%>;
		m=1*<%=rows%>;
		n=1*<%=cols%>;
		switch (id) {
			case "CenterTop":
				if(i<=0)
					return;
				i--;
				break;
			case "CenterBottom":
				if(i+1>=m-1)
					return;
				i++;
				break;
			case "CenterLeft":
				if(j<=0)
					return;
				j--;
				break;
			case "CenterRight":
				if(j+1>=n-1)
					return;
				j++;
				break;
			case "LeftTop":
				if(i>0)
					i--;
				if(j>0)
					j--;
				break;
			case "LeftBottom":
				if(i+1<m-1)
					i++;
				if(j>0)
					j--;
				break;
			case "RightTop":
				if(i>0)
					i--;
				if(j+1<n-1)
					j++;
				break;
			case "RightBottom":
				if(i+1<m-1)
					i++;
				if(j+1<n-1)
					j++;
				break;
		}
		document.formImg.action="WriteInfo.asp?all=<%=all%>&zoom=<%=zzzoom%>"+"&i="+i+"&j="+j;
		document.formImg.submit();
		
	}
	function findAreaEx(w,h,x,y) {
		cX=w/2;cY=h/2;
		if(cX==0||cY==0||x<0||y<0||x>=w||y>=h) return -1;
			
		if(x<=cX)
		{
			if(y<=cY)	
				return 0;//LEFTTOP
			else 	
				return 2;//LEFTBOTTOM
		}
		else
		{
			if(y<=cY)
				return 1;//RIGHTTOP
			else
				return 3;//RIGHTBOTTOM
		}
	}
	function find4NeighbourEx(w,h,m,n,i,j,x,y,part) {//part:String array
		var area,k;
		//alert(m+" "+n+" "+i+" "+j);
		if(m==0 || n==0 || i<0 || i>=m || j<0 || j>=n)
			return false;
		area=findAreaEx(w,h,x,y);
		if(area==-1)
			return false;
			
		var	common=false, label=0xFF;	
		if(i==0) {
			if(j==0)
				label=0;
			else if(j==n-1)
				label =1;
			else if(area==1 || area==3)
				label=0;
			else
				label=1;
		}
		else if(i==m-1) {
			if(j==0)
				label=2;
			else if(j==n-1)
				label=3;
			else if (area==1 || area==3)
				label=2;
			else
				label =3;
		}
		else {
			if(j==0) {
				if(area==0 ||area==1 )
					label=2;
				else
					label=0;
			}
			else if(j==n-1) {
				if(area==0 ||area==1 )
					label=3;
				else
					label=1;
			}
			else
				common=true;
		}
		if(common) {
			switch(area) {
				case 0:
					label=3;
					break;
				case 1:
					label=2;
					break;
				case 2:
					label=1;
					break;
				case 3:
					label=0;
					break;
			}
		}
		switch(label) {
			case 0:
				part[0]=i;part[1]=j;
				break;
			case 1:
				part[0]=i;part[1]=j-1;
				break;
			case 2:
				part[0]=i-1;part[1]=j;
				break;
			case 3:
				part[0]=i-1;part[1]=j-1;
				break;
			default:
				return false;
		}
		return true;
	}
</script>

<%
If Request.QueryString("selection") <> "" Then
	selection=Request.QueryString("selection")
%>
	<script language="JavaScript">
		var i,j;
		i=<%=iii%>;
		j=<%=jjj%>;
		m=1*<%=rows%>;
		n=1*<%=cols%>;
		selection=<%=selection%>;
		switch (selection)
			case "CenterTop":
				if(i<=0)
					return;
				i--;
				break;
			case "CenterBottom":
				if(i+1>=m-1)
					return;
				i++;
				break;
			case "CenterLeft":
				if(j<=0)
					return;
				j--;
				break;
			case "CenterRight":
				if(j+1>=n-1)
					return;
				j++;
				break;
			case "LeftTop":
				if(i>0)
					i--;
				if(j>0)
					j--;
				break;
			case "LeftBottom":
				if(i+1<m-1)
					i++;
				if(j>0)
					j--;
				break;
			case "RightTop":
				if(i>0)
					i--;
				if(j+1<n-1)
					j++;
				break;
			case "RightBottom":
				if(i+1<m-1)
					i++;
				if(j+1<n-1)
					j++;
				break;
		}
		document.formImg.action="WriteInfo.asp?all=<%=all%>&zoom=<%=zzzoom%>"+"&i="+i+"&j="+j;
		document.formImg.submit();
	</script>
<%
End If
%>

</body>

</html>
