<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<link rel="stylesheet" type="text/css" href="include/css/index.css">
<script>
	function checkValid(){
		var password = prompt("비밀번호를 입력하세요.");
		if(password == "1234"){
			document.getElementById("school").value = "admin";
			document.getElementById("select_form").submit();
		}else{
			alert("틀렸습니다.");
		}
	}

</script>	
<section id="sc_question">
	<form id="select_form" action="select.jsp" method="POST">
		<p class="question">당신의 학교를 입력해주세요.</p>
		<input type="text" name="school" id="school" required>
		<p class="question">학년을 입력해주세요.</p>
		<input type="number" min="1" max="6" name="grade" required>
		<p class="question">반을 입력해주세요.</p>
		<input type="number" min="1" name="group" required>
		<br>
		<input class="btn_submit" type="button" onclick="checkValid();" value="관리자 로그인하기"><br>
		<input class="btn_submit" type="submit" value="자리배치 시작하기">
	</form>
</section>