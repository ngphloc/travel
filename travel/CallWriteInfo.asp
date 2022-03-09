<%'Response.Buffer=True%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" type="text/css" href="webnews.css">
<title>Call Write Info</title>

</head>

<body onload="loadPage()" bgcolor="#6699CC" topMargin=4 MARGINHEIGHT="0" MARGINWIDTH="0">
<%
move=Request.QueryString("move")

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

<script laguage="JavaScript">
	function loadPage() {
		var i,j;
		i=<%=iii%>;
		j=<%=jjj%>;
		m=1*<%=rows%>;
		n=1*<%=cols%>;
		move="<%=move%>";
		switch (move) {
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
		//alert("<%=iii%>"+"<%=jjj%>"+":"+i+" "+j+" "+move);
		location.href="WriteInfo.asp?all=<%=all%>&zoom=<%=zzzoom%>"+"&i="+i+"&j="+j;
	}
</script>
</body>

