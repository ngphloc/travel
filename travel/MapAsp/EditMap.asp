<%Response.Buffer=true%>
<!--#include file="LibAsp.asp"-->
<%
llid=Session("lid")
iidx=Request.QueryString("idx")
flagedit=Request.QueryString("flagedit")
iidd=Request.QueryString("iidd")

Select Case iidx
	Case "search" 
		DestroyInfoSession
	Case "detail"
		SearchLocation	
End Select

whichFN=Server.MapPath("/Travel/MapAsp/Text/LocationInfo.txt")
Set fs=Server.CreateObject("Scripting.FileSystemObject")
Set thisfile=fs.CreateTextFile(whichFN,True)

LocationInfo=""
LocationInfo=	Request.Form("EnglishName") & "`~" & _
				Request.Form("VNName") & "`~" & _
				Request.Form("Category") & "`~" & _
				Request.Form("YearBuilt") & "`~" & _
				Request.Form("Precinct") & "`~" & _
				Request.Form("District") & "`~" & _
				Request.Form("EnglishAddress") & "`~" & _
				Request.Form("VNAddress") & "`~" & _
				Request.Form("Phone") & "`~" & _
				Request.Form("Fax") & "`~" & _
				Request.Form("Email") & "`~" & _
				Request.Form("Website") & "`~" & _
				Request.Form("MapLocation") & "`~" & _
				Request.Form("MapPart") & "`~" & _
				Request.Form("MainImage") & "`~" & _
				Request.Form("MainSound") & "`~" & _
				Request.Form("MainMovie") & "`~" & _
				Request.Form("tpCategory") & "`~" & _   
				Request.Form("EnglishIntroduction") & "`~" & _
        		Request.Form("Design") & "`~" & _
				Request.Form("Standard") & "`~" & _
				Request.Form("MinPrice") & "`~" & _
				Request.Form("MaxPrice") & "`~" & _
				Request.Form("Food") & "`~" & _
				Request.Form("PrincipalDish") & "`~" & _
				Request.Form("Worship") & "`~" & _
				Request.Form("Shopping") & "`~" & _
				Request.Form("Entertainment") & "`~" & _
				Request.Form("Transport") & "`~" & _
				Request.Form("MedicalService") & "`~" & _
				Request.Form("Book") & "`~" & _
				Request.Form("Communication") & "`~" & _
				Request.Form("BookingOffice")	& "`~" & _	
				Request.Form("Inbound") & "`~" & _
				Request.Form("Outbound") & "`~" & _		
				Request.Form("Trekking") & "`~" & _		
				Request.Form("MotorbikingTour") & "`"
thisfile.WriteLine LocationInfo

thisfile.Close
Set thisfile=Nothing
Set fs=Nothing

Call FindLocationID(iidd)
Response.Redirect "Map.asp?idx=" & iidx & "&iidd=" & iidd & "&flagedit=" & flagedit    
%>
