<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../center/notice.jsp">소통 참여 게시판</a></li>
<li><a href="#">법무게시판</a></li>
<li><a href="../fcenter/fnotice.jsp">정보자료 다운로드</a></li>
<li><a href="#">칭찬합시다</a></li>
</ul>
</nav>

<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<%
//데이터 담아서 디비작업하는 곳으로 전달 파일
//패키지 board 파일이름 BoardDTO 만들기
//멤버변수  set  get 

//데이터베이스 작업하는 파일
//패키지 board 파일이름 BoardDAO 만들기
// BoardDAO 객체생성
board.BoardDAO boardDAO=new board.BoardDAO();
// 한화면에 보여줄 글개수 설정
int pageSize =15;
// http://localhost:8080/FunWeb/center/notice.jsp
// http://localhost:8080/FunWeb/center/notice.jsp?pageNum=2
// 현 페이지 번호 가져오기 
String pageNum=request.getParameter("pageNum");
// 페이지 번호가 없으면 "1" 설정
if(pageNum==null){
	pageNum="1";
}
// pageNum 정수형으로 변경
int currentPage=Integer.parseInt(pageNum);
// 시작하는 행번호
//  currentPage  pageSize  => startRow
//     1           10     =>   (1-1)*10+1 =>0*10+1=>0+1 =>1
//     2           10     =>   (2-1)*10+1 =>1*10+1=>10+1=>11
//     3           10     =>   (3-1)*10+1 =>2*10+1=>20+1=>21

int startRow=(currentPage-1)*pageSize+1;
// 끝나는 행번호 
//startRow  pageSize => endRow
//   1         10    =>   1+10-1=>10
//   11        10    =>   11+10-1=>20
//   21        10    =>   21+10-1=>30

int endRow=startRow+pageSize-1;

//리턴할형 List<BoardDTO>  getBoardList(int startRow,int pageSize) 메서드 정의
//List<BoardDTO> boardList =   getBoardList(startRow, pageSize) 메서드 호출
List<board.BoardDTO> boardList=boardDAO.getBoardList(startRow,pageSize);

// 전체 게시판 글 개수 구하기 
// 리턴할형 int getBoardCount() 메서드 정의
// int count = getBoardCount() 메서드 호출
int count=boardDAO.getBoardCount();
%>
<article>
<h1>소통 & 참여 [소통갯수 : <%=count%>]</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
    <%
    //날짜 => 원하는 형태로 변경(문자열)
            SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
            
            for(int i=0;i<boardList.size();i++){
            	board.BoardDTO boardDTO=boardList.get(i);
    %>
  <tr onclick="location.href='content.jsp?num=<%=boardDTO.getNum()%>'">
  <td><%=boardDTO.getNum() %></td>
  <td class="left"><%=boardDTO.getSubject() %></td>
    <td><%=boardDTO.getName() %></td>
    <td><%=dateFormat.format(boardDTO.getDate()) %></td>
    <td><%=boardDTO.getReadcount() %></td></tr>  	
    	<%
    }
    %>


</table>

<%
// 세션값 가져오기
String id=(String)session.getAttribute("id");
// if 세션값이 있으면 (세션값이 null 아니면, 로그인 되어있으면 )
// 글쓰기 버튼 보이기 
if(id!=null){
	%>
<div id="table_search">
<input type="button" value="글쓰기" class="btn" onclick="location.href='write.jsp'">
</div>
	<%
}
%>
<div id="table_search"><input type="text" name="검색" class="input_box">
<input type="button" value="검색" class="btn">
</div>

<div class="clear"></div>
<div id="page_control">
<%
// 한 화면에 보여줄 페이지 개수 설정
int pageBlock=10;
// 시작하는 페이지번호 구하기
// currentPage  pageBlock  => startPage
//   1~10(00~09)        10      =>    (00~09)/10*10+1=>0*10+1=>0+1=>1
//   11~20(10~19)       10      =>    (10~19)/10*10+1=>1*10+1=>10+1=>11
//   21~30(20~29)       10      =>    (20~29)/10*10+1=>2*10+1=>20+1=>21
int startPage=(currentPage-1)/pageBlock*pageBlock+1;
// 끝나는 페이지번호 구하기
// startPage  pageBlock => endPage
//     1         10     =>  1+10-1 => 10
//     11        10     =>  11+10-1 => 20
//     21        10     =>  21+10-1 => 30
int endPage=startPage+pageBlock-1;
// 전체페이지 구하기 => 전체글 개수  50  한화면에 보여줄 글개수 10 => 전체페이지수 5 + 남은글이 없으면 0페이지
// 전체페이지 구하기 => 전체글 개수  55  한화면에 보여줄 글개수 10 => 전체페이지수 5 + 남은글 5개 1페이지 추가
int pageCount=count/pageSize+(count%pageSize==0?0:1);

// 끝나는페이지 10 >  전체페이지 2 
// 끝나는페이지 10에서 2로 변경
if(endPage > pageCount){
	endPage=pageCount;
}

// 1 ~10  ,  11 ~20 , 21 ~30
if(startPage > pageBlock){
	%><a href="notice.jsp?pageNum=<%=startPage-pageBlock%>">Prev</a><%
}
%>

<%
for(int i=startPage;i<=endPage;i++){
	%><a href="notice.jsp?pageNum=<%=i%>"><%=i %></a> <%
}

//끝나는페이지번호 10  20  30  <  전체페이지 50  => Next
if(endPage < pageCount){
	%><a href="notice.jsp?pageNum=<%=startPage+pageBlock%>">Next</a><%
}
%>


</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>