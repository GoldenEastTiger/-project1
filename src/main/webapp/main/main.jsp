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
<link href="../css/front.css" rel="stylesheet" type="text/css">

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->

<!--[if IE 6]>
 <script src="../script/DD_belat아니dPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   
 </script>
 <![endif]--> 


</head>
<body>
<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img"><img src="../images/main2.jpg"
 width="971" height="282"></div>
<!-- 메인이미지 들어가는곳 -->


<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<div id="solution">
<div id="hosting">
<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;축제 이야기</h3>
<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;축제의 도시 양산의  <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;다양한 축제를 소개합니다</p>
</div>
<div id="security">
<h3>&nbsp;&nbsp;&nbsp;&nbsp;테마가 있는 양산</h3>
<p> 다양한 테마로 양산을 가족과&nbsp;&nbsp; 함께 <br>
즐겨보세요.
</p>
</div>
<div id="payment">
<h3>&nbsp;&nbsp;&nbsp;&nbsp;문화 관광 소식</h3>
<p> 양산의 착한 여행 <br>
양산여행 영상공모전 공모결과 <br>
문화예술 운용 지침서 <br>
</p>
</div>
</div>
<div class="clear"></div>
<div id="sec_news">
<h3><span class="orange">새로운</span> 소식</h3>
<dl>
<dt>일자리경제과</dt>
<dd>양산시 사회적경제기업과 함께하는 <br>
「양산시 사회적경제 체험마당」을 아래와 같이 개최하오니 많은 참여 바랍니다.</dd>
</dl>
<dl>
<dt>미래산업과</dt>
<dd>취약계층 아동의 경제적 자립지원 강화를 위한<br>
 「디딤씨앗통장」신규 가입 및 후원 안내드리니 많은 관심 부탁드립니다.</dd>
</dl>
</div>
<div id="news_notice">
<h3 class="brown">소통 &amp; 참여</h3>
<table>
<%
//BoardDAO 객체생성
board.BoardDAO boardDAO=new board.BoardDAO();
int startRow=1;
int pageSize=5;
//List<BoardDTO> boardList =   getBoardList(startRow, pageSize) 메서드 호출
List<board.BoardDTO> boardList=boardDAO.getBoardList(startRow,pageSize);
SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
for(int i=0;i<boardList.size();i++){
	board.BoardDTO boardDTO=boardList.get(i);
%>
	<tr><td class="contxt"><a href="#"><%=boardDTO.getSubject() %></a></td>
    <td><%=dateFormat.format(boardDTO.getDate()) %></td></tr>
    <%
}
%>
</table>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>