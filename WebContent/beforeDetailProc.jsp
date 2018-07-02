<%@page import="java.util.ArrayList"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="include/css/beforeDetail.css">
<section id="sc_detail_content">
<%

	String fileName = request.getParameter("fileName");
	//out.println(fileName);

	String filePath= application.getRealPath("./include/data/"+fileName);
	int studentNumber = -1;
	int holeNumber = -1;
	int division = -1;
	boolean partner = false;
	// read file
	BufferedReader br = null;
	ArrayList<Integer> list = new ArrayList<Integer>();
	
	try{
		
		br = new BufferedReader(new FileReader(filePath));
		studentNumber = Integer.parseInt(br.readLine());
		holeNumber = Integer.parseInt(br.readLine());
		division = Integer.parseInt(br.readLine());
		partner = Boolean.parseBoolean(br.readLine());
		
		while(true){
			String str = br.readLine();
			if(str == null)
				break;
			else{
				list.add(Integer.parseInt(str));
			}
		}
		br.close();	
	}catch(IOException e){
		System.out.println(e.toString());
	}
		
	int width = division;
	if(partner){
		width *=2;
	}
	int height = (studentNumber-holeNumber) / width;
	int mod = (studentNumber-holeNumber) % width;
	
	int index = 0;
	int tmpMod = mod;
	for(int i = 0; i<division; i++){
		out.println("<table>");
		for(int j=0; j<height; j++){
			out.println("<tr>");
			out.println("<td>");
			out.println(list.get(index++));
			out.println("</td>");
			if(partner){
				out.println("<td>");
				out.println(list.get(index++));
				out.println("</td>");
			}
			out.println("</tr>");
		}

		if(mod > 0){
				out.println("<tr>");
			out.println("<td>");
			if(tmpMod <= 0){
				out.println("X");
			}else{
				tmpMod--;
				out.println(list.get(index++));
			}
			out.println("</td>");
			if(partner){
				out.println("<td>");
				if(tmpMod <= 0){
					out.println("X");
				}else{
					tmpMod--;
					out.println(list.get(index++));
				}
				out.println("</td>");
				
			}
			out.println("</tr>");
		}
		out.println("</table>");
	}

	
%>
<br>
<a href="index.jsp"><button id="btn">처음으로</button></a>

</section>
