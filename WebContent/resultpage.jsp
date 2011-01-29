<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@taglib prefix="custtags" tagdir="/WEB-INF/tags/customtags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Result Page</title>
</head>
<body>
<c:forEach var='parameter' items='${paramValues}'>  
	<c:out value='${parameter.key}'/> = 
	<c:forEach var='value' items='${parameter.value}'>
		<c:out value='${value}' escapeXml="false"/><br> 
	</c:forEach>         
</c:forEach>
</body>
</html>