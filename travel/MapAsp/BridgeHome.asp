<%Response.Buffer=True%>
<%
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
Response.Redirect "../Default.htm"
%>
