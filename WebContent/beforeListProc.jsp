<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="include/css/beforeList.css">
<section id="sc_list_content">
<%
	request.setCharacterEncoding("UTF-8");
	String name = (String)session.getAttribute("name");
	System.out.println(name+"??");

	String filePath= application.getRealPath("./include/data");
	File dir = new File(filePath); 
	File[] fileList = dir.listFiles(); 
	boolean havingFile = false;

	for(int i = 0 ; i < fileList.length ; i++){

		File file = fileList[i]; 

		if(file.isFile() && file.getName().contains(name) && !(file.getName().equals(name+".txt"))){
			out.println("<a href='beforeDetail.jsp?fileName="+file.getName()+"'>"+file.getName()+"</a><br>");
			havingFile = true;

		}
	}

	
	if(havingFile == false){
		out.println("이력이 없습니다.");
	}
	
%>
<br>
<a href="index.jsp"><button id="btn">처음으로</button></a>
</section>