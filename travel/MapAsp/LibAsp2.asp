<%

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