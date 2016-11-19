<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/blog/resources/css/main.css">
</head>
<body>
	<!--header-->
	<%@include file="header.jsp"%>
	<!--header-->
	<section>
		<form action="delete.do" method="post">
		<input type=hidden name="no" value="${param.no}"/>
		<table>
			<tr><td>비밀번호</td><td><input type="password" name="password"/></td></tr>
			<tr><td colspan="2"><input type="submit" value="삭제" style="float:right"/></td></tr>
		</table>
		</form>
	</section>
	<!--footer-->
	<%@include file="footer.jsp"%>
	<!--footer-->
</body>
</html>