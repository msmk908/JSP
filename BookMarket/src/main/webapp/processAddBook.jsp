<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>

<%
	System.out.println("접속");
	request.setCharacterEncoding("UTF-8");

	String bookId = request.getParameter("bookId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String releaseDate = request.getParameter("releaseDate");
	String totalPages = request.getParameter("totalPages");
	String description = request.getParameter("description");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");
	
	Integer price;
	
	if(unitPrice.isEmpty() || unitPrice.equals(null))
		price = 0;
	else
		price = Integer.valueOf(unitPrice);
	
	long tPages;
	
	if(totalPages.isEmpty())
		tPages = 0;
	else
		tPages = Long.valueOf(totalPages);
	
	long stock;
	
	if(unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	
	BookRepository dao = BookRepository.getInstance();
	
	Book newBook = new Book();
	newBook.setBookId(bookId);
	newBook.setName(name);
	newBook.setUnitPrice(price);
	newBook.setAuthor(author);
	newBook.setPublisher(publisher);
	newBook.setReleaseDate(releaseDate);
	newBook.setTotalPages(tPages);
	newBook.setDescription(description);
	newBook.setCategory(category);
	newBook.setUnitsInStock(stock);
	newBook.setCondition(condition);
	
	dao.addBook(newBook);
	
	response.sendRedirect("Books.jsp");
%>