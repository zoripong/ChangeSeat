<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//		System.out.println("hi");
	String name = (String)session.getAttribute("name");
	String filePath= application.getRealPath("./include/data/"+name+".txt");
	
	BufferedWriter bw;
	try{
		bw = new BufferedWriter(new FileWriter(filePath));
		bw.flush();
		bw.close();
	}catch(IOException e){
		
	}
%>

<jsp:forward page="index.jsp"></jsp:forward>
