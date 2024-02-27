<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" />
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" /> <%-- 맨 윗부분 --%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<%
		ProductRepository dao = ProductRepository.getInstance();  // 상품에 대한 정보를 모두 가져온다.
		ArrayList<Product> listOfProducts = dao.getAllProducts(); // 정보들을 리스트배열로 저장.
	%>
	<div class="container">
		<div class="row" align="center">
			<%
				for(int i=0; i<listOfProducts.size(); i++){   // 리스트배열 크기만큼 반복
					Product product = listOfProducts.get(i);
			%>
			<div class="col-md-4">
				<img src="/upload/<%=product.getFilename()%>" style="width: 100%">
				<h3><%=product.getPname() %></h3>
				<p><%=product.getDescription() %>
				<p><%=product.getUnitPrice() %>원
				<p><a href="./product.jsp?id=<%=product.getProductId() %>"
				class="btn btn-secondary" role="button">상세 정보 &raquo;></a> <%-- 상세 정보를 클릭했을때 getProductId()가 가져온 정보랑 일치하는 데이터로 이동 --%>
			</div>
			<% 
				}
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>