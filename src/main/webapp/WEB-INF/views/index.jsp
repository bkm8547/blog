<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" type="text/css"
	href="/blog/resources/css/main.css">
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
				<img width="700px" src="${news.imageUrl }"/>
				<p>${news.content}</p>
				</div>
				<div class="news_buttonsBar">
				<input type="button" value="수정" onclick="location.href='modForm.do?no=${news.no}'">
				<input type="button" value="삭제" onclick="location.href='delete.do?no=${news.no}'">
				</div>
			</div>
		</c:forEach>
		<input type="button" value="글쓰기" onclick="location.href='write.do'" />
	</section>
	<!--footer-->
	<%@include file="footer.jsp"%>
	<!--footer-->
</body>
</html>
