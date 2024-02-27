<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<jsp:useBean id="BookDAO" class="dao.BookRepository" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<title>도서 상세 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 정보</h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
		BookRepository dao = BookRepository.getInstance();
		Book book = dao.getBookById(id);
	%>
	<div class="container">
		<div class="col-md-6">
			<h3>[<%=book.getCategory() %>] <%=book.getName() %></h3>
			<p><%=book.getDescription() %>
			<p><b>도서코드 : </b><span class="badge badge-danger">
			<%=book.getBookId() %></span>
			<p><b>출판사 : </b><%=book.getPublisher() %>
			<p><b>재고수 : </b><%=book.getUnitsInStock() %>
			<p><b>총 페이지수 : </b><%=book.getTotalPages() %>
			<p><b>출판일 : </b><%=book.getReleaseDate() %>
			<h2><%=book.getUnitPrice() %> 원</h2>
			<p> <a href="./Books.jsp"
				class="btn btn-secondary" role="button">도서주문 &raquo;></a>
				<a href="./Books.jsp"
				class="btn btn-secondary" role="button">도서목록 &raquo;></a>
		</div>
	</div>
	<hr>
	<jsp:include page="footer.jsp" />
</body>
</html>