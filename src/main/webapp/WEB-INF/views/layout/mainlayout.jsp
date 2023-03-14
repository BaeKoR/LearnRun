<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Learn Run</title>
</head>
<body style="background-color: rgb(100, 204, 204);">

<div align="center">
<table style="width: 1200px; height: 600px;">
<!-- header -->
<tr align="center" style="background-color: black; color: white;">
	<td style="height: 10%">
		<tiles:insertAttribute name="header" />
	</td>
</tr>

<!-- main -->
<tr>
	<td style="height: 500px">
		<tiles:insertAttribute name="content" />
	</td>
</tr>

<!-- footer -->
<tr align="center" style="background-color: black; color: white;">
	<td style="height: 10%">
		<tiles:insertAttribute name="footer" />
	</td>
</tr>
</table>
</div>

</body>
</html>