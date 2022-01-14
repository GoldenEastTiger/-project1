<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/loginPro.jsp</title>
</head>
<body>
<%
// id pass 파라미터값 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");

// MemberDAO 객체생성
MemberDAO memberDAO=new MemberDAO();
// 리턴할형 MemberDTO userCheck(String id,String pass) 메서드 정의 
// MemberDTO  memberDTO =  userCheck(id,pass) 메서드 호출
MemberDTO memberDTO=memberDAO.userCheck(id, pass);

// id pass 일치 memberDTO null 아님  => 페이지 상관없이 값유지 세션값생성 ../main/main.jsp 이동 
//         틀리면 memberDTO null   => 입력하신정보가 틀림  뒤로이동
if(memberDTO!=null){
	// id pass 일치
	session.setAttribute("id", id);
	response.sendRedirect("../main/main.jsp");
}else{
	// 틀림
	%>
	<script type="text/javascript">
		alert("입력하신 정보가 틀림");
		history.back();
	</script>
	<%
}
%>
</body>
</html>


