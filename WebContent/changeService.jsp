<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name = (String) session.getAttribute("name");
String title = (String) session.getAttribute("title");
ArrayList<Integer> list = (ArrayList<Integer>)session.getAttribute("changeSeat");
int studentNumber = (int)session.getAttribute("studnetNumber");
int holeNumber = (int)session.getAttribute("holeNumber");
int division = (int)session.getAttribute("division");
boolean partner = (boolean)session.getAttribute("partner");
ArrayList<String> partnerList = (ArrayList<String>)	session.getAttribute("partnerList");


out.println(title+"<br>");



String filePath= application.getRealPath("./include/data/"+title+".txt");
out.println(filePath);

BufferedWriter bw;
try{
	bw = new BufferedWriter(new FileWriter(filePath));
	
	
	bw.write(studentNumber+"\n");
	bw.write(holeNumber+"\n");
	bw.write(division+"\n");
	bw.write(partner+"\n");
	for(Integer li : list){
		bw.write(li+"\n");
	}

		
	bw.flush();
	bw.close();

	filePath = application.getRealPath("./include/data/"+name+".txt");
	bw = new BufferedWriter(new FileWriter(filePath, true));
	bw.write(name+"\t"+title+"\t1\n");
	System.out.println("ㅗㅗㅗ");
	for(String li : partnerList){
		System.out.println(li);
		bw.write(li+"\n");
	}
	
	
	bw.flush();
	bw.close();
	%>
	<jsp:forward page="index.jsp"></jsp:forward>
	<%
}catch(IOException e){
	e.printStackTrace();
}finally{

	session.removeAttribute("name");
	session.removeAttribute("title");
	session.removeAttribute("changeSeat");
	session.removeAttribute("studnetNumber");
	session.removeAttribute("holeNumber");
	session.removeAttribute("division");
	session.removeAttribute("partner");
	session.removeAttribute("partnerList");

}


%>