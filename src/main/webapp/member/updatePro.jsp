<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updatePro.jsp</title>
</head>
<body>
<%
// 한글처리
request.setCharacterEncoding("utf-8");
// request id pass name email address phone mobile
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String email=request.getParameter("email");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String mobile=request.getParameter("mobile");

// 수정할 데이터를 MemberDTO 저장
// MemberDTO updateDTO 객체생성
MemberDTO updateDTO=new MemberDTO();
// set 호출 파라미터값 가져와서 저장
updateDTO.setId(id);
updateDTO.setPass(pass);
updateDTO.setName(name);
updateDTO.setEmail(email);
updateDTO.setAddress(address);
updateDTO.setPhone(phone);
updateDTO.setMobile(mobile);

// id pass 일치 여부 확인
// MemberDAO 객체생성
MemberDAO memberDAO=new MemberDAO();
// MemberDTO  memberDTO =  userCheck(id,pass) 메서드 호출
MemberDTO memberDTO=memberDAO.userCheck(id, pass);

// id pass 일치 memberDTO null 아님  => 
//              리턴할형없음    updateMember(MemberDTO updateDTO)      메서드 정의 
//                  수정할내용 name email address phone mobile 조건 id
//                         updateMember(updateDTO) 메서드 호출
//                          ../main/main.jsp 이동 
//         틀리면 memberDTO null   => 입력하신정보가 틀림  뒤로이동
// id pass 일치 memberDTO null 아님  => 페이지 상관없이 값유지 세션값생성 ../main/main.jsp 이동 
//         틀리면 memberDTO null   => 입력하신정보가 틀림  뒤로이동
if(memberDTO!=null){
	// id pass 일치
	//수정 메서드 호출
	memberDAO.updateMember(updateDTO);
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


