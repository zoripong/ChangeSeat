<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String filePath= application.getRealPath("./include/data/"+name+".txt");
	session.setAttribute("name", name);
	BufferedReader br = null;
	
	try{
		
		br = new BufferedReader(new FileReader(filePath));
		
		while(true){
			String str = br.readLine();
			if(str == null)
				break;
			else{
				String[] sub = str.split("\t");
				if(sub.length >= 3){
					out.println("<h4>"+sub[1].substring(sub[0].length()+1)+" 자리 배치 결과</h4>");
				}else{
					out.println(sub[0]+"♡"+sub[1]+"<br>");
				}
			}
		}
		br.close();	
	}catch(IOException e){
		System.out.println(e.toString());
	}
	
%>

<a href="beforePartnerService.jsp"><button onclick="reset_before()">초기화</button></a>