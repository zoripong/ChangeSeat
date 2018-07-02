<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="include/css/select.css">
<%
	String school = request.getParameter("school");
	
	String grade = request.getParameter("grade");
	String group = request.getParameter("group");
%>
<section id="sc_select_content">
<p id="sub_title"><%= school + "<br>" + grade + "학년    "+ group + "반"%></p>
<form action="input.jsp" method="POST">
	<input type="hidden" name="name" value="<%= (school +"_"+ grade +"_"+ group) %>">
	<input class="submit_btn" type="submit" value="자리바꾸기">
</form>
<form action="beforeList.jsp" method="POST">
	<input type="hidden" name="name" value="<%= (school +"_"+ grade +"_"+ group) %>">
	<input class="submit_btn" type="submit" value="이전내역조회">
</form>
</section>
