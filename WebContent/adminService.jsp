<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	String [] fileName = request.getParameterValues("deleteFile");
	boolean isFailed = false;
	for(String item : fileName){
		
		File file = new File(item);
        
        if( file.exists() ){
            if(file.delete()){
                System.out.println(item+"파일삭제 성공");
                }else{
                System.out.println(item+"파일삭제 실패");
                isFailed = true;
            }
        }else{
            System.out.println("파일이 존재하지 않습니다.");
        }

   	}

	if(isFailed){
		%>
		<script>
			alert("파일 삭제 실패!");
		</script>
	<%
	}else{
		%>
		<script>
			alert("파일 삭제 성공!");
		</script>
	<%
	
	}

%>

<jsp:forward page="index.jsp"></jsp:forward>
	