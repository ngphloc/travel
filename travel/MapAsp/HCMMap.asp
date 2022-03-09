<%Response.Buffer=True%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>HCMMap</title>
<!--<Basefont face=".VNTime">-->
<Basefont face="Times New Roman">

<style type="text/css">
	#layer {position:absolute; top:0px}
</style>

<%
Function MulStr(str,delimiter,number)
	ret=""
	If str<>"" And Not IsNull(str) Then
		aStr=Split(str,delimiter)
		ll=LBound(aStr)
		uu=UBound(aStr)
		For kk=ll to uu-1
			ret=ret & (number*aStr(kk)) & delimiter
		Next
		ret=ret & (number*aStr(uu))
	End If
	MulStr=ret
End Function
Function CatStr(aStr,delimiter)
	ll=LBound(aStr)
	uu=UBound(aStr)
	Dim ret
	ret=""
	For kk=ll to uu-1
		ret=ret & aStr(kk) & delimiter
	Next
	ret=ret & aStr(uu)
	CatStr=ret
End Function
%>
</head>

<body OnLoad="loadWindow()" OnUnLoad="unloadWindow()" OnKeyDown="changeKeyDown()" background="IMAGES/Bgr4.gif" bgproperties="fixed">
<script language="JavaScript">
	var wList=new Array(<%=Application("Cols")%>);
	var hList=new Array(<%=Application("Rows")%>);
	var exp=new Date();
	exp.setTime(exp.getTime() + 24*60*60*1000);
	var m,n;
	var flag=true;
	
	m=<%=Application("Rows")%>;	n=<%=Application("Cols")%>;
	
	//Can Than noi day	
	<%If Session("fast")="yes" Then%>
		swList="<%=Session("Widths")%>";
		shList="<%=Session("Heights")%>";
		if(swList==null||swList==""||shList==null||shList=="") {
		   flag=false;
		}
		else {
			awList=swList.split("_");
			ahList=shList.split("_");
			if(awList.length!=n||ahList.length!=m) {
				flag=false;
			}
			else {
				for(i=0;i<m;i++) 
					hList[i]=1*ahList[i];
				for(j=0;j<n;j++) 
					wList[j]=1*awList[j];
			}
		}
	
		if(!flag) {
			for(i=0;i<m;i++)
				hList[i]=0;
			for(j=0;j<n;j++)
				wList[j]=0;
		}
	<%End If%>
</script>
<%
lid=Split(Request.QueryString("lid"),";")
idx=Request.QueryString("idx")
If IsNull(idx) Or idx="" Then
	idx="search"
	'DestroyInfoSession
End If
flagedit=Request.QueryString("flagedit")
iidd=Request.QueryString("iidd")
coords=Request.QueryString("coords")

llid=Session("lid")
chk=0
chk=1*Session("chk")
tourSelect=0
tourSelect=1*Session("tourSelect")


Dim w,h
Dim part(2,2)
Dim shape(2,2)
Dim name(2,2)
Dim identifier(2,2)
Dim address(2,2)
Dim zoom
w=Session("w")
h=Session("h")
zoom=Session("zoom")

part(0,0)=Session("part0")
part(0,1)=Session("part1")
part(1,0)=Session("part2")
part(1,1)=Session("part3")

shape(0,0)=Session("part0locate")
shape(0,1)=Session("part1locate")
shape(1,0)=Session("part2locate")
shape(1,1)=Session("part3locate")

language=Session("Language")
If language="English" Then
	name(0,0)=Session("part0ename")
	name(0,1)=Session("part1ename")
	name(1,0)=Session("part2ename")
	name(1,1)=Session("part3ename")
	
	address(0,0)=Session("part0eaddr")
	address(0,1)=Session("part1eaddr")
	address(1,0)=Session("part2eaddr")
	address(1,1)=Session("part3eaddr")
	
Else
	name(0,0)=Session("part0vname")
	name(0,1)=Session("part1vname")
	name(1,0)=Session("part2vname")
	name(1,1)=Session("part3vname")

	address(0,0)=Session("part0vaddr")
	address(0,1)=Session("part1vaddr")
	address(1,0)=Session("part2vaddr")
	address(1,1)=Session("part3vaddr")
End If 
identifier(0,0)=Session("part0locateid")
identifier(0,1)=Session("part1locateid")
identifier(1,0)=Session("part2locateid")
identifier(1,1)=Session("part3locateid")
%>
<%
	Dim flag
	Dim sWH(2,2)
	flag=true
	tmp1=shape(0,0)
	tmp2=shape(0,1)
	tmp3=shape(1,0)
	tmp4=shape(1,1)
	tmpW=w
	tmpH=h
	If Session("fit")="yes" Then
		For i=0 to 1
			For j=0 to 1
				partList=Split(part(i,j),"_")
				If UBound(partList)=1 Then
					iii=1*partList(0)
					jjj=1*partList(1)
					nn=Application("Cols")
					mm=Application("Rows")
					wList=Split(Session("Widths"),"_")
					hList=Split(Session("Heights"),"_")
					If Ubound(wList)=nn-1 And UBound(hList)=mm-1 Then
						ww=1*wList(jjj)*zoom
						hh=1*hList(iii)*zoom
						If ww>0 And hh>0 Then
							sWH(i,j)=" width=" & ww & " height=" & hh
							If (Not IsNull(shape(i,j))) And (shape(i,j) <> "") And (zoom<>1) Then
								spe=Split(shape(i,j),";")
								aa=LBound(spe)
								bb=UBound(spe)
								For q=aa to bb
									spe(q)=MulStr(spe(q),",",zoom)
								Next
								shape(i,j)=CatStr(spe,";")
							End If
							If zoom>1 Then
								w=w+w*zoom/10
								h=h+h*zoom/10
							End If
							If zoom<1 Then
								w=w-w/zoom/10
								h=h-h/zoom/10
							End If
							If w<= 0 Then
								w=1
							End If
							If h<= 0 Then
								h=1
							End If
						Else
							flag=false
						End If
					Else
						flag=false
					End If
				Else
					flag=false
				End If
				If Not flag Then
					Exit For
				End If
			Next
			If Not flag Then
				Exit For
			End If
		Next
	Else
		If zoom<>1 Then
			For i=0 to 1
				For j=0 to 1
					partList=Split(part(i,j),"_")
					If UBound(partList)=1 Then
						iii=1*partList(0)
						jjj=1*partList(1)
						nn=Application("Cols")
						mm=Application("Rows")
						wList=Split(Session("Widths"),"_")
						hList=Split(Session("Heights"),"_")
						If Ubound(wList)=nn-1 And UBound(hList)=mm-1 Then
							ww=1*wList(jjj)*zoom
							hh=1*hList(iii)*zoom
							If ww>0 And hh>0 Then
								sWH(i,j)=" width=" & ww & " height=" & hh
								If (Not IsNull(shape(i,j))) And (shape(i,j) <> "") And (zoom<>1) Then
									spe=Split(shape(i,j),";")
									aa=LBound(spe)
									bb=UBound(spe)
									For q=aa to bb
										spe(q)=MulStr(spe(q),",",zoom)
									Next
									shape(i,j)=CatStr(spe,";")
								End If
								If zoom>1 Then
									w=w+w*zoom/10
									h=h+h*zoom/10
								End If
								If zoom<1 Then
									w=w-w/zoom/10
									h=h-h/zoom/10
								End If
								If w<= 0 Then
									w=1
								End If
								If h<= 0 Then
									h=1
								End If
							Else
								flag=false
							End If
						Else
							flag=false
						End If
					Else
						flag=false
					End If
					If Not flag Then
						Exit For
					End If
				Next
				If Not flag Then
					Exit For
				End If
			Next
		Else
			flag=false
		End If
	End If

	If Not flag Then
		shape(0,0)=tmp1
		shape(0,1)=tmp2
		shape(1,0)=tmp3
		shape(1,1)=tmp4
		w=tmpW
		h=tmpH
		zoom=1
		If Session("fit")="yes" Then
			For i=0 to 1
				For j=0 to 1
					sWH(i,j)=" width=600" & " height=400 "
				Next
			Next 
		End If
	End If
%>				

<center id=layer>
<!--<div id=layer>-->
	<table id="job" border="0" cellspacing="0" cellpadding="0" >
	<%
		For i=0 to 1
			Response.Write "<tr align=left valign=top >"
			For j=0 to 1
				Response.Write "<td id=" & "'" & "job" & part(i,j) & "' " & _
				 "OnMouseDown=" & "'" & "changeMouseDownPart" & part(i,j) & "(job" & part(i,j) & ")' " & _
				 "OnKeyDown=" & "'" & "changeKeyDownPart" & part(i,j) & "(job" & part(i,j) & ")' " & _
				 "OnMouseMove=" & "'" & "changeMouseMovePart" & part(i,j) & "(job" & part(i,j) & ")' " & _
				 "OnMouseUp=" & "'" & "changeMouseUpPart" & part(i,j) & "(job" & part(i,j) & ")' " & _
				 "OnClick=" & "'" & "changeClick" & part(i,j) & "(job" & part(i,j) & ")' " & _
				 "OnMouseOver=" & "'" & "changeMouseOver" & part(i,j) & "(job" & part(i,j) & ")' " & _
				 "OnMouseOut=" & "'" & "changeMouseOut" & part(i,j) & "(job" & part(i,j) & ")' " & _
				 ">"
				 
				Response.Write "<img border='0' " & "name=" & "'" & "Img" & _
							part(i,j) & "' " & "usemap='#HCMMap" & part(i,j) & "' " 
        		s="src=" & "'" & "images/map/HCMMap100_" & part(i,j) & ".gif" & "' "  
        		Response.Write s
        		If flag Then
					Response.Write sWH(i,j)
        		End If
        		Response.Write " ></td>"
      		Next
      		Response.Write "</tr>"
    	Next
  %>
  </table>

<% 
For i=0 to 1
	For j=0 to 1
		Response.Write "<map name=" & "'" & "HCMMap" & part(i,j) & "'" & "> "
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
					Select Case idx
						Case "detail", "search"
							s=s & "href='../DetailLocation.asp?id=0' target='_top'> "
						Case "delete"
							s=s & "href=" & "'" & "DeleteLocationMap.asp?" _
									& "idx=" & Request.QueryString("idx") _
									& "&lid=" & lid _ 
									& "' target='_parent' " _
									& " > " 
					End Select
				Else
					Select Case idx
						Case "detail","search"
							s=s & "href=" & "'" & "EditMapResponse.asp?ID=" & Trim(id(k)) _
									& "&flagaccess=1&flagedit=Update" _
									& "' target='_parent' > " 
						
						Case "delete"
							s=s & "href=" & "'" & "DeleteLocationMap.asp?id=" & Trim(id(k)) _
									& "&idx=" & Request.QueryString("idx") _
									& "&lid=" & Request.QueryString("lid") _ 
									& "' target='_parent' " _
									& "onclick='confirmDelete()' " _
									& " > " 
					End Select
				End If
				Response.Write s
			End If
		Next
		Response.Write "<area shape='default' nohref>"
		Response.Write "</map>"
	Next
Next
%>

<!--#include file="LibJavaScript.htm"-->
<script language="JavaScript">
document.write("<style type='text/css'>");
var images=new Array();
mapname="Img"+"<%=part(0,0)%>";
images[0]=document.images(mapname);
mapname="Img"+"<%=part(0,1)%>";
images[1]=document.images(mapname);
mapname="Img"+"<%=part(1,0)%>";
images[2]=document.images(mapname);
mapname="Img"+"<%=part(1,1)%>";
images[3]=document.images(mapname);

var wFlag=true,hFlag=true;
<%If zoom=1 And Session("fast")="no" Then%> //Khong co yeu cau ve toc do
	<%
	For u=0 to 1
		partList=Split(part(u,0),"_")
		If UBound(partList)=1 Then
			i=1*partList(0)
		Else
			i=0
		End If
	%>
		i=<%=i%>;
		m=<%=Application("Rows")%>
		k=<%=u%>*2;
		if(hList[i]==0) {
			hList[i]=images[k].height;
			hFlag=false;
		}
	<%Next%>
	<%
	For v=0 to 1
		partList=Split(part(0,v),"_")
		If UBound(partList)=1 Then
			j=1*partList(1)
		Else
			j=0
		End If
	%>
		j=<%=j%>;
		n=<%=Application("Cols")%>
		k=<%=v%>;
		if(wList[j]==0) {
			wList[j]=images[k].width;
			wFlag=false;
		}
	<%Next%>
	
	if(!(wFlag && hFlag)) {
		wS="";hS="";
		for(i=0;i<m-1;i++)
			hS=hS + hList[i] + "_";
		hS=hS + hList[i]; 
		for(j=0;j<n-1;j++)
			wS=wS + wList[j] + "_";
		wS=wS + wList[j]; 
		parent.parentmap.location.href="ChangeApp.asp?zoom=<%=zoom%>&widths="+
		  wS + "&heights=" + hS + "&idx=<%=Request.QueryString("idx")%>"+
		  "&iidd=<%=iidd%>&flagedit=<%=flagedit%>";
	}    	
<%End If%>


var widths,heights;
widths=""+images[0].width+"_"+images[1].width+"_"+images[2].width+"_"+
				  images[3].width;
heights=""+images[0].height+"_"+images[1].height+"_"+images[2].height+"_"+
				  images[3].height;
<%
For i=0 to 1
	For j=0 to 1
		If shape(i,j)=""	Then
			l=0
			u=-1
		Else
			spe=Split(shape(i,j),";")
			id=Split(identifier(i,j),";")
			u=UBound(spe)
			l=LBound(spe)
		End If
		For k=l to u			
			If spe(k)<>"" And id(k)<>"" Then
				list=Split(spe(k),",")
				If UBound(list)=3 Then
					width0=list(2)-list(0)
					height0=list(3)-list(1)
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
	
s="#<%=part(i,j)%>_<%=id(k)%> {position:absolute; left:" + left0 + "px; "+ 
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
		If identifier(i,j)=""	Then
			l=0
			u=-1
		Else
			id=Split(identifier(i,j),";")
			u=UBound(id)
			l=LBound(id)
		End If
		For k=l to u	
			blink=false
			If Not IsNull(lid) Then
				b=UBound(lid)
				a=LBound(lid)
				For c=a to b
					If lid(c)=id(k) Then
						blink=true
						Exit For
					End If
				Next
			End If
			If blink Then
%>
s="<Img src='images/location/blink.gif' id='<%=part(i,j)%>_<%=id(k)%>' " 
  //+ " OnMouseOver='changeMouseOverImg(id)' "+
  + " OnClick='changeClickImg(id)' >";
  
      <%Else%> 
      
s="<Img src='images/location/Locate.gif' id='<%=part(i,j)%>_<%=id(k)%>' " 
  //+ " OnMouseOver='changeMouseOverImg(id)' "+
  + " OnClick='changeClickImg(id)' >";
  
      <%End If%> 
      
document.write(s);

<%
		Next
	Next
Next
%>
</script>

<!--</div>-->
</center>

<script language="JavaScript">
function loadWindow() {
	DeleteCookie("BriefInfo");
}
function unloadWindow() {
	DeleteCookie("BriefInfo");
}
function changeClickImg(id) {
	if(id==null || event.ctrlKey || event.shiftKey ) 
		return;
	list=id.split("_");
	if(list.length<3)
		return;
	var s;
		
	idx="<%=Request.QueryString("idx")%>";
	lid="<%=Request.QueryString("lid")%>";
	s="ID=" + list[2] + "&idx=" + idx + "&lid=" + lid; 
	if(idx=="detail" || idx=="search")
		s="EditMapResponse.asp?" + s;						
	else if(idx=="delete") {
		if (confirm("Are you sure you want to delete this location?")==false)
			return;
		s= "DeleteLocationMap.asp?" + s;
	}
	parent.location.href=s+"&iidd=<%=iidd%>&flagaccess=1&flagedit=Update";			
}
	
function changeMouseOverImg(id) {
	list=id.split("_");
	if(list.length<3)
		return;
	paramID=list[2];
	//parent.mapinfo.location.href="MouseOverImg.asp?paramID="+paramID+"&info="+"&iidd=<%=iidd%>&flagedit=<%=flagedit%>"; 
}
	
function changeClick(image,i,j,x,y) {
	var part=new Array();
	m=<%=Application("Rows")%>;
	n=<%=Application("Cols")%>;
	find4Neighbour(image,m,n,i,j,x,y,part);
	idx="<%=idx%>";
	lid="<%=Request.QueryString("lid")%>";
	
	if(part.length!=4) return;
	SetCookie("Coords",null);
	parent.location.href="ResponseClick.asp?idx="+idx+
	    "&part0="+part[0]+"&part1="+part[1]+"&part2="+part[2]+"&part3="+part[3] + 
	    "&iidd=<%=iidd%>&flagedit=<%=flagedit%>"+
	    "&chk=<%=chk%>&tourSelect=<%=tourSelect%>";
}
function changeClick<%=part(0,0)%>(job) {
	x=event.offsetX;y=event.offsetY;
	shape="<%=shape(0,0)%>";
	if(event.ctrlKey) {
		event.returnValue=false;
	}
	else if(event.shiftKey || isInShape(shape,x,y)!=-1) {
		return;
	}
	<%
		s=part(0,0)
		idx=InStr(s,"_")
			
		row=Left(s,idx-1)
		col=Right(s,Len(s)-idx)
	%>
	i=<%=row%>;j=<%=col%>;
	changeClick(images[0],i,j,x,y);
}
function changeClick<%=part(0,1)%>(job) {
	x=event.offsetX;y=event.offsetY;
	shape="<%=shape(0,1)%>";
	if(event.ctrlKey) {
		event.returnValue=false;
	}
	else if(event.shiftKey || isInShape(shape,x,y)!=-1) {
		return;
	}

	<%
		s=part(0,1)
		idx=InStr(s,"_")
			
		row=Left(s,idx-1)
		col=Right(s,Len(s)-idx)
	%>
	i=<%=row%>;j=<%=col%>;
	changeClick(images[1],i,j,x,y);
}
function changeClick<%=part(1,0)%>(job) {
	x=event.offsetX;y=event.offsetY;
	shape="<%=shape(1,0)%>";
	if(event.ctrlKey) {
		event.returnValue=false;
	}
	else if(event.shiftKey || isInShape(shape,x,y)!=-1) {
		return;
	}

	<%
		s=part(1,0)
		idx=InStr(s,"_")
			
		row=Left(s,idx-1)
		col=Right(s,Len(s)-idx)
	%>
	i=<%=row%>;j=<%=col%>;
	changeClick(images[2],i,j,x,y);
}
function changeClick<%=part(1,1)%>(job) {
	x=event.offsetX;y=event.offsetY;
	shape="<%=shape(1,1)%>";
	if(event.ctrlKey) {
		event.returnValue=false;
	}
	else if(event.shiftKey || isInShape(shape,x,y)!=-1) {
		return;
	}

	<%
		s=part(1,1)
		idx=InStr(s,"_")
			
		row=Left(s,idx-1)
		col=Right(s,Len(s)-idx)
	%>
	i=<%=row%>;j=<%=col%>;
	changeClick(images[3],i,j,x,y);
}
	
function changeMouseOver(p,idd,shape,addr,nme,x,y) {
	var address,name,info;
	//var idName,sh,ii,jj,iLeft,iTop,iRight,iBottom;
	idx=isInShape(shape,x,y);
	if(idx!=-1) {
		addrList=addr.split(";");
		nameList=nme.split(";");
		//iddList=idd.split(";");
		//shapeList=shape.split(";");		
		
		if(idx<addrList.length) 
			address=addrList[idx];
		else 
			address="";
		if(idx<nameList.length) 
			name=nameList[idx];
		else 
			name="";

		//if(idx<iddList.length) 
			//idName=iddList[idx];
		//else 
			//idName="";
		//if(idx<shapeList.length) 
			//sh=shapeList[idx];
		//else 
			//sh="";
		//shList=sh.split(",");
		//if(shList.length==4) {
			//iLeft=shList[0]; iTop=shList[1];
			//iRight=shList[2];iBottom=shList[3];
		//}
		//else {
			//iLeft=0; iTop=0;
			//iRight=0;iBottom=0;
		//}	
		//pList=p.split("_");
		//if(pList.length==2) {
			//ii=pList[0];jj=pList[1];
		//}
		//else {
			//ii=0;jj=0;
		//}
	}	
	else {
		address="";
		name="";
		
		//idName="";
		//ii=0;jj=0;
		//iLeft=0; iTop=0;
		//iRight=0;iBottom=0;
	}
				
	if(name=="") 
		info="";
	else {
		<%If language="English" Then%>		
			info =name + " located	" + address + ". You are Welcome";
		<%Else%>
			info =name + " ë t¹i	" + address + ". Chµo mõng c¸c b¹n";
		<%End If%>
	}
	
	SetCookie("BriefInfo",info,exp);
	parent.mapinfo.location.href="MapInfo.asp?info="+"&iidd=<%=iidd%>&flagedit=<%=flagedit%>"; 
		
	//parent.mapinfo.document.write("<em><font face='.VnTime' color='BLUE' size=+0>" + 
	            //info + "</font></em>");
		            
	//window.status=idName;
	//if(idName!="" && idName != null) {
		//parent.parentmap.location.href="ParentMap.asp?id="+idName+"&i="+ii+
		 //"&j="+jj+"&iLeft="+iLeft+"&iTop="+iTop+"&iRight="+iRight+
		 //"&iBottom="+iBottom;
	//}
	 	
}
function changeMouseOver<%=part(0,0)%>(job) {
	x=event.offsetX;y=event.offsetY;
	shape="<%=shape(0,0)%>";
	addr="<%=address(0,0)%>";
	nme="<%=name(0,0)%>";
	idd="<%=identifier(0,0)%>";
	p="<%=part(0,0)%>";
	changeMouseOver(p,idd,shape,addr,nme,x,y);
}
function changeMouseOver<%=part(0,1)%>(job) {
	x=event.offsetX;y=event.offsetY;
	shape="<%=shape(0,1)%>";
	addr="<%=address(0,1)%>";
	nme="<%=name(0,1)%>";
	idd="<%=identifier(0,1)%>";
	p="<%=part(0,1)%>";
	changeMouseOver(p,idd,shape,addr,nme,x,y);
}
function changeMouseOver<%=part(1,0)%>(job) {
	x=event.offsetX;y=event.offsetY;
	shape="<%=shape(1,0)%>";
	addr="<%=address(1,0)%>";
	nme="<%=name(1,0)%>";
	idd="<%=identifier(1,0)%>";
	p="<%=part(1,0)%>";
	changeMouseOver(p,idd,shape,addr,nme,x,y);
}
function changeMouseOver<%=part(1,1)%>(job) {
	x=event.offsetX;y=event.offsetY;
	shape="<%=shape(1,1)%>";
	addr="<%=address(1,1)%>";
	nme="<%=name(1,1)%>";
	idd="<%=identifier(1,1)%>";
	p="<%=part(1,1)%>";
	changeMouseOver(p,idd,shape,addr,nme,x,y);
}
	
function changeMouseOut() {
	window.status="";
	//var exp=new Date();
	//exp.setTime(exp.getTime() -1000);
	//SetCookie("BriefInfo","",exp);
	//parent.mapinfo.location.href="MapInfo.asp"; 
		
	//parent.mapinfo.location.href="Blank.htm"+"&iidd=<%=iidd%>&flagedit=<%=flagedit%>";
}
function changeMouseOut<%=part(0,0)%>(job) {
	changeMouseOut();
}
function changeMouseOut<%=part(0,1)%>(job) {
	changeMouseOut();
}
function changeMouseOut<%=part(1,0)%>(job) {
	changeMouseOut();
}
function changeMouseOut<%=part(1,1)%>(job) {
	changeMouseOut();
}
	
var mouseDown=false;
var xAnchor=0,yAnchor=0,xOld=0,yOld=0,x=0,y=0;
var jAnchor=0,iAnchor=0,jOld=0,iOld=0,jCur=0,iCur=0;

function noSuccess() {
	xAnchor=yAnchor=xOld=yOld=x=y=0;			
	jAnchor=iAnchor=jOld=iOld=jCur=iCur=0;			
	mouseDown=false;
	window.status="";
}
	
function changeMouseDownPart(i,j,x0,y0) {
	xAnchor=xOld=x=findX(images,i,j,x0);
	yAnchor=yOld=y=findY(images,i,j,y0);
	jAnchor=jOld=jCur=j;
	iAnchor=iOld=iCur=i;
	return true;
}
function changeMouseDownPart<%=part(0,0)%>(job) {
	SetCookie("Coords",null);
	idx="<%=Request.QueryString("idx")%>";
	//if(!event.shiftKey || idx!="search") {
	if(!event.shiftKey) {
		noSuccess();
		return;
	}
	i=0;j=0;
	if(!changeMouseDownPart(i,j,event.offsetX,event.offsetY)) {
		noSuccess();
		return;
	}
	strStatus="coords: " + xAnchor + "," + yAnchor + "," + x + "," + y;
	window.status=strStatus;
	mouseDown=true;
	event.returnValue=false;
}
	
function changeMouseDownPart<%=part(0,1)%>(job) {
	SetCookie("Coords",null);
	idx="<%=Request.QueryString("idx")%>";
	//if(!event.shiftKey || idx!="search") {
	if(!event.shiftKey) {
		noSuccess();
		return;
	}
		
	i=0;j=1;
	if(!changeMouseDownPart(i,j,event.offsetX,event.offsetY)) {
		noSuccess();
		return;
	}
	strStatus="coords: " + xAnchor + "," + yAnchor + "," + x + "," + y;
	window.status=strStatus;
	mouseDown=true;
	event.returnValue=false;
}
function changeMouseDownPart<%=part(1,0)%>(job) {
	SetCookie("Coords",null);
	idx="<%=Request.QueryString("idx")%>";
	//if(!event.shiftKey || idx!="search") {
	if(!event.shiftKey) {
		noSuccess();
		return;
	}
	i=1;j=0;
	if(!changeMouseDownPart(i,j,event.offsetX,event.offsetY)) {
		noSuccess();
		return;
	}
	strStatus="coords: " + xAnchor + "," + yAnchor + "," + x + "," + y;
	window.status=strStatus;
	mouseDown=true;
	event.returnValue=false;
}
function changeMouseDownPart<%=part(1,1)%>(job) {
	SetCookie("Coords",null);
	idx="<%=Request.QueryString("idx")%>";
	//if(!event.shiftKey || idx!="search") {
	if(!event.shiftKey) {
		noSuccess();
		return;
	}
		
	i=1;j=1;
	if(!changeMouseDownPart(i,j,event.offsetX,event.offsetY)) {
		noSuccess();
		return;
	}
	strStatus="coords: " + xAnchor + "," + yAnchor + "," + x + "," + y;
	window.status=strStatus;
	mouseDown=true;
	event.returnValue=false;
}

function changeMouseMovePart(i,j,x0,y0) {
	xOld=x;
	yOld=y;
	jOld=jCur;
	iOld=iCur;
	
	x=findX(images,i,j,x0);
	y=findY(images,i,j,y0);
	jCur=j;
	iCur=i;
	return true;
}
function changeMouseMovePart<%=part(0,0)%>(job) {
	idx="<%=Request.QueryString("idx")%>";
	//if(!mouseDown || !event.shiftKey || idx!="search") {
	//if(!mouseDown || idx!="search") {
	if(!mouseDown || !event.shiftKey) {
		noSuccess();
		return;
	}
	i=0;j=0;
	if(!changeMouseMovePart(i,j,event.offsetX,event.offsetY)) {
		noSuccess();
		return;
	}
	strStatus="coords: " + xAnchor + "," + yAnchor + "," + x + "," + y;
	window.status=strStatus;
	event.returnValue=false;
}
function changeMouseMovePart<%=part(0,1)%>(job) {
	idx="<%=Request.QueryString("idx")%>";
	//if(!mouseDown || !event.shiftKey || idx!="search") {
	//if(!mouseDown || idx!="search") {
	if(!mouseDown || !event.shiftKey) {
		noSuccess();
		return;
	}
	i=0;j=1;
	if(!changeMouseMovePart(i,j,event.offsetX,event.offsetY)) {
		noSuccess();
		return;
	}
	strStatus="coords: " + xAnchor + "," + yAnchor + "," + x + "," + y;
	window.status=strStatus;
	event.returnValue=false;
}
function changeMouseMovePart<%=part(1,0)%>(job) {
	idx="<%=Request.QueryString("idx")%>";
	//if(!mouseDown || !event.shiftKey || idx!="search") {
	//if(!mouseDown || idx!="search") {
	if(!mouseDown || !event.shiftKey) {
		noSuccess();
		return;
	}
	i=1;j=0;
	if(!changeMouseMovePart(i,j,event.offsetX,event.offsetY)) {
		noSuccess();
		return;
	}
	strStatus="coords: " + xAnchor + "," + yAnchor + "," + x + "," + y;
	window.status=strStatus;
	event.returnValue=false;
}
function changeMouseMovePart<%=part(1,1)%>(job) {
	idx="<%=Request.QueryString("idx")%>";
	//if(!mouseDown || !event.shiftKey || idx!="search") {
	//if(!mouseDown || idx!="search") {
	if(!mouseDown || !event.shiftKey) {
		noSuccess();
		return;
	}
	i=1;j=1;
	if(!changeMouseMovePart(i,j,event.offsetX,event.offsetY)) {
		noSuccess();
		return;
	}
	strStatus="coords: " + xAnchor + "," + yAnchor + "," + x + "," + y;
	window.status=strStatus;
	event.returnValue=false;
}

function changeMouseUpPart(i,j,x0,y0) {
	xOld=x=findX(images,i,j,x0);
	yOld=y=findY(images,i,j,y0);
	jOld=jCur=j;
	iOld=iCur=i;
	return true;
}

function changeMouseUpResponse(partM) {
	window.status="";
	partM="<%=part(0,0)%>";
	if(partM=="")
		return;
	else {
		partMList=partM.split("_");
		if (partMList.length != 2)
			return;
		else {
			partI=0;partJ=0;
			partI=1*partMList[0];partJ=1*partMList[1];
		}
	}
	

	xLeft=min(xAnchor,x)/<%=zoom%>;
	yTop=min(yAnchor,y)/<%=zoom%>;
	xRight=max(xAnchor,x)/<%=zoom%>;
	yBottom=max(yAnchor,y)/<%=zoom%>;
	
	iMin=min(iAnchor,iCur);
	jMin=min(jAnchor,jCur);
	iMax=max(iAnchor,iCur);
	jMax=max(jAnchor,jCur);
	
	
	info=""+iMin+","+jMin+","+iMax+","+jMax+":";
	info=info+xLeft+","+yTop+","+xRight+","+yBottom+":";
	info=info+widths+":"+heights+":";
	info=info+partI+":"+partJ;
	SetCookie("Coords",info,exp);
	
	parent.location.href="ResponseMouseUp.asp?left="+xLeft+"&top="+yTop+
		"&right="+xRight+"&bottom="+yBottom+
		"&widths="+widths+"&heights="+heights+
		"&idx="+"<%=Request.QueryString("idx")%>"+
		"&iidd=<%=iidd%>&flagedit=<%=flagedit%>";
}

function changeMouseUpPart<%=part(0,0)%>(job) {
	SetCookie("Coords",null);
	idx="<%=Request.QueryString("idx")%>";
	//if(!mouseDown || !event.shiftKey || idx!="search") {
	if(!mouseDown || !event.shiftKey) {
		noSuccess();
		return;
	}
	i=0;j=0;
	if(!changeMouseUpPart(i,j,event.offsetX,event.offsetY)) {
		noSuccess();
		return;
	}
	
	mouseDown=false;
	event.returnValue=false;
	changeMouseUpResponse();
}
function changeMouseUpPart<%=part(0,1)%>(job) {
	SetCookie("Coords",null);
	idx="<%=Request.QueryString("idx")%>";
	//if(!mouseDown || !event.shiftKey || idx!="search") {
	if(!mouseDown || !event.shiftKey) {
		noSuccess();
		return;
	}
	i=0;j=1;
	if(!changeMouseUpPart(i,j,event.offsetX,event.offsetY)) {
		noSuccess();
		return;
	}
	mouseDown=false;
	event.returnValue=false;
	changeMouseUpResponse();
}
function changeMouseUpPart<%=part(1,0)%>(job) {
	SetCookie("Coords",null);
	idx="<%=Request.QueryString("idx")%>";
	//if(!mouseDown || !event.shiftKey || idx!="search") {
	if(!mouseDown || !event.shiftKey) {
		noSuccess();
		return;
	}
	i=1;j=0;
	if(!changeMouseUpPart(i,j,event.offsetX,event.offsetY)) {
		noSuccess();
		return;
	}
	mouseDown=false;
	event.returnValue=false;
	changeMouseUpResponse();
}
function changeMouseUpPart<%=part(1,1)%>(job) {
	SetCookie("Coords",null);
	idx="<%=Request.QueryString("idx")%>";
	//if(!mouseDown || !event.shiftKey || idx!="search") {
	if(!mouseDown || !event.shiftKey) {
		noSuccess();
		return;
	}
	i=1;j=1;
	if(!changeMouseUpPart(i,j,event.offsetX,event.offsetY)) {
		noSuccess();
		return;
	}

	mouseDown=false;
	event.returnValue=false;
	changeMouseUpResponse();
}

function changeKeyDown() {
}
function changeKeyDownPart<%=part(0,0)%>(job) {
}
function changeKeyDownPart<%=part(0,1)%>(job) {
}
function changeKeyDownPart<%=part(1,0)%>(job) {
}
function changeKeyDownPart<%=part(1,1)%>(job) {
}
function confirmDelete() {
	if (confirm("Are you sure you want to delete this location?")==false){
		event.returnValue=false;
	}
}
</script>

</body>
</html>
