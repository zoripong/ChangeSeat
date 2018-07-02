<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String contentPage = request.getParameter("CONTENTPAGE");
%>
<link rel="stylesheet" type="text/css" href="include/css/template.css">
<link rel="stylesheet" type="text/css" href="include/css/header.css">
<link rel="stylesheet" type="text/css" href="include/css/footer.css">
</head>
<body>
	<section id="sc_content">
		<jsp:include page="/include/html/header.jsp" flush="false" />
		<jsp:include page="<%=contentPage%>" flush="false" />
		<jsp:include page="/include/html/footer.jsp" flush="false" />
	</section>
</body>
</html>