<%Response.Buffer=True%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 4.0">
<TITLE>ResponseIndexMap</TITLE>
</HEAD>
<BODY>
<!--#include file="LibAsp.asp"-->
<%
	iidx=Request.QueryString("idx")
	llid=Session("lid")
	flagedit=Request.QueryString("flagedit")
	iidd=Request.QueryString("iidd")
	
	flag=Request.QueryString("flag")
	locatetext=Request.Form("locatetext")
	locateselect=Request.Form("locateselect")
	language=Session("Language")
	Session("selectStr")=""
	Session("idStr")=""
	Session("idChoice")=""
	If flag=1 Then
		Select Case iidx
			Case "search" 
				DestroyInfoSession
			Case "detail"
				SearchLocation	
			Case "delete"
				'SQL=Request.QueryString("SQL")
				'If IsTableEmpty(SQL) Then
					'iidx="search"
				'End If
		End Select
	
		Response.Redirect "Map.asp?idx=" & iidx & "&iidd=" & iidd & "&flagedit=" & flagedit
	Else
		If language<>"English" Then
			If locatetext="kh«ng" Then
				sf="none"
			Else			
				sf=locatetext
			End If
		Else
			sf=locatetext
		End If
		If sf="none" Or sf="" Then
			'Code here
		Else
			If locatetext="*" Then
				locatetext="%"
			End If
			Set conn = Server.CreateObject("ADODB.Connection")
			conn.Open Session("cnString")
			Set rs=Server.CreateObject("ADODB.Recordset")
		
			If language="English" Then
				SQL="SELECT ID,EnglishName FROM Location WHERE EnglishName LIKE '" & _
				     locatetext & Session("Wildcards") & "'"
				name="EnglishName"   
			Else
				SQL="SELECT ID,VNName FROM Location WHERE VNName LIKE '" & locatetext & _ 
				    Session("Wildcards") & "'"   
				name="VNName"   
			End If
			rs.Open SQL, conn
				
			Do While Not rs.EOF
				Session("selectStr")=Session("selectStr") & rs(name) & "_"
				Session("idStr")=Session("idStr") & rs("ID") & "_"
				rs.MoveNext 
			Loop			
			rs.Close 
			Set rs=Nothing
			'conn.Cancel 
			Set conn=Nothing
		End If
		Response.Redirect "IndexMap.asp?idx=" & iidx & "&iidd=" & iidd & "&flagedit=" & flagedit

	End If
%>
<script language="JavaScript">
</script>
</BODY>
</HTML>
