<html>
<head>
<title>Scripting Tag</title>
<%-- 선언문 태그 [메소드] --%>
<%! int count = 0; %>
<body>
	page Count is
	<%-- 스트립틀릿 태그 --%>
	<%
		out.println(++count);
	%>
</body>
</head>
</html>