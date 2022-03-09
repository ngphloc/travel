<%Response.Buffer=True%>
<!--#include file="LibAsp.asp"-->
<%
iidx="search"
id=Request.QueryString("id")
FindLocationID(id)
Response.Redirect "Map.asp?idx=" & iidx 
%>
