<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
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
	
	<p id="sub_title"><%= title %></p>
	<%
	
	
		ArrayList<Integer> list = new ArrayList<Integer>();
		for(int i = 1; i<=studentNumber; i++){
			list.add(i);
		}
		
		System.out.println(list.size());
		
		
		//결원 지우기
		if(checkHole != null){
			ArrayList<Integer> holeList = new ArrayList<Integer>();
			
			
			for(String sHole : checkHole){
				int hole = Integer.parseInt(sHole);
				holeList.add(hole);
			}
			
		 	Collections.sort(holeList);
		 	Collections.reverse(holeList);
		 	

		 	for(int hole : holeList){
				System.out.println(hole-1);
				list.remove((hole-1));
		 	}
		}
		
		//이전 짝지 내역 가져오기
		String name = (String)session.getAttribute("name");
		String filePath= application.getRealPath("./include/data/"+name+".txt");
		beforePartner = new ArrayList<String>();
		BufferedReader br = null;
		
		try{
			
			br = new BufferedReader(new FileReader(filePath));
			
			while(true){
				String str = br.readLine();
				if(str == null)
					break;
				else{
					String[] sub = str.split("\t");
					if(sub.length < 3){
						beforePartner.add(str);					
					}
				}
			}
			br.close();	
		}catch(IOException e){
			System.out.println(e.toString());
		}
	
		//자리 배치 결과
		isDuplication =false;
		out.println(changeSeat(list, mod, division, height, partner));

		// 중복 되었었는지
		if(isDuplication){
			out.println("<script>alert('이전 내역과 중복이 되어 자리를 자동으로 재배치하였습니다.');</script>");
		}
		
		
		//정보 저장
		session.setAttribute("changeSeat", list);
		session.setAttribute("studnetNumber", studentNumber);
		session.setAttribute("holeNumber", holeNumber);
		session.setAttribute("division", division);
		session.setAttribute("partner", partner);
		session.setAttribute("partnerList", partnerList);
//		for(String li : partnerList){
//			System.out.println(li);
//		}
	%>	
	<%!
		ArrayList<String> partnerList = new ArrayList<String>();
		ArrayList<String> beforePartner;	
		boolean isDuplication = false;
		public String changeSeat(ArrayList<Integer> list, int mod,  int division, int height, boolean partner){
		partnerList = new ArrayList<String>();
		StringBuffer sb = new StringBuffer();
		Collections.shuffle(list);
		
		
		System.out.println("===함수시작====");
		for(Integer item : list){
			System.out.println(item);
		}		
		System.out.println("============");
		
		int index = 0;
		int tmpMod = mod;
		
		for(int i = 0; i<division; i++){
			sb.append("<table>");
			for(int j=0; j<height; j++){
				sb.append("<tr>");
				sb.append("<td>");
				int number = list.get(index++);
				sb.append(number);
				sb.append("</td>");
				if(partner){
					sb.append("<td>");
					int secNumber = list.get(index++);
					sb.append(secNumber);
					sb.append("</td>");
					
					if(beforePartner.contains(number+"\t"+secNumber)){
						System.out.println("머박적 실제로 일어났드아~!!");
						isDuplication = true;
						System.out.println("====요기다====");
						for(Integer item : list){
							System.out.println(item);
						}		
						System.out.println("============");
						return changeSeat(list, mod, division, height, partner);
					}else{
						partnerList.add(number+"\t"+secNumber);
					}
				}
				sb.append("</tr>");
			}

			if(mod > 0){
				int number = 0;
				sb.append("<tr>");
				sb.append("<td>");
				if(tmpMod <= 0){
					sb.append("X");
				}else{
					tmpMod--;
					number = list.get(index++);
					sb.append(number);
				}
				sb.append("</td>");
				if(partner){
					sb.append("<td>");
					if(tmpMod <= 0){
						sb.append("X");
					}else{
						tmpMod--;
						int secNumber = list.get(index++);
						sb.append(secNumber);
						if(beforePartner.contains(number+"\t"+secNumber)){
							System.out.println("머박적 실제로 일어났드아~!!");
							isDuplication = true;
							System.out.println("====요기다====");
							for(Integer item : list){
								System.out.println(item);
							}		
							System.out.println("============");
							
							return changeSeat(list, mod, division, height, partner);
						}else{
							partnerList.add(number+"\t"+secNumber);
						}

					}
					sb.append("</td>");
					
				}
				sb.append("</tr>");
			}
			sb.append("</table>");
		}
			return sb.toString();
		}
	%>
	<br>
	
	<a href="index.jsp"><button class="btn">홈으로</button></a>
	<form action="changeService.jsp" method="post">
		<input class="btn" type="submit" value="저장하기">
	</form>
</section>