<%Response.Buffer=True%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>MouseOverImg</title>
</head>

<body onload="loadPage()">
<%
paramID=Request.QueryString("paramID")
llid=Session("lid")
iidx=Request.QueryString("idx")
flagedit=Request.QueryString("flagedit")
iidd=Request.QueryString("iidd")

language=Session("Language")
Dim name(2,2)
Dim identifier(2,2)
Dim address(2,2)
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

Dim i,j,k,u,l,c,info
k=-1
For i=0 to 1
	For j=0 to 1
		idA=Split(identifier(i,j),";")
		u=UBound(idA)
		l=LBound(idA)
		If u>=0 Then
			For c=l to u
				If idA(c)=paramID 
					k=c
					Exit For
				End If
			Next
		End If
		If k<>-1 Then
			Exit For
		End If
	Next
	If k<>-1 Then
		Exit For
	End If
Next
If k<>-1 Then
	nA=Split(name(i,j),";")
	aA=Split(address(i,j),";")
	If language="English" Then
		info=nA(k) & " located " & aA(k) & ". You 're Welcome"
	Else			
		info=nA(k) & " ë t¹i " & aA(k) & ". Chµo mõng c¸c b¹n"
	End If
End If
%>
<script language="JavaScript">
	function loadPage() {
		var exp=new Date();
		exp.setTime(exp.getTime() + 24*60*60*1000);
		SetCookie("BriefInfo","<%=info%>",exp);
		location.href="MapInfo.asp?info="+"&iidd=<%=iidd%>&flagedit=<%=flagedit%>"; 
	}
</script>
</body>

</html>
