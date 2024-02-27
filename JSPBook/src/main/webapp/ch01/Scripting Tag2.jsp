<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
	Page Count is:
	<%-- 스크립틀릿 태그 --%>
	<%
		out.print(myMethod(0));
	%>
	<%-- 선언문 태그 [메소드] --%>
	<%! public int myMethod(int count){
		return ++count;
	}%>
</body>
</html>