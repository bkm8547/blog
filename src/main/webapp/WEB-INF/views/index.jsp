<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" type="text/css"
	href="/blog/resources/css/main.css">
<script type="text/javascript" src="/blog/resources/js/main.js"></script>
<meta charset="UTF-8">
</head>
<body>
	<!--header-->
	<%@include file="header.jsp"%>
	<!--header-->
	<section>
		<c:forEach var="news" items="${list}">
			<div class="news">
				<div class="news_header">
					<div class="news_title">${news.title}</div>
					<div class="news_wdate">날짜 : ${news.wdate}</div>
					<div class="news_writer">작성자 : ${news.writer}</div>
				</div>
				<div class="news_content">
					<img width="700px" src="${news.imageUrl }" />
					<p>${news.content}</p>
				</div>
				<div class="news_buttonsBar">
					<input type="button" value="수정"
						onclick="location.href='modForm.do?no=${news.no}'"> <input
						type="button" value="삭제"
						onclick="location.href='delete.do?no=${news.no}'">
				</div>
			</div>
		</c:forEach>
		<input type="button" value="글쓰기" onclick="location.href='write.do'" />
		<div class="page_bar">
			<c:if test="${paging.leftOn==true}">
				<a class="left_on"
					href="main.do?page=${paging.firstPage-paging.maxPage}"><</a>
			</c:if>
			<c:if test="${paging.leftOn==false}">
				<a class="left_off"><</a>
			</c:if>
			<c:forEach var="num" begin="${paging.firstPage}"
				end="${paging.endPage}" step="1">
				<c:if test="${page==num}">
				<a class="page_num page_off">${num}</a>
				</c:if>
				<c:if test="${page!=num}">
				<a class="page_num" page_num="${num}" href="main.do?page=${num}">${num}</a>
				</c:if>
				
			</c:forEach>
			<c:if test="${paging.rightOn==true}">
				<a class="right_on"
					href="main.do?page=${paging.firstPage+paging.maxPage}">></a>
			</c:if>
			<c:if test="${paging.rightOn==false}">
				<a class="right_off">></a>
			</c:if>
		</div>
	</section>
	<!--footer-->
	<%@include file="footer.jsp"%>
	<!--footer-->
</body>
</html>
