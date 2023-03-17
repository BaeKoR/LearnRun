<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- boorstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- css -->
<link href="resources/css/layout.css" rel="stylesheet">
<link href="resources/css/category.css" rel="stylesheet">

<title>Learn Run</title>

</head>

<body>

<div align="center">
<table  style="width: 100%; height: 100%; text-align: center;">
	<!-- header -->
	<tr style="background-color: #F8EEE1;">
		<td colspan="2" style="height: 10%">
			<tiles:insertAttribute name="header" />
		</td>
	</tr>
	
	<!-- main -->
	<tr>
		<td align="left" valign="top" style="background-color: rgb(204, 204, 204); width: 20%">
			<tiles:insertAttribute name="menu" />
		</td>
		<td style="height: 770px">
			<tiles:insertAttribute name="content" />
		</td>
	</tr>
	
	<!-- footer -->
	<tr align="center" style="background-color: black; color: white;">
		<td colspan="2" style="height: 10%">
			<tiles:insertAttribute name="footer" />
		</td>
	</tr>
</table>
</div>

</body>
</html>
