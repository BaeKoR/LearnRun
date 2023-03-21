<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="<%=request.getContextPath()%>"/> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Learn Run</title>
	<%-- <link rel="stylesheet" href="${path}<tiles:getAsString name = 'css'/>"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/leslayout.css"> --%>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
	
</head>
<body>
	<table>
		<tr>
			<td colspan="2" id="navbar">
				<tiles:insertAttribute name="navbar" />
			</td>
		</tr>
		<tr>
			<td style="width: 900px; max-width: 900px;">
				<tiles:insertAttribute name="video" />
			</td>
			<td style="min-width: 300px; vertical-align: top; height: 100%; position: relative;">
				<tiles:insertAttribute name="sidebar" />
			</td>
		</tr>
	</table>
</body>
</html>