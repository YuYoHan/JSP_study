<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scriptTag_test1</title>
</head>
<body>
	<h2>scriptTag 1</h2>
	<!-- ↓ 여기에 쓰는것들은 servlet으로 변환시켜주는데
		 servlet으로 변환된 클래스의 "전역영역"이다.
		 그렇기 때문에 선언만 가능한 것이다. -->
	<%!
		// 내부는 전부 자바 문법
		// count는 전역변수
		int count = 3;
		String sayHello(String data) {
			return "Hello" + data;
		}
		// 이곳은 서블릿 클래스의 영역이므로 소스코드를 작성할 수 없다.
		// System.out.println();
	%>
	<%
		// 1. Java Server Pages<br/>
		// 2. Java Server Pages<br/>
		// 3. Java Server Pages<br/>
		for(int i=1; i<=count; i++) {
			out.print(i + ". Java Server Pages<br/>");
		}
	%>
	<!-- HTML 주석은 컴파일이 모두 되고 나서 페이지에서 감춰지는 형태이다. -->
	<%-- JSP 주석은 안에 작성된 모든 코드가 무시되므로 JSP 주석을 권장한다. --%>
	<%-- 범위 주석처리 : 드레그하고 ctrl + shift + / --%>
	<%-- <%
		Integer.parseInt("hello"); // 오류가 발생한다.
	%> --%>
	
	<%-- <%= sayHello("JSP"); %> 이러면 에러가 생긴다.
		<%= sayHello("JSP")%> == <% out.print(sayHello("JSP")); %>
		위에 두 개는 똑같은 의미이기 때문에 <%=에서 ;을 붙여주면 세미클론을 두 번 써주는거라
		에러가 발생한다.
	--%> 
	
	sayHello("JSP")의 결과 : <%=sayHello("JSP") %>
</body>
</html>