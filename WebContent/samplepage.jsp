<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@taglib prefix="custtags" tagdir="/WEB-INF/tags/customtags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Form</title>
</head>
<body>
<form action=<c:url value="gathervalues"></c:url>>
Page can be formatted based on user requirements. <br/>
<table width=400px border=1 bordercolor=blue>
	<custtags:depselect categoryNameInSession="STATES" categoryName="myCat" subcategoryName="mySubCat" defaultValue="select value" subsubcategoryName="muySubSubCat">
		<jsp:attribute name="categorySectionStart"><tr><td>Select State</td><td></jsp:attribute>
		<jsp:attribute name="categorySectionEnd"></td></tr></jsp:attribute>
		<jsp:attribute name="subcategorySectionStart"><tr><td colspan=2>some additional work</td></tr><tr><td>Select City</td><td></jsp:attribute>
		<jsp:attribute name="subcategorySectionEnd"></td></tr></jsp:attribute>
		<jsp:attribute name="subsubcategorySectionStart"><tr><td colspan=2>some more additional work</td></tr><tr><td>Select Area</td><td></jsp:attribute>
		<jsp:attribute name="subsubcategorySectionEnd"></td></tr></jsp:attribute>
	</custtags:depselect>
	<tr> <td colspan=2> <input type=submit value=Submit></input></td></tr>
</table>
</form>
</body>
</html>