<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fcenter/fupdatePro.jsp</title>
</head>
<body>
<%
String uploadPath=request.getRealPath("/upload");
int maxSize=10*1024*1024;
MultipartRequest multi=new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());


//request 파라미터  num name subject content 가져오기

int num=Integer.parseInt(multi.getParameter("num"));
String name=multi.getParameter("name");
String pass=multi.getParameter("pass");
String subject=multi.getParameter("subject")+ "(첨부파일)";
String content=multi.getParameter("content");
//첨부파일
String file=multi.getFilesystemName("file");
//첨부파일이 없으면
if(file==null){
	//기존파일이름 가져오기
	file=multi.getParameter("oldfile");
}
// int num=Integer.parseInt(request.getParameter("num"));
// String name=request.getParameter("name");
// String subject=request.getParameter("subject");
// String content=request.getParameter("content");
// String file=request.getParameter("file");

// BoardDTO 객체생성
BoardDTO fboardDTO=new BoardDTO();
// set메서드 파라미터 저장
fboardDTO.setNum(num);
fboardDTO.setName(name);
fboardDTO.setPass(pass);
fboardDTO.setSubject(subject);
fboardDTO.setContent(content);
fboardDTO.setFile(file);

//BoardDAO 객체생성
BoardDAO fboardDAO=new BoardDAO();
// 리턴할형없음 updateBoard(BoardDTO boardDTO) 메서드 정의
// updateBoard(boardDTO)  메서드 호출
fboardDAO.fupdateBoard(fboardDTO);

// notice.jsp 이동
response.sendRedirect("fnotice.jsp");
%>
</body>
</html>