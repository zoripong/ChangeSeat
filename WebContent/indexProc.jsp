<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<link rel="stylesheet" type="text/css" href="include/css/index.css">
	
<section id="sc_question">
	<form action="select.jsp" method="POST">
		<p class="question">당신의 학교를 입력해주세요.</p>
		<input type="text" name="school" id="school" required>
		<p class="question">학년을 입력해주세요.</p>
		<input type="number" min="1" max="6" name="grade" required>
		<p class="question">반을 입력해주세요.</p>
		<input type="number" min="1" name="group" required>
		<br>
		<input id="btn_submit" type="submit">
	</form>
</section>