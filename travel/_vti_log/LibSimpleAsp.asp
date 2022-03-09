<%
Function max(a,b)
	If a>b Then
		max=a
	Else
		max=b
	End If
End Function
Function min(a,b)
	If a<b Then
		min=a
	Else
		min=b
	End If
End Function
Function FindX(widths,i,j,x0)
	listWidths=Split(widths,"_")
	xNew=x0
	For k=0 to j-1
		xNew=1*xNew+1*listWidths(i*2+k*1)
	Next
	FindX=xNew
End Function

Function FindY(heights,i,j,y0)
	listHeights=Split(heights,"_")
	yNew=y0
	For h=0 to i-1
		yNew=1*yNew+1*listHeights(h*2+j*1)
	Next
	FindY=yNew
End Function

Function IsInRect(x,y,x1,y1,x2,y2)
	If x>=x1 And x<=x2 And y>=y1 And y<=y2 Then
		IsInRect=True
	Else
		IsInRect=False
	End If
End Function

Function Find4(m,n,i,j,row,col)
	If m<2 Or n<2 Or i<0 Or i>=m Or j<0 Or j>=n Then
		Find4=false
		Exit Function
	End If
	
	If i=m-1 Then
		If j=n-1 Then
			row=i-1
			col=j-1
		Else
			row=i-1
			col=j
		End If
	Else
		If j=n-1 Then
			row=i
			col=j-1
		Else
			row=i
			col=j
		End If
	End If
	Find4=true
End Function

Sub SearchLocation(ii,jj,shape,name,identifier)
	'Mo ket noi server
	Set conn = Server.CreateObject("ADODB.Connection")
	conn.Open Session("cnString")

	For i=0 to 1
		For j=0 to 1
			shape(i,j)=""
			name(i,j)=""
			identifier(i,j)=""
		
			SQL="SELECT ID,EnglishName,MapLocation FROM Location WHERE MapPart= '" & (ii+i) & "_" & (jj+j) & "'"   
			Set rs=Server.CreateObject("ADODB.Recordset")
			rs.Open SQL, conn
			
			If Not rs.EOF then 
				Do While Not rs.EOF
					shape(i,j)=shape(i,j) & rs("MapLocation") & ";"
					name(i,j)=name(i,j) & rs("EnglishName") & ";"
					identifier(i,j)=identifier(i,j) & rs("ID") & ";"
					
					rs.MoveNext
				Loop
				length=Len(shape(i,j))
				If length>0 Then
					shape(i,j)=Left(shape(i,j),length-1)
				End If
			
				length=Len(name(i,j))
				If length>0 Then
					name(i,j)=Left(name(i,j),length-1)
				End If

				length=Len(identifier(i,j))
				If length>0 Then
					identifier(i,j)=Left(identifier(i,j),length-1)
				End If
			
			End If
				
			rs.Close
			Set rs=Nothing
		Next
	Next		
	
	conn.Close
	Set conn=Nothing
End Sub

Sub SearchLocationID(ID,rows,cols,ii,jj,shape,name,identifier)

	Set conn = Server.CreateObject("ADODB.Connection")
	conn.Open Session("cnString")
	Set rs=Server.CreateObject("ADODB.Recordset")
	SQL="SELECT ID,EnglishName,MapLocation,MapPart FROM Location WHERE ID= " & ID
	rs.Open SQL,conn
	
	part=rs("MapPart")
	If Not rs.EOF Or part<>"" Then
		partList=Split(part,"_")
		If UBound(partList)=1 Then
			Dim row,col,r,c,partI,partJ
			partI=1*partList(0)
			partJ=1*partList(1)
			If (Find4(rows,cols,partI,partJ,row,col)) Then
				ii=row
				jj=col
				k=0
				r=0
				c=0
				For i=0 to 1
					For j=0 to 1
						str="" & (ii+i) & "_" & (jj+j)
						If part=str Then 
							k=1
							r=i
							c=j
							Exit For
						End If
						If k=1 Then
							Exit For
						End If
					Next
				Next
				If k=1 Then
					For i=0 to 1
						For j=0 to 1
							shape(i,j)=""
							name(i,j)=""
							identifier(i,j)=""
						Next
					Next
					shape(r,c)=shape(r,c) & rs("MapLocation") 
					name(r,c)=name(r,c) & rs("EnglishName")
					identifier(r,c)=identifier(r,c) & rs("ID")
				End If
			End If
		End If
	End If		
	rs.Close 
	Set rs=Nothing
	Set conn=Nothing
End Sub
%>
