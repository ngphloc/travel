<%Response.Buffer=True%>
<%
all=Request.QueryString("all")
zzzoom=Request.QueryString("zoom")
ii=Int(1*Request.QueryString("i"))
jj=Int(1*Request.QueryString("j"))
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
If ii<0 Then
	ii=0
End If
If ii>=rows-2 Then
	ii=rows-2
End If
If jj<0 Then
	jj=0
End If
If jj>=cols-2 Then
	jj=cols-2
End If

info="" & all & ":" & zzzoom & ":" & ii & ":" & jj
Session("Simple")=info
Response.Redirect "HCMMapSimple.asp"
%>