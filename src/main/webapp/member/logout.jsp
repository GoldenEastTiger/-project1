<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/logout.jsp</title>
</head>
<body>
<%
//로그아웃   세션내장객체 : 연결유지 값  => 세션내장객체 전체삭제
session.invalidate();
%>
<script type="text/javascript">
	alert("로그아웃");
	location.href="../main/main.jsp";
</script>
</body>
</html>