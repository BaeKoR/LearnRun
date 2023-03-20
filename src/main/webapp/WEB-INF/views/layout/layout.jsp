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

<!-- cookie -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript"></script>

<title>Learn Run</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Rubik+Mono+One&family=Yaldevi:wght@600&display=swap');
body {
font-family: 'Yaldevi', sans-serif;
}
#menu {
vertical-align: top;
text-align: left;
width: 20%; 
min-width: 250px; 
padding: 50px 20px;
background-color: #F8EEE1;
}
#menu h2 {
margin-bottom: 20px;
padding-left: 16px;

font-family: 'Rubik Mono One', sans-serif;
font-style: normal;
font-weight: 400;
font-size: 25px;
line-height: 114%;
letter-spacing: -0.035em;

color: #2E2E2E;
}
#menu a {
padding: 10px 16px;
font-family: 'Yaldevi', sans-serif;
font-weight: 600;
font-size: 15px;
line-height: 20px;
}

#content {
vertical-align: top;
display: block;
min-height: 770px;
padding: 50px;
}

</style>
</head>

<body>

<div align="center">
<table style="width: 100%; height: 100%; text-align: center;">
	<!-- header -->
	<tr style="background-color: #F8EEE1;">
		<td colspan="2" style="height: 10%">
			<tiles:insertAttribute name="header" />
		</td>
	</tr>
	
	<!-- main -->
	<tr>
		<td id="menu">
			<tiles:insertAttribute name="menu" />
		</td>
		<td id="content">
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
