<%Response.Buffer=True%>
<!--#include file="LibSimpleAsp.asp"-->
<%
all=Request.QueryString("all")
zzzoom=Request.QueryString("zoom")
Dim ii,jj
ii=0
jj=0
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

go=Request.Form("goto")
Dim i,j
i=0
j=0
flag=True
If go<>"" Then
	Select Case go
		Case "lt","LT","lefttop","LEFTTOP","LeftTop","home","HOME","Home"
			i=0
			j=0
		Case "rt","RT","righttop","RIGHTTOP","RightTop"
			i=0
			j=cols-1
		Case "lb","LB","leftbottom","LEFTBOTTOM","LeftBottom"
			i=rows-1
			j=0
		Case "rb","RB","rightbottom","RIGHTBOTTOM","RightBottom","end","END","End"        
			i=rows-1
			j=cols-1
		Case "c","C","center","CENTER","Center"
			i=Int(rows/2)
			j=Int(cols/2)
		Case "1"    
			i=13
			j=10
		Case "2"    
			i=13
			j=13
		Case "3"    
			i=9
			j=8
		Case "4"    
			i=16
			j=10
		Case "5"    
			i=14
			j=4
		Case "6"    
			i=15
			j=0
		Case "7"    
			i=18
			j=9
		Case "8"    
			i=18
			j=5
		Case "9"    
			i=5
			j=14
		Case "10"    
			i=12
			j=6
		Case "11"    
			i=12
			j=3
		Case "12"    
			i=0
			j=0
		Case "gv","GV","govap","go vap","Go Vap","GoVap","GO VAP","GOVAP"
			i=1
			j=9
		Case "td","TD","thuduc","thu duc","Thu Duc","ThuDuc","THU DUC","THUDUC"
			i=2
			j=14
		Case "tb","TB","tanbinh","tan binh","Tan Binh","TanBinh","TAN BINH","TANBINH"
			i=4
			j=3
		Case "pn","PN","phunhuan","phu nhuan","Phu Nhuan","PhuNhuan","PHU NHUAN","PHUNHUAN"
			i=4
			j=8
		Case "bt","BT","binhthanh","binh thanh","Binh Thanh","BinhThanh","BINH THANH","BINHTHANH"
			i=4
			j=12
		Case Else
			goList=Split(go,":")
			If UBound(goList)=1 Then
				i=1*CInt(goList(0))
				j=1*CInt(goList(1))
			Else
				goList=Split(go,",")
				If UBound(goList)=1 Then
					i=1*CInt(goList(0))
					j=1*CInt(goList(1))
				Else
					flag=false
				End If
			End If
	End Select
Else
	flag=false
End If

If flag Then
	If Find4(rows,cols,i,j,ii,jj) Then
	End If
End If 

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
ii=Int(ii*zzzoom/100)
jj=Int(jj*zzzoom/100)
info="" & all & ":" & zzzoom & ":" & ii & ":" & jj
Session("Simple")=info
Response.Redirect "HCMMapSimple.asp"
%>
