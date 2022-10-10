<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scriptTag test2</title>
</head>
<body>
	<p> NOW : <%= new java.util.Date() %></p>
	<table border="1">
		<%
			for(int i=1; i <=3; i++) {
				out.print("<tr>");
				for(int j=1; j<=5; j++){
					out.print("<td>");
					out.print(i+"행"+j+"열");
					out.print("</td>");
				}
				out.print("</tr>");
			}
		%>
	</table> 
	<hr>
	<table border="1">
		<%
			for(int i =1; i<=3; i++) {
		%>
			<tr>
				<% for(int j=1; j<=5; j++){ %>
					<td><%=i%>행<%=j%>열</td>
				<%} %>
			</tr>
		<% 
			}
		%>
	</table>
	
</body>
</html>