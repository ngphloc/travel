<%Response.Buffer=True%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 4.0">
<TITLE>ParentMap.asp</TITLE>
<style type="text/css">
	#layerChk {position:absolute; top:0px; left:0px}
	#layerTour {position:absolute; top:0px; left:60px}
	#layer {position:absolute; top:22px; left:0px}
	#layerLeftTop {position:absolute; top:0px; left:0px}
</style>
<!--#include file="LibJavaScript.htm"-->

</HEAD>

<BODY bgcolor="#CC99FF">
<%
'chk=1&tourSelect=1&lid=20,30

iidx=Request.QueryString("idx")
flagedit=Request.QueryString("flagedit")
iidd=Request.QueryString("iidd")
coords=Request.QueryString("coords")

llid=Session("lid")
chk=0
chk=1*Session("chk")
tourSelect=0
tourSelect=1*Session("tourSelect")
%>

<%If Session("visit")=False Then%>
<Img src="images/map/HCMMapParent.gif" name="pImg">
<script language="JavaScript">
	width=document.images("pImg").width;
	height=document.images("pImg").height;
	location.href="ChangeParent.asp?q=1&idx=<%=iidx%>&width=" + width + "&height=" + height +
	   "&iidd=<%=iidd%>&flagedit=<%=flagedit%>&coords=<%=coords%>";
</script>
<%Else%>
	<%
	If Session("TotalWidth")=0 Or Session("TotalHeight")=0 Then
		Response.Redirect "Clouds.asp"
	End If 
	%>

	<%
	language=Session("Language")
	s=""
	If chk=1 Then
		s="<div id=layerChk>"
		If language="English" Then
			s=s & "<input type='checkbox' checked name='chkTour' value='tour' OnClick='changeTourClick(this)'> Tour"
		Else
			s=s & "<input type='checkbox' checked name='chkTour' value='tour' OnClick='changeTourClick(this)'> Du lﬁch"
		End If			
		s=s & "</div> "

		Set conn = Server.CreateObject("ADODB.Connection")
		conn.Open Session("cnString")

		SQL="SELECT distinct ID,EnglishName FROM Tours"
		Set rs=Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		If Not rs.EOF Then
			s=s & "<div id=layerTour>" & _
				"<select size=1 name='selectTour' style='font-family: .VnTime; HEIGHT: 10px; WIDTH: 100px' " & _
		   		" OnChange='changeSelectTour(this)'> " & _
				"<option value=0>none" 
			Do While Not rs.EOF
		   		If 1*tourSelect=1*rs("ID") Then
					s=s & "<option selected value=" & rs("ID") & " > " & rs("EnglishName") 
				Else
					s=s & "<option  value=" & rs("ID") & " > " & rs("EnglishName") 
				End If
				rs.MoveNext
			Loop
			
			s=s & "</select>"
			s=s & "</div>"
		End If
		rs.Close
		Set rs=Nothing
		Set conn=Nothing
	Else
		s="<div id=layerChk>"
		If language="English" Then
			s=s & "<input type='checkbox'  name='chkTour' value='tour' OnClick='changeTourClick(this)'> Tour"
		Else
			s=s & "<input type='checkbox' name='chkTour' value='tour' OnClick='changeTourClick(this)'> Du lﬁch"
		End If			
		s=s & "</div> "
	End If  
	%> 
	<font face=".VNTime" size=-1>
	<form name="tour">
		<%=s%>
	</form>
	</font>

	<script language="JavaScript">
	function changeTourClick(ob) {
		document.tour.method="POST";
		if(ob.checked) v1=1;
		else v1=0;

		s="ResponseTourClick.asp?idx=<%=iidx%>&lid=<%=llid%>&iidd=<%=iidd%>&flagedit=<%=flagedit%>&coords=<%=coords%>"+
			"&chk=" + v1 + "&tourSelect=<%=tourSelect%>";
		document.tour.action=s;
		document.tour.submit();
	}
	function changeSelectTour(ob) {
		v1=ob.value;
		if(document.tour.chkTour.checked) v2=1;
		else v2=0;
		
		document.tour.method="POST";
		s="ResponseTourSelect.asp?tourSelect=" + v1 + "&idx=<%=iidx%>&lid=<%=llid%>&iidd=<%=iidd%>&flagedit=<%=flagedit%>&coords=<%=coords%>"+
		    "&chk="+v2;
		document.tour.action=s;
		document.tour.submit();
	}
	</script>

	<div id=layer OnClick=changeClick(id) border=0>
	<script language="JavaScript">
		change=true;
		wh=GetCookie("WH");//kich thuoc cua ban do nho (co the thu phong) khi hien thi
		if(wh==null || wh=="")
			change=false;
		else {
			whList=wh.split(":");
			if(whList.length!=2) {
				whList=wh.split(",");
				if(whList.length!=2)
					change=false;
				else {
					imgW=1*whList[0];
					imgH=1*whList[1];
					if(imgW==0 || imgH==0) 
						change=false;
				}
			}
			else {
				imgW=1*whList[0];
				imgH=1*whList[1];
				if(imgW==0 || imgH==0) 
					change=false;
			}
		}
		if(!change)
			s="<IMG name='ImgP' src='images/map/HCMMapParent.gif' ";
		else
			s="<IMG name='ImgP' src='images/map/HCMMapParent.gif' width=" +
			   imgW + "  height=" + imgH + " ";
		s=s + " usemap='#tour' " + ">";
		document.write(s);
	</script>

	<%
	ltPartList=Split(Session("part0"),"_")
	rbPartList=Split(Session("part3"),"_")
	'Chi so cua 4 manh hien thi
	i=1*ltPartList(0)
	j=1*ltPartList(1)
	ii=1*rbPartList(0)
	jj=1*rbPartList(1)
	'Do dai rong cua toan bo ban do lon
	Width=0
	Height=0
	'Toa do cua 4 manh hien thi that su
	iLeft=0
	iTop=0
	iRight=0
	iBottom=0

	If Session("Widths")="" Or Session("Heights")="" Then
		m=0
		n=0
	Else
		wList=Split(Session("Widths"),"_")
		hList=Split(Session("Heights"),"_")
		m=UBound(hList)+1
		n=UBound(wList)+1
	End If
	If n=Application("Cols") And m=Application("Rows") Then
		For k=0 to j-1
			iLeft=iLeft+wList(k)
		Next
		For k=0 to i-1
			iTop=iTop+hList(k)
		Next
		For k=0 to jj-1
			iRight=iRight+wList(k)
		Next
		For k=0 to ii-1
			iBottom=iBottom+hList(k)
		Next
		iRight=iRight + wList(jj) -1
		iBottom=iBottom + hList(ii) -1
		
		For k=0 to m-1
			Height=Height+1*hList(k)		
		Next
		For k=0 to n-1
			Width=Width+1*wList(k)		
		Next
	Else
		ww=Session("TotalWidth")/Application("Cols")
		hh=Session("TotalHeight")/Application("Rows")
		iLeft=ww*j
		iTop=hh*i
		iRight=ww*jj+ww-1
		iBottom=hh*ii+hh-1
		Width=Session("TotalWidth")
		Height=Session("TotalHeight")
	End If
	'Kich thuoc cham chung (cho ban do lon lan ban do nho)
	w=Session("w") 
	h=Session("h")

	'Kich thuoc cua ban do nho thuc su
	pW=Session("ParentWidth")
	pH=Session("ParentHeight")
	If pW=0 Then
		pW=120
	End If
	If pH=0 Then
		pH=120
	End If
	'Ti le giua ban do nho thuc su va ban do lon
	xRatio=pW/Width
	yRatio=pH/Height

	'x,y la tam diem thuc su cua 4 manh tren ban do nho (co tinh ti le voi ban do lon)
	'Width, Height la kich thuoc cua ban do lon
	x=(iLeft+(iRight-iLeft)/2)*xRatio-w/2 
	y=(iTop+(iBottom-iTop)/2)*yRatio-h/2 
	%>
	<script language="JavaScript">
		//Kich thuoc hien thi cua ban do nho 
		WidthP=document.images("ImgP").width;
		HeightP=document.images("ImgP").height;
		//Ti le cua ban do nho (khi hien thi va Thuc su)
		wT=WidthP/<%=pW%>;
		hT=HeightP/<%=pH%>;
		
		//x,y la tam diem hien thi cua 4 manh tren ban do nho
		x=<%=x%>*wT;
		y=<%=y%>*hT;
		
		//kich thuoc cua diem hien thi
		w=<%=w%>*wT;
		h=<%=h%>*hT;
		
		document.write("<style type='text/css'>");
		s="#layerLocate {position:absolute; left:" + x + "px; top:" + 
		  y + "px; width:" + w + "px; height:" + h + "px}";
		document.write(s);
		document.write("</style>");
	</script>

	<IMG src="images/location/ParentLocate.gif" id="layerLocate">

	<script language="JavaScript">
		function changeClick(id) {
		
			x=event.offsetX;
			y=event.offsetY;
			x=x*<%=pW%>/WidthP*<%=Session("TotalWidth")%>/WidthP;
			y=(y*<%=pH%>/HeightP)*<%=Session("TotalHeight")%>/HeightP;
			widths="<%=Session("Widths")%>";
			heights="<%=Session("Heights")%>";
			wList=widths.split("_");
			hList=heights.split("_");
			
			V=0;
			k=hList.length-1;
			for(i=0;i<hList.length;i++) {
				V=V+1*hList[i];
				if(V>y) {
					k=i;
					break;
				}
			}
			i=k;

			V=0;
			k=wList.length-1;
			for(j=0;j<wList.length;j++) {
				V=V+1*wList[j];
				if(V>x) {
					k=j;
					break;
				}
			}
			j=k;
			
			tmpI=i;tmpJ=j;
			x=findSubXXEx(widths,j,x);
			y=findSubYYEx(heights,i,y);
			i=tmpI;j=tmpJ;
			w=wList[j];
			if(x>=w) x=w-1;
			h=hList[i];
			if(y>=h) y=h-1;
			m=hList.length;
			n=wList.length;
			var part=new Array();
			find4NeighbourEx(w,h,m,n,i,j,x,y,part);
			
			if(part.length!=4) return;
			SetCookie("Coords",null);
			parent.location.href="ResponseClick.asp?idx=<%=iidx%>" +
		    "&part0="+part[0]+"&part1="+part[1]+"&part2="+part[2]+"&part3="+part[3] + 
		    "&iidd=<%=iidd%>&flagedit=<%=flagedit%>"+
		    "&chk=<%=chk%>&tourSelect=<%=tourSelect%>";
		   
		}
	</script>
	<%
	If llid="" Or chk=0 Then
		Response.End
	End If
	Function FindX(widths,i,j,x0)
		listWidths=Split(widths,"_")
		xNew=x0
		For k=0 to j-1
			'xNew=1*xNew+1*listWidths(i*2+k*1)
			xNew=1*xNew+1*listWidths(k*1)
		Next
		FindX=xNew
	End Function

	Function FindY(heights,i,j,y0)
		listHeights=Split(heights,"_")
		yNew=y0
		For h=0 to i-1
			'yNew=1*yNew+1*listHeights(h*2+j*1)
			yNew=1*yNew+1*listHeights(h*1)
		Next
		FindY=yNew
	End Function

	'Truy van co so du lieu cho tua du lich

	'Mo ket noi server
	IDList=Split(llid,",")
	u=UBound(IDList)
	If u<0 Then
		Response.End
	End If

	Dim CList()'Coord dia danh
	Dim NList()'Ten Dia danh
	ReDim CList(u+1,4)
	ReDim NList(u+1)
	ReDim AList(u+1)

	Set conn = Server.CreateObject("ADODB.Connection")
	conn.Open Session("cnString")
	ex=0
	For c=0 to u
		SQL="SELECT MapPart,MapLocation,EnglishName,VNName,EnglishAddress,VNAddress FROM Location WHERE ID= " & IDList(c)
		Set rs=Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		mp="" & rs("MapPart")
		ml="" & rs("MapLocation")
		If mp="" Or ml="" Then
			ex=1
		End If
		If ex=0 Then
			PList=Split(mp,"_")
			LList=Split(ml,",")
			If UBound(PList)<>1 Or UBound(LList)<>3 Then
				ex=1
			End If 
		End If
			
		If ex=1 Then
			rs.Close
			Set rs=Nothing
			Set conn=Nothing
			Response.End
		End If 
		
		ii=1*PList(0)
		jj=1*PList(1)
			
		CList(c,0)=FindX(Session("Widths"),ii,jj,1*LList(0))
		CList(c,1)=FindY(Session("Heights"),ii,jj,1*LList(1))
		CList(c,2)=FindX(Session("Widths"),ii,jj,1*LList(2))
		CList(c,3)=FindY(Session("Heights"),ii,jj,1*LList(3))
		
		If language="English" Then	
			NList(c)=rs("EnglishName")
			AList(c)=rs("EnglishAddress")
		Else
			NList(c)=rs("VNName")
			AList(c)=rs("VNAddress")
		End If
		rs.Close
		Set rs=Nothing
	Next
	Set conn=Nothing
	%>
	<script language="JavaScript">
	var l=new Array();
	var t=new Array();
	var r=new Array();
	var b=new Array();
	var w=<%=Session("w")/2%>, h=<%=Session("h")/2%>; //Kich thuoc diem cua tour du lich

	//Thong tin ve dia danh tour
	var info=new Array();

	//Ti so giua ban do lon va ban do nho(hien thi)
	xRatio=WidthP/<%=Session("TotalWidth")%>;
	yRatio=HeightP/<%=Session("TotalHeight")%>;
	//Gioi han cua diem anh
	limit=5;

	//Kich thuoc cua diem tour
	w=w*xRatio;
	h=h*yRatio;
	if(w<limit) w=limit;
	if(h<limit) h=limit;

	//Tao do hinh cho tour
	document.write("<map name='tour'>");
	<%For i=0 to u%>
		l[<%=i%>]=<%=CList(i,0)%>*yRatio;
		t[<%=i%>]=<%=CList(i,1)%>*yRatio;
		r[<%=i%>]=<%=CList(i,2)%>*xRatio;if(r[<%=i%>]<limit) r[<%=i%>]=limit;
		b[<%=i%>]=<%=CList(i,3)%>*yRatio;if(b[<%=i%>]<limit) b[<%=i%>]=limit;
		
		if(l[<%=i%>]>=r[<%=i%>]-limit) r[<%=i%>]=l[<%=i%>]+limit;
		if(t[<%=i%>]>=b[<%=i%>]-limit) b[<%=i%>]=t[<%=i%>]+limit;
		
		<%If language="English" Then%>
			info[<%=i%>]="<%=Trim(NList(i))%>"+" located "+"<%=AList(i)%>";
		<%Else%>
			info[<%=i%>]="<%=Trim(NList(i))%>"+" Î tπi "+"<%=AList(i)%>";
		<%End If%>
		
		ccoords=""+(l[<%=i%>]-2)+","+(t[<%=i%>]-2)+","+(r[<%=i%>]+2)+","+(b[<%=i%>]+2);
		s="<area shape='rect' coords='" + ccoords + "' alt='Tour: <%=IDList(i)%>:<%=Trim(NList(i))%>' href='../Tour.asp' >";
		document.write(s);

	<%Next%>
	document.write("<area shape='default' nohref>");
	document.write("</map>");

	//Tao cac layer cho diem tour
	document.write("<style type='text/css'>");
	<%For i=0 to u%>
		s="#<%=i%> {position:absolute; left:"+(l[<%=i%>]-w/2)+
		 "px; "+"top:"+(t[<%=i%>]-h/2)+"px ;width:"+w+"px; height:"+h+"px }";
		document.write(s);
	<%Next%>
	document.write("</style>");

	//Hien thi cac diem tour
	<%For i=0 to u%>
		s="<Img src='images/location/blink.gif' id=<%=i%> "+ 
	  	  "width=" + w + " height=" + h + 
	  	  " OnMouseOver ='changeMouseOverImg(id)' " +
	  	  " OnMouseOut ='changeMouseOutImg(id)' " +
	  	  " OnClick='changeClickImg(id)' >";
		document.write(s);
	<%Next%>

	//Cac ham dap ung thong diep
	function changeClickImg(id) {
		parent.location.href="../Tour.asp";
		event.returnValue=true;
	}
	function changeMouseOverImg(id) {

		var exp=new Date();
		exp.setTime(exp.getTime() + 24*60*60*1000);
		<%If language="English" Then%>
			s=info[1*id] + ". This place is in tour. You're welcome";
		<%Else%>
			s=info[1*id] + ". ß©y lµ Æﬁa danh trong tour. Chµo mıng c∏c bπn";
		<%End If%>
		SetCookie("BriefInfo",s,exp);
		parent.mapinfo.location.href="MapInfo.asp?idx=<%=iidx%>&info="+"&iidd=<%=iidd%>&flagedit=<%=flagedit%>"; 

		window.status="This is a tour";
	}
	function changeMouseOutImg(id) {
		var exp=new Date();
		exp.setTime(exp.getTime() + 24*60*60*1000);
		SetCookie("BriefInfo","",exp);
		parent.mapinfo.location.href="MapInfo.asp?info="+"&iidd=<%=iidd%>&flagedit=<%=flagedit%>"; 

		window.status="";
	}
	</script>

	</div>
<%End If%>
</BODY>
</HTML>
