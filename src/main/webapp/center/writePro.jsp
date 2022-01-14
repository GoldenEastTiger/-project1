<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/writePro.jsp</title>
</head>
<body>
<%
//한글처리
request.setCharacterEncoding("utf-8");
// 파라미터 가져오기  name pass subject content
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
// 글쓴날짜 date
Timestamp date=new Timestamp(System.currentTimeMillis());
// 조회수 0
int readcount=0;

// BoardDTO 객체생성
board.BoardDTO boardDTO=new board.BoardDTO();
// 멤버변수 <= 파라미터 저장
boardDTO.setName(name);
boardDTO.setPass(pass);
boardDTO.setSubject(subject);
boardDTO.setContent(content);
boardDTO.setReadcount(readcount);
boardDTO.setDate(date);

// BoardDAO 객체생성
board.BoardDAO boardDAO=new board.BoardDAO();
// 리턴할형 없음 insertBoard(BoardDTO boardDTO)
//   SELECT MAX(num) FROM board  =>   MAX(num)+1  => num 구하기
// insertBoard(boardDTO) 메서드 호출
boardDAO.insertBoard(boardDTO);

// notice.jsp 이동
response.sendRedirect("notice.jsp");
%>
</body>
</html>s






