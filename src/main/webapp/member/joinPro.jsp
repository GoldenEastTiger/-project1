<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/joinPro.jsp</title>
</head>
<body>
<%
//한글처리
request.setCharacterEncoding("utf-8");
// request 태그파라미터값 id  pass  name email address phone mobile
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String email=request.getParameter("email");
String postcode=request.getParameter("postcode");
String addr=request.getParameter("addr1")+" "+request.getParameter("add2");
String address=postcode+" "+addr;
String phone=request.getParameter("phone");
String mobile=request.getParameter("mobile");
// 날짜 
Timestamp date=new Timestamp(System.currentTimeMillis());

// 데이터 담아서 디비작업하는 곳으로 전달 파일
// 패키지 member 파일이름 MemberDTO 만들기
// 멤버변수  set  get 

// MemberDTO  객체생성
MemberDTO memberDTO=new MemberDTO();
// set메서드 파라미터값 저장
memberDTO.setId(id);
memberDTO.setPass(pass);
memberDTO.setName(name);
memberDTO.setDate(date);
memberDTO.setEmail(email);
memberDTO.setAddress(address);
memberDTO.setPhone(phone);
memberDTO.setMobile(mobile);


// 데이터베이스 작업하는 파일
// 패키지 member 파일이름 MemberDAO 만들기
// 리턴할형 없음  insertMember(데이터를 담은 주소을 저장하는 변수) 메서드 정의

// MemberDAO  객체생성
MemberDAO memberDAO=new MemberDAO();
// insertMember(데이터를 담은 주소) 메서드 호출
memberDAO.insertMember(memberDTO);

// login.jsp 이동
response.sendRedirect("login.jsp");
%>
</body>
</html>