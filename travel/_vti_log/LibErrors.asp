<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Lib Errors</title>
</head>

<body>

<%
'Kiem tra loi he thong
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

%>

</body>

</html>
