<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- boorstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<title>Learn Run</title>

<style type="text/css">
*{
margin: 0;
padding: 0;
border: 0;
}
</style>

</head>
<body>

<div align="center">
<table style="width: 100%; height: 100%; text-align: center;">
	<!-- header -->
	<tr align="center" style="background-color: black; color: white;">
		<td style="height: 10%">
			<tiles:insertAttribute name="header" />
		</td>
	</tr>

	<!-- main -->
	<tr>
		<td style="height: 300px;">
			<tiles:insertAttribute name="slider" />
		</td>
	</tr>
	<tr>
		<td style="height: 70px;">
			<tiles:insertAttribute name="category" />
		</td>
	</tr>
	<tr>
		<td style="height: 400px; vertical-align: top;">
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