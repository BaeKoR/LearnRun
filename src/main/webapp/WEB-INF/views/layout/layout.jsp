<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- boorstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 
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
#menu {
float: left;
vertical-align: top;
text-align: left;
width: 20%;
height: 770px;
padding: 80px 20px 80px 0;
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
font-weight: 600;
font-size: 15px;
line-height: 20px;
}
#content {
vertical-align: top;
display: block;
min-height: 770px;
padding: 80px 50px;
}

</style>
</head>

<body>

<div align="center">
<div style="width: 100%; height: auto; min-height: 100%; text-align: center;">
	<!-- header -->
	<div>
		<tiles:insertAttribute name="header" />
	</div>
	
	<!-- content -->
	<div style="width: 1200px; display: inline-block;">
		<div id="menu">
			<tiles:insertAttribute name="menu" />
		</div>
		<div id="content">
			<tiles:insertAttribute name="content" />
		</div>
	</div>
	
	<!-- footer -->
	<div>
		<tiles:insertAttribute name="footer" />
	</div>
</div>
</div>

</body>
</html>
