<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오늘의 날짜와 시간</title>
</head>

####### SK Hynix 취약점 진단 팀 파일 업로드 취약점 점검 #######

<body>
현재 날짜와 시간은 <%= nowTime %> 입니다.
<br>-------------------------------------------------------------------<br>
현재 날짜와 시간은 <%= sf.format(nowTime) %> 입니다.


</body>
</html>
