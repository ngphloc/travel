<%Response.Buffer=True%>
<!--#include file="LibAsp.asp"-->
<%
iidx=Request.QueryString("idx")
iidd=Request.QueryString("iidd")
flagedit=Request.QueryString("flagedit")
llid=Session("lid")
go=Request.QueryString("goto")
Dim i,j
m=Application("Rows")
n=Application("Cols")
flag=true
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
	Dim partT(4)
	If Find4(m,n,i,j,partT) Then
		Session("part0")=partT(0)
		Session("part1")=partT(1)
		Session("part2")=partT(2)
		Session("part3")=partT(3)
		Select Case iidx
			Case "search" 
				DestroyInfoSession
			Case "detail"
				SearchLocation	
		End Select
	End If
End If 
Response.Redirect "Map.asp?idx=" & iidx & "&iidd=" & iidd & "&flagedit=" & flagedit
%>
