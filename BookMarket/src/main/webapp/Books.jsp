<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<jsp:useBean id="productDAO" class="dao.BookRepository" scope="session" />
<html>
<head>
<link rel="stylesheet"	href="./resources/css/bootstrap.min.css">
<title>도서 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" /> <%-- 맨 윗부분 --%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 목록</h1>
		</div>
	</div>
	<%
		BookRepository dao = BookRepository.getInstance();  // 상품에 대한 정보를 모두 가져온다.
		ArrayList<Book> listOfBooks = dao.getAllBooks(); // 정보들을 리스트배열로 저장.
	%>
	<div class="container">
		<div class="row" align="left" >
			<%
				for(int i=0; i<listOfBooks.size(); i++){   // 리스트배열 크기만큼 반복
					Book book = listOfBooks.get(i);
			%>
			<div class="row-md-4">
				<h3>[<%=book.getCategory()%>]<%=book.getName() %></h3>
				<p><%=book.getDescription() %>
				<p><%=book.getAuthor() %> | <%=book.getPublisher() %> | <%=book.getUnitPrice() %>원
				<p><a href="./products.jsp?id=<%=book.getBookId() %>"
				class="btn btn-secondary" role="button">상세 정보 &raquo;</a> <%-- 상세 정보를 클릭했을때 getProductId()가 가져온 정보랑 일치하는 데이터로 이동 --%>
				<hr>
			</div>
			<% 
				}
			%>
		</div>
		<p><a href="./addBook.jsp" class="btn btn-secondary" role="button">도서 등록 &raquo;</a>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>