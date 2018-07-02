<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<link rel="stylesheet" type="text/css" href="include/css/input.css">
<script>
var isCheck = false;
window.onload=function(){
//	alert(document.getElementById("check_hole").value);
	document.getElementById("check_hole").onclick = function(){
		var number = document.getElementById("student_number").value;
		
		if(number == ""){
			alert("학생 수를 입력하세요.");
			return;
		}
		
		var inner = "결원 학생을 체크해주세요.<br>";
		for(var i = 1; i<=parseInt(number); i++){
			inner += "<span id='checkbox_wrapper'>"+i+"<input id='hole_checkbox' type='checkbox' name='hole_student' value='"+i+"' ></span>";
			if(i%5==0)
				inner+="<br>";
		}
		document.getElementById("student_checkboxes").innerHTML = inner;
		isCheck = true;
	}
	
	document.getElementById("btn_submit").onclick = function(){
		var e = document.getElementById("division");
		var v = e.options[e.selectedIndex].value;
		if(v == ""){
			alert("분단을 선택하세요.");
			return;
		}else if(isCheck == false){
			alert("결원 학생을 체크하세요.");
			return;
		}
		
		document.getElementById("add_form").submit();
	}
	document.getElementById("student_number").onchange = function(){
		isCheck = false;
	}
	
	
}	
</script>
<%
	String name = request.getParameter("name");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddkkmmss");

    Calendar c1 = Calendar.getInstance();

	String title = name+"_"+sdf.format(c1.getTime());
	session.setAttribute("name", name);
	session.setAttribute("title", title);
	
%>
<section id="sc_input_content">
	<form id="add_form" name="add_form" action="change.jsp" method="POST">
		<input id="form_input" type="text" name="title" value="<%= title %>" disabled><br/>
		<select id="division" name="division">
			<option value="" selected>---분단---</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
		</select>
		<br/>
		<p id="partner_label">짝꿍 유무</p>		
		<input id="partner_check" type="checkbox" name="partner" value="true">
		<br/>
		
		<input id="student_number" type="number" name="student_number" min="20" max="40">
		<input type="button" value="결원체크하기" id="check_hole">
		
		<br>
		<section id="student_checkboxes">
		</section>
		<input type="button" id="btn_submit" value="자리바꾸기">
	</form>
</section>