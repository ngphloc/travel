<%
Function CheckErrorVBScript(parm_msg)
	CheckErrorVBScript = false'co loi

    If Err.Number = 0 Then 
		CheckErrorVBScript = true' khong co loi
		Exit Function
	End If
    'Co loi
    pad = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"

    Response.Write "<i><b>VBScript errors occured!!!</b></i><p>"
    Response.Write parm_msg & "<p>"
    Response.Write pad & "Error number = #" & Err.number & "<p>"
    Response.Write pad & "Error descr. = " & Err.description & "<p>"
    Response.Write pad & "Help context = " & Err.helpcontext & "<p>"
    Response.Write pad & "Help file path = " & Err.helpfile & "<p>"
    Response.Write pad & "Source = " & Err.Source & "<p>"
End Function

'Kiem tra loi he thong
Function CheckErrorDatabase(parm_SQL, parm_conn)
    HowManyErrs = parm_conn.Errors.Count
    CheckErrorDatabase = false ' Co loi
    
    'Khong loi
    If HowManyErrs = 0 Then
		CheckErrorDatabase = true
		Exit Function
    End If
    
    'The hien cac loi
    pad = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"

    Response.Write "<b><i>Database errors occured!!!</i></b><p>"
    Response.Write parm_SQL & "<p>"
    For counter = 0 To HowManyErrs - 1
        Response.Write pad & "Error #=" & parm_conn.Errors(counter).Number & "<p>"
        Response.Write pad & "Error desc. = -> " & parm_conn.Errors(counter).Description & "<p>"
    Next
End Function

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

Function CatStr(aStr,delimiter)
	l=LBound(aStr)
	u=UBound(aStr)
	Dim ret
	ret=""
	For i=l to u-1
		ret=ret & aStr(i) & delimiter
	Next
	ret=ret & aStr(u)
	CatStr=ret
End Function

Function MulStr(str,delimiter,number)
	ret=""
	If str<>"" And Not IsNull(str) Then
		aStr=Split(str,delimiter)
		l=LBound(aStr)
		u=UBound(aStr)
		For i=l to u-1
			ret=ret & (number*aStr(i)) & delimiter
		Next
		ret=ret & (number*aStr(u))
	End If
	MulStr=ret
End Function

Function IsInRect(x,y,x1,y1,x2,y2)
	If x>=x1 And x<=x2 And y>=y1 And y<=y2 Then
		IsInRect=True
	Else
		IsInRect=False
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

Sub DestroyInfoSession()
	For i=0 to 3
		part="part" & i
		locateid=part & "locateid"
		Session(locateid)=""
		vname=part & "vname"
		Session(vname)=""
		ename=part & "ename"
		Session(ename)=""
		locate=part & "locate"
		Session(locate)=""
		eaddr=part & "eaddr"
		Session(eaddr)=""
		vaddr=part & "vaddr"
		Session(vaddr)=""
	Next
	Session("selectStr")=""
	Session("idStr")=""
	Session("lid")=""
End Sub

Sub DestroySession()
	DestroyInfoSession
End Sub

Sub SearchLocation
	'Mo ket noi server
	Set conn = Server.CreateObject("ADODB.Connection")
	conn.Open Session("cnString")
	Set rs=Server.CreateObject("ADODB.Recordset")

	For i=0 to 3
		part="part" & i
		locateid=part & "locateid"
		Session(locateid)=""
		vname=part & "vname"
		Session(vname)=""
		ename=part & "ename"
		Session(ename)=""
		locate=part & "locate"
		Session(locate)=""
		eaddr=part & "eaddr"
		Session(eaddr)=""
		vaddr=part & "vaddr"
		Session(vaddr)=""
		
		SQL="SELECT ID,EnglishName,VNName,MapLocation,EnglishAddress, " & _ 
			"VNAddress FROM Location WHERE MapPart= '" & Session(part) & "'"   
		rs.Open SQL, conn
		
		If rs.EOF then 
			rs.Close
		Else
			Do While Not rs.EOF
				Session(locateid)=Session(locateid) & rs("ID") & ";"
				Session(ename)=Session(ename) & rs("EnglishName") & ";"
				Session(vname)=Session(vname) & rs("VNName") & ";"
				Session(locate)=Session(locate) & rs("MapLocation") & ";"
				Session(eaddr)=Session(eaddr) & rs("EnglishAddress") & ";"
				Session(vaddr)=Session(vaddr) & rs("VNAddress") & ";"
				rs.MoveNext
			Loop
			length=Len(Session(locateid))
			If length>0 Then
				Session(locateid)=Left(Session(locateid),length-1)
			End If
			
			length=Len(Session(ename))
			If length>0 Then
				Session(ename)=Left(Session(ename),length-1)
			End If
				
			length=Len(Session(vname))
			If length>0 Then
				Session(vname)=Left(Session(vname),length-1)
			End If
			
			length=Len(Session(locate))
			If length>0 Then
				Session(locate)=Left(Session(locate),length-1)
			End If
			
			length=Len(Session(eaddr))
			If length>0 Then
				Session(eaddr)=Left(Session(eaddr),length-1)
			End If
			
			length=Len(Session(vaddr))
			If length>0 Then
				Session(vaddr)=Left(Session(vaddr),length-1)
			End If
			
			rs.Close
		End If
	Next
	
	Set rs=Nothing
	conn.Close
	Set conn=Nothing
End Sub

Function FindLocation(xLeft,yTop,xRight,yBottom,widths,heights)
	'Mo ket noi server
	Set conn = Server.CreateObject("ADODB.Connection")
	'connectString=Session("cnString")
	'connectString="Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initial Catalog=Travel;Data Source=(local)"
	connectString="DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("data/Travel.mdb")
	
	conn.Open Session("cnString")
	'conn.Open connectString
	Set rs=Server.CreateObject("ADODB.Recordset")

	ret=False	
	For i=0 to 3
		part="part" & i
		locateid=part & "locateid"
		Session(locateid)=""
		vname=part & "vname"
		Session(vname)=""
		ename=part & "ename"
		Session(ename)=""
		locate=part & "locate"
		Session(locate)=""
		eaddr=part & "eaddr"
		Session(eaddr)=""
		vaddr=part & "vaddr"
		Session(vaddr)=""
		
		SQL="SELECT ID,EnglishName,VNName,MapLocation,EnglishAddress, " & _ 
			"VNAddress FROM Location WHERE MapPart= '" & Session(part) & "'"   
		rs.Open SQL, conn
		
		If rs.EOF then 
			rs.Close
		Else
			Do While Not rs.EOF
				run=true
				If rs("MapLocation")="" Then
					run=false
				End If
				If run Then
					shapeList=Split(rs("MapLocation"),",")
					If UBound(shapeList)=3 Then			
						l=min(shapeList(0),shapeList(2))
						t=min(shapeList(1),shapeList(3))
						r=max(shapeList(0),shapeList(2))
						b=max(shapeList(1),shapeList(3))
						x0=Int(l+(r-l)/2)
						y0=Int(t+(b-t)/2)
						ii=i/2
						jj=i mod 2
						x=FindX(widths,ii,jj,x0)
						y=FindY(heights,ii,jj,y0)
						s="" & x & " " & y & "_" & xLeft & " " & yTop & " " & xRight & " " & yBottom
						run=IsInRect(x,y,Int(xLeft),Int(yTop),Int(xRight),Int(yBottom))
					Else
						run=false
					End If
				End If
				If run Then
					Session(locateid)=Session(locateid) & rs("ID") & ";"
					Session(ename)=Session(ename) & rs("EnglishName") & ";"
					Session(vname)=Session(vname) & rs("VNName") & ";"
					Session(locate)=Session(locate) & rs("MapLocation") & ";"
					Session(eaddr)=Session(eaddr) & rs("EnglishAddress") & ";"
					Session(vaddr)=Session(vaddr) & rs("VNAddress") & ";"
				End If
				ret=ret Or run
				rs.MoveNext
			Loop
			
			length=Len(Session(locateid))
			If length>0 Then
				Session(locateid)=Left(Session(locateid),length-1)
			End If
			
			length=Len(Session(ename))
			If length>0 Then
				Session(ename)=Left(Session(ename),length-1)
			End If
					
			length=Len(Session(vname))
			If length>0 Then
				Session(vname)=Left(Session(vname),length-1)
			End If
			
			length=Len(Session(locate))
			If length>0 Then
				Session(locate)=Left(Session(locate),length-1)
			End If
			
			length=Len(Session(eaddr))
			If length>0 Then
				Session(eaddr)=Left(Session(eaddr),length-1)
			End If
			
			length=Len(Session(vaddr))
			If length>0 Then
				Session(vaddr)=Left(Session(vaddr),length-1)
			End If
			
			rs.Close
		End If
	Next

	
	Set rs=Nothing
	conn.Close
	Set conn=Nothing
	FindLocation=ret
End Function

Sub PrintSessionInfo
	For i=0 to 3
		part="part" & i
		locateid=part & "locateid"
		Response.Write "Session(" & locateid & ")=" & Session(locateid) & "<BR>"
		
		vname=part & "vname"
		Response.Write "Session(" & vname & ")=" & Session(vname) & "<BR>"
		
		ename=part & "ename"
		Response.Write "Session(" & ename & ")=" & Session(ename) & "<BR>"
		
		locate=part & "locate"
		Response.Write "Session(" & locate & ")=" & Session(locate) & "<BR>"
		
		eaddr=part & "eaddr"
		Response.Write "Session(" & eaddr & ")=" & Session(eaddr) & "<BR>"

		vaddr=part & "vaddr"
		Response.Write "Session(" & vaddr & ")=" & Session(vaddr) & "<BR>"
		
		Response.Write "<HR>"
	Next
End Sub

'Ham lay cau SQL xoa bo dac trung theo loai cua dia danh
'	.Tham so vao : .category : Loai cua dia danh
'	.Ham tra ve cau lenh SQL thi hanh lenh xoa dac trung cua dia danh
Function SQLDeleteCategoryLocation(ID, conn)
	SQL = "SELECT CategoryID FROM Location WHERE ID=" & ID
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open SQL, conn
	Call CheckErrorVBScript(attempt)
	Call CheckErrorDatabase(SQL,conn)
	SQL = ""
	'Xoa thong tin dac trung ve dia danh
	Select Case rs("CategoryID")
		'Place to stay
		Case 1
			SQL = " DELETE " &_
						" FROM PlaceToStay " &_
						" WHERE LocationID="&ID
		'Place to eat
		Case 2
			SQL = " DELETE " &_
						" FROM PlaceToEat " &_
						" WHERE LocationID="&ID
		'Place of worship
		Case 3
			SQL = " DELETE " &_
						" FROM PlaceOfWorship " &_
						" WHERE LocationID="&ID
		'Shopping
		Case 4
			SQL = " DELETE " &_
						" FROM Shopping " &_
						" WHERE LocationID="&ID
		'Entertainment & relax
		Case 5
			SQL = " DELETE " &_
						" FROM Entertainment " &_
						" WHERE LocationID="&ID
		'Museum
		Case 6
			SQL = " DELETE " &_
						" FROM Museum " &_
						" WHERE LocationID="&ID
		'Transport
		Case 7
			SQL = " DELETE " &_
						" FROM Transport " &_
						" WHERE LocationID="&ID
		'Medical service
		Case 8
			SQL = " DELETE " &_
						" FROM MedicalService " &_
						" WHERE LocationID="&ID
		'Book
		Case 9
			SQL = " DELETE " &_
						" FROM Book " &_
						" WHERE LocationID="&ID
		'VisaExtension
		Case 10
		'Bank
		Case 11
		'Communication
		Case 12
			SQL = " DELETE " &_
						" FROM Communication " &_
						" WHERE LocationID="&ID
		'Booking-office
		Case 13
			SQL = " DELETE " &_
						" FROM BookingOffice " &_
						" WHERE LocationID="&ID
		'Travel agency
		Case 14
			SQL = " DELETE " &_
						" FROM TravelAgency " &_
						" WHERE LocationID="&ID
		'Others
		Case 15
	End Select
	SQLDeleteCategoryLocation = SQL
End Function

Function DeleteLocation(ID)
	'Mo ket noi server
	Set conn = Server.CreateObject("ADODB.Connection")
	conn.Open Session("cnString")
	
conn.BeginTrans()
	
	'Dat co hoan thanh ban dau la true
	flagComplete = true
	
	'Xoa thong tin dac trung ve dia danh
	SQL = SQLDeleteCategoryLocation(ID,conn)
	If SQL <> "" Then
		conn.Execute(SQL)
		Call CheckErrorVBScript(attempt)
		If CheckErrorDatabase(SQL,conn) = false Then	flagComplete = false
	End If

	'Xoa thong tin gioi thieu ve dia danh
	SQL = "DELETE " &_
			" FROM LocationInfo" &_
			" WHERE ID="&ID
	conn.Execute(SQL)
	Call CheckErrorVBScript(attempt)
	If CheckErrorDatabase(SQL,conn) = false Then	flagComplete = false
	
	'Xoa thong tin dia danh	
	SQL = "DELETE " &_
			" FROM Location " &_
			" WHERE ID="&ID
	conn.Execute(SQL)
	Call CheckErrorVBScript(attempt)
	If CheckErrorDatabase(SQL,conn) = false Then	flagComplete = false
	
'End TRANSACTION
	If (flagComplete = true)Then
		conn.CommitTrans()
	Else
		conn.RollbackTrans()
		Response.Write "<h2>Error!!!</h2><br>Site <h2>" & "Can't delete" & "</h2> haven't been delete from database."
		Response.End
	End If
	conn.Close
	Set conn=Nothing

	
	idx=-1
	For i=0 to 3
		part="part" & i
		locateid=part & "locateid"
		S=Session(locateid)
		idx= DelSplitOnceStr(S,id,";")
		Session(locateid)=S
		
		If(idx <> -1) Then
			vname=part & "vname"
			S=Session(vname)
			DelSplitOnceIdx S,idx,";"		
			Session(vname)=S
		
			ename=part & "ename"
			S=Session(ename)
			DelSplitOnceIdx S,idx,";"		
			Session(ename)=S
		
			locate=part & "locate"
			S=Session(locate)
			DelSplitOnceIdx S,idx,";"		
			Session(locate)=S
		
			eaddr=part & "eaddr"
			S=Session(eaddr)
			DelSplitOnceIdx S,idx,";"		
			Session(eaddr)=S
		
			vaddr=part & "vaddr"
			S=Session(vaddr)
			DelSplitOnceIdx S,idx,";"
			Session(vaddr)=S
			Exit For
		End If
	Next
	
	
	
	DeleteLocation=idx
End Function

Function DelSplitOnceStr(ByRef S,str,delimiter)
	If S="" Then
		DelSplitOnceStr=-1
		Exit Function	
	End If
	
	lS=Split(S,delimiter)
	l=LBound(lS)
	u=UBound(lS)
	k=-1
	For i=l to u
		If lS(i)=str Then
			k=i
			Exit For
		End If
	Next
	
	If k<>-1 Then
		S=""
		For i=l to k-1
			S=S+lS(i)+";"
		Next 
		For i=k+1 to u
			S=S+lS(i)+";"
		Next 
		length=len(S)
		If length>0 Then
			S=Left(S,length-1)
		End If
		
		DelSplitOnceStr=k
	Else
		DelSplitOnceStr=-1
	End If	
End Function

Sub DelSplitOnceIdx(ByRef S,idx,delimiter)
	If S="" Then
		Exit Sub
	End If

	lS=Split(S,delimiter)
	l=LBound(lS)
	u=UBound(lS)
	
	If idx >= l And idx <= u Then
		S=""
		k=idx
		For i=l to k-1
			S=S+lS(i)+";"
		Next 
		For i=k+1 to u
			S=S+lS(i)+";"
		Next 
		length=len(S)
		If length>0 Then
			S=Left(S,length-1)
		End If
	End If
End Sub

Function IsInShape(shape,x,y) 
	shapeList=Split(shape,";")
	l=LBound(shapeList)
	u=UBound(shapeList)
	For i=l to u
		list=Split(shapeList(i), "," )
		x1=1*list(0)
		y1=1*list(1)
		x2=1*list(2)
		y2=1*list(3)
		if IsInRect(1*x,1*y,x1,y1,x2,y2) Then
			IsInShape= i
			Exit Function
		End If
	Next
	IsInShape= -1
End Function

Function FindArea(w,h,x,y) 
	cX=w/2 
	cY=h/2
	If cX=0 Or cY=0 Or x<0 Or y<0 Or x>=w Or y>=h Then 
		FindArea = -1
		Exit Function
	End If		
	
	If x<=cX Then
		If y<=cY Then	
			FindArea=0 'LEFTTOP
		Else 	
			FindArea=2 'LEFTBOTTOM
		End If
	Else
		If y<=cY Then
			FindArea=1 'RIGHTTOP
		Else
			FindArea=3 'RIGHTBOTTOM
		End If
	End If
End Function

Function Find4Neighbour(w,h,m,n,i,j,x,y,part) 
	Dim area,k
	If m=0 Or n=0 Or i<0 Or i>=m Or j<0 Or j>=n Then
		Find4Neighbour=false
		Exit Function
	End If
	
	area=FindArea(w,h,x,y)
	If area=-1 Then
		Find4Neighbour=false
		Exit Function
	End If
	
	Dim	common, label	
	common=false
	label=255
		
	If i=0 Then
		If j=0 Then
			label=0
		Else 
			If j=n-1 Then
				label =1
			Else 
				If area=1 Or area=3 Then
					label=0
				Else
					label=1
				End If
			End If
		End If
	Else 
		If i=m-1 Then
			If j=0 Then
				label=2
			Else 
				If j=n-1 Then
					label=3
				Else 
					If area=1 Or area=3 Then
						label=2
					Else
						label =3
					End If
				End If
			End If
		Else 
			If j=0 Then
				If area=0 Or area=1 Then
					label=2
				Else
					label=0
				End If
			Else 
				If j=n-1 Then
					If area=0 Or area=1 Then
						label=3
					Else
						label=1
					End If
				Else
					common=true
				End If
			End If
		End If
	End If
	
	If common Then
		Select Case area 
			Case 0
				label=3
			Case 1
				label=2
			Case 2
				label=1
			Case 3
				label=0
		End Select
	End If
	
	Select Case label 
		Case 0
			part(0)="" & i & "_" & j     
			part(1)="" & i & "_" & (j+1)
			part(2)="" & (i+1) & "_" & j 
			part(3)="" & (i+1) & "_" & (j+1)
		Case 1
			part(0)="" & i & "_" & (j-1)     
			part(1)="" & i & "_" & j
			part(2)="" & (i+1) & "_" & (j-1) 
			part(3)="" & (i+1) & "_" & j
		Case 2
			part(0)="" & (i-1) & "_" & j     
			part(1)="" & (i-1) & "_" & (j+1)
			part(2)="" & i & "_" & j         
			part(3)="" & i & "_" & (j+1)
		Case 3
			part(0)="" & (i-1) & "_" & (j-1)     
			part(1)="" & (i-1) & "_" & j
			part(2)="" & i & "_" & (j-1)         
			part(3)="" & i & "_" & j
			break
		Case Else
			Find4Neighbour= false
			Exit Function
	End Select
	
	Find4Neighbour=true
End Function

Function Find4(m,n,i,j,part)
	If m<2 Or n<2 Or i<0 Or i>=m Or j<0 Or j>=n Then
		Find4=false
		Exit Function
	End If
	
	If i=m-1 Then
		If j=n-1 Then
			part(0)="" & (i-1) & "_" & (j-1)
			part(1)="" & (i-1) & "_" &  j
			part(2)="" &  i    & "_" &  j-1
			part(3)="" &  i    & "_" &  j
		Else
			part(0)="" & (i-1) & "_" &  j
			part(1)="" & (i-1) & "_" &  j+1
			part(2)="" &  i    & "_" &  j
			part(3)="" &  i    & "_" & (j+1)
		End If
	Else
		If j=n-1 Then
			part(0)="" &  i    & "_" & (j-1)
			part(1)="" &  i    & "_" &  j
			part(2)="" & (i+1) & "_" & (j-1)
			part(3)="" & (i+1) & "_" &  j
		Else
			part(0)="" &  i    & "_" &  j
			part(1)="" &  i    & "_" &  j+1
			part(2)="" & (i+1) & "_" &  j
			part(3)="" & (i+1) & "_" & (j+1)
		End If
	End If
	Find4=true
End Function

Sub FindTour(cchk,ttourSelect,lllid) 'vao:cchk, ttourSelect ra: lllid
	'chk=1&tourSelect=1&lid=20,30

	If cchk=0 Then
		ttourSelect=0
		lllid=""
		Exit Sub
	End If
	
	If 1*ttourSelect <> 0 Then
		Set conn = Server.CreateObject("ADODB.Connection")
		conn.Open Session("cnString")

		SQL="SELECT LocationID FROM LocationTours WHERE TourID=" & ttourSelect
		Set rs=Server.CreateObject("ADODB.Recordset")
		rs.Open SQL, conn
		lllid=""
		If Not rs.EOF Then
			Do While Not rs.EOF
				lllid=lllid & rs("LocationID") & ","
				rs.MoveNext
			Loop
			length=Len(lllid)
			If length>0 Then
				lllid=Left(lllid,length-1)
			End If
		End If

		rs.Close
		Set rs=Nothing
		Set conn=Nothing
	Else
		lllid=""
	End If	
End Sub

Function IsTableEmpty(SQL)
	'Mo ket noi server
	Set conn = Server.CreateObject("ADODB.Connection")
	'connectString=Session("cnString")
	'connectString="Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initial Catalog=Travel;Data Source=(local)"
	'connectString="DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("data/Travel.mdb")
	
	conn.Open Session("cnString")
	Set rs=Server.CreateObject("ADODB.Recordset")
	rs.Open SQL, conn
	
	IsTableEmpty=rs.EOF
		
	rs.Close
	Set rs=Nothing
	conn.Close
	Set conn=Nothing
End Function

Sub FindLocationID(ID)
	'Mo ket noi server
	Set conn = Server.CreateObject("ADODB.Connection")
	'connectString=Session("cnString")
	'connectString="Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initial Catalog=Travel;Data Source=(local)"
	'connectString="DRIVER={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("data/Travel.mdb")
	
	conn.Open Session("cnString")
	Set rs=Server.CreateObject("ADODB.Recordset")
	SQL="SELECT ID,EnglishName,VNName,MapPart, MapLocation,EnglishAddress, " & _ 
			"VNAddress FROM Location WHERE ID= " & ID   
	rs.Open SQL,conn
	
	If Not rs.EOF Then
		MapPart="" & rs("MapPart")
		If MapPart<>"" Then
			ListPart=Split(MapPart,"_")
			If UBound(ListPart)=1 Then			
				Dim ppart(4)
				mm=Application("Rows")
				nn=Application("Cols")
				ii=1*ListPart(0)
				jj=1*ListPart(1)
				
				Call Find4(mm,nn,ii,jj,ppart)		
				Session("part0")=ppart(0)
				Session("part1")=ppart(1)
				Session("part2")=ppart(2)
				Session("part3")=ppart(3)
				
				k=-1
				Dim part
				For i=0 to 3
					part="part" & i
					locateid=part & "locateid"
					Session(locateid)=""
					vname=part & "vname"
					Session(vname)=""
					ename=part & "ename"
					Session(ename)=""
					locate=part & "locate"
					Session(locate)=""
					eaddr=part & "eaddr"
					Session(eaddr)=""
					vaddr=part & "vaddr"
					Session(vaddr)=""
					If ppart(i)=MapPart Then
						k=i
					End If
				Next
				If k=-1 Then
					k=0
				End If
				
				part="part" & k
				
				locateid=part & "locateid"
				vname=part & "vname"
				ename=part & "ename"
				locate=part & "locate"
				eaddr=part & "eaddr"
				vaddr=part & "vaddr"
				
				Session(locateid)=Session(locateid) & rs("ID") & ";"
				Session(ename)=Session(ename) & rs("EnglishName") & ";"
				Session(vname)=Session(vname) & rs("VNName") & ";"
				Session(locate)=Session(locate) & rs("MapLocation") & ";"
				Session(eaddr)=Session(eaddr) & rs("EnglishAddress") & ";"
				Session(vaddr)=Session(vaddr) & rs("VNAddress") & ";"

				length=Len(Session(locateid))
				If length>0 Then
					Session(locateid)=Left(Session(locateid),length-1)
				End If
			
				length=Len(Session(ename))
				If length>0 Then
					Session(ename)=Left(Session(ename),length-1)
				End If
					
				length=Len(Session(vname))
				If length>0 Then
					Session(vname)=Left(Session(vname),length-1)
				End If
			
				length=Len(Session(locate))
				If length>0 Then
					Session(locate)=Left(Session(locate),length-1)
				End If
			
				length=Len(Session(eaddr))
				If length>0 Then
					Session(eaddr)=Left(Session(eaddr),length-1)
				End If
			
				length=Len(Session(vaddr))
				If length>0 Then
					Session(vaddr)=Left(Session(vaddr),length-1)
				End If
			End If
		End If
	End If
	
	rs.Close
	Set rs=Nothing
	conn.Close
	Set conn=Nothing
End Sub
%>
