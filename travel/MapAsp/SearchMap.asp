<%Response.Buffer=True%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 4.0">
<TITLE>SearchMap</TITLE>
</HEAD>
<BODY>
<!--#include file="LibAsp.asp"-->
<%
iidx=Request.QueryString("idx")
llid=Session("lid")
id=Request.QueryString("id")
Session("idChoice")=""
language=Session("Language")


Set conn = Server.CreateObject("ADODB.Connection")
conn.Open Session("cnString")
Set rs=Server.CreateObject("ADODB.Recordset")
SQL="SELECT ID,EnglishName,VNName,MapLocation,EnglishAddress, " & _ 
		"VNAddress,MapPart FROM Location WHERE ID= " & id 
rs.Open SQL,conn
change=true
part=rs("MapPart")
If (Not rs.EOF) And part<>"" Then
	partList=Split(part,"_")
	If UBound(partList)=1 Then
		i=1*partList(0)
		j=1*partList(1)
		Dim p(4)
		If (Find4(Application("Rows"),Application("Cols"),i,j,p)) Then
			Session("part0")=p(0)
			Session("part1")=p(1)
			Session("part2")=p(2)
			Session("part3")=p(3)
			str="" & i & "_" & j
			k=0
			For i=0 to 3 
				If p(i)=str Then 
					k=i
					Exit For
				End If
			Next
			DestroyInfoSession
			part="part" & k
			
			locateid=part & "locateid"
			Session(locateid)=Session(locateid) & rs("ID") 
			
			vname=part & "vname"
			Session(vname)=Session(vname) & rs("VNName") 
			ename=part & "ename"
			Session(ename)=Session(ename) & rs("EnglishName")
			locate=part & "locate"
			Session(locate)=Session(locate) & rs("MapLocation")
			eaddr=part & "eaddr"
			Session(eaddr)=Session(eaddr) & rs("EnglishAddress") 
			vaddr=part & "vaddr"
			Session(vaddr)=Session(vaddr) & rs("VNAddress") 
			
			Session("idChoice")=id
		Else
			change=false
		End If
	Else
		change=false
	End If
Else
	change=false
End If		
		
rs.Close 
Set rs=Nothing
Set conn=Nothing
		    
If Not change Then
%>
	<script language="JavaScript">
		<%If language="English" Then %>
			alert("Not Found");
		<%Else%>
			alert("Kh«ng t×m thÊy");
		<%End If%>
		location.href="Map.asp?idx=<%=iidx%>";
	</script >
<%
Else
	Response.Redirect "Map.asp?idx=" & iidx 
End If
%>

</BODY>
</HTML>
