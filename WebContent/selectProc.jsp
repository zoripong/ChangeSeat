<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="include/css/select.css">
<section id="sc_select_content">

<%
	String school = request.getParameter("school");
	String grade = request.getParameter("grade");
	String group = request.getParameter("group");
	
	if(school.equals("admin")){
		out.println("<p id='sub_title'> 관리자페이지</p>");
		out.println("<form action='adminService.jsp' method='POST'>");
		String filePath= application.getRealPath("./include/data");
		File dir = new File(filePath); 
		File[] fileList = dir.listFiles(); 
		boolean havingFile = false;

		for(int i = 0 ; i < fileList.length ; i++){

			File file = fileList[i]; 
			if(file.isFile()){
				
				String sp[] = file.getName().split("_");
				if(sp.length >= 4){
					out.println("<input type='checkbox' name='deleteFile' value='"+file.getAbsolutePath()+"'><a href='beforeDetail.jsp?fileName="+file.getName()+"'>"+file.getName()+"</a><br>");					
				}else{
					out.println("<input type='checkbox' name='deleteFile' value='"+file.getAbsolutePath()+"'><a href='beforePartner.jsp?name="+file.getName()+"'>"+file.getName()+"</a><br>");
				}
				havingFile = true;

			}
		}
		if(havingFile == false){
			out.println("내역이 없습니다.");
		}else{
			out.println("<input class='submit_btn' type='submit' value='내역 삭제하기'>");
		}
		out.println("</form>");
	}else{
		%>
		
		<p id="sub_title"><%= school + "<br>" + grade + "학년    "+ group + "반"%></p>
		<form action="input.jsp" method="POST">
			<input type="hidden" name="name" value="<%= (school +"_"+ grade +"_"+ group) %>">
			<input class="submit_btn" type="submit" value="자리바꾸기">
		</form>
		<form action="beforeList.jsp" method="POST">
			<input type="hidden" name="name" value="<%= (school +"_"+ grade +"_"+ group) %>">
			<input class="submit_btn" type="submit" value="이전내역조회">
		</form>
		<form action="beforePartner.jsp" method="POST">
			<input type="hidden" name="name" value="<%= (school +"_"+ grade +"_"+ group) %>">
			<input class="submit_btn" type="submit" value="이전짝지조회">
		</form>
		
		<%
	}
	
%>


</section>
