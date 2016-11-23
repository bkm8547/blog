<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" type="text/css"
	href="/blog/resources/css/main.css">
<link rel="stylesheet" type="text/css"
	href="/blog/resources/css/write.css">
<meta charset="UTF-8">
</head>
<body>
	<!--header-->
	<%@include file="header.jsp"%>
	<!--header-->
	<section>
		<c:if test="${param.no!=null&&param.no>0}">
			<form action="modify.do" method="post">
			<input type="hidden" name="no" value="${param.no}"/>
		</c:if>
		<c:if test="${param.no==null||param.no<=0}">
			<form action="write.do" method="post">
		</c:if>
		<table>
			<tr>
				<td>제목</td>
				<td colspan="3" class="title"><input type="text" name="title"
					value="${news.title}" /></td>
			</tr>
			<tr>
				<td>게시자</td>
				<td class="writer"><input type="text" name="writer"
					value="${news.writer}" /></td>
				<td>비밀번호</td>
				<td class="password"><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td>이미지URL</td>
				<td colspan="3" class="title"><input type="text" name="imageUrl"
					value="${news.imageUrl}" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3" class="content"><textarea name="content">${news.content}</textarea></td>
			</tr>
			<tr>
				<td colspan="4"><input type="reset" value="취소"><input
					type="submit" value="글쓰기" /></td>
			</tr>
		</table>
		</form>
	</section>
	<!--footer-->
	<%@include file="footer.jsp"%>
	<!--footer-->
</body>
</html>