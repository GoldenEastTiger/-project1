<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
// 세션값 가져오기
String id=(String)session.getAttribute("id");
// 세션값이 없으면 (로그인 안된 상태)
//        있으면 (로그인한 상태)
if(id==null){
	// 세션값이 없으면 (로그인 안된 상태)
	%>
<div id="login"><a href="../member/login.jsp">login</a> | 
             <a href="../member/join.jsp">join</a></div>	
	<%
}else{
   // 세션값이 있으면 (로그인한 상태)
   %>
<div id="login"><%=id %> 님 | <a href="../member/logout.jsp">logout</a> 
            | <a href="../member/update.jsp">update</a></div>   
   <%
}
%>

<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/logo.jpg" width="260" height="60" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">메인페이지</a></li>
	<li><a href="../company/welcome.jsp">양산소개</a></li>
	<li><a href="#">종합민원</a></li>
	<li><a href="../center/notice.jsp">소통과참여</a></li>
	<li><a href="#">분야별 정보</a></li>
</ul>
</nav>
</header>