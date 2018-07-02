<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="include/css/change.css">
 
<%
	request.setCharacterEncoding("UTF-8");
	
	String title = (String)session.getAttribute("title");
	
	int division = Integer.parseInt(request.getParameter("division"));
	boolean partner = false;
	
	if(request.getParameterValues("partner") != null){
		partner = true;
	}
	
	int studentNumber = Integer.parseInt(request.getParameter("student_number"));
	String [] checkHole = request.getParameterValues("hole_student");
	int holeNumber = 0;
	if(checkHole != null){
		holeNumber = checkHole.length;
	}
	

	/*
	out.println(title+"<br>");
	out.println(division+"<br>");
	out.println(partner+"<br>");
	out.println(studentNumber+"<br>");
	*/
	
	/*
	if(checkHole != null){
		for(int i = 0 ; i<checkHole.length; i++){ 
			out.println(checkHole[i]+"<br>");
		}
	}
	*/
	
	int width = division;
	if(partner){
		width *= 2;
	}
	
	int height = (studentNumber-holeNumber) / width ;
	int mod = (studentNumber-holeNumber) % width;
//	out.println("studentNumber-holeNumber : "+(studentNumber-holeNumber)+"width : "+width+" / height : "+height+"/ mod : "+mod+" <br>");

%>

<section id="sc_seat">
	
	<%
	
	
		ArrayList<Integer> list = new ArrayList<Integer>();
		for(int i = 1; i<=studentNumber; i++){
			list.add(i);
		}
		
		//결원 지우기
		if(checkHole != null){
			for(String sHole : checkHole){
				int hole = Integer.parseInt(sHole);
				list.remove((hole-1));
			}
		}
		
		Collections.shuffle(list);
		
		session.setAttribute("changeSeat", list);
		session.setAttribute("studnetNumber", studentNumber);
		session.setAttribute("holeNumber", holeNumber);
		session.setAttribute("division", division);
		session.setAttribute("partner", partner);
		
		/*
		for(Integer i : list){
			out.println(i+"<br>");
		}
		out.println("<br>");
		*/
		
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
	<p id="sub_title"><%= title %></p>
	
	<a href="index.jsp"><button class="btn">홈으로</button></a>
	<form action="changeService.jsp" method="post">
		<input class="btn" type="submit" value="저장하기">
	</form>
</section>