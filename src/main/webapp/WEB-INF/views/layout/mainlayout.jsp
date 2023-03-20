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
<link href="resources/css/main.css" rel="stylesheet">

<!-- cookie -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript"></script>

<title>Learn Run</title>

</head>

<body>

<div align="center">
	<div style="width: 100%; height: auto; min-height: 100%; text-align: center;">
		<!-- header -->
		<div>
			<tiles:insertAttribute name="header" />
		</div>
	
		<!-- main -->
		<!-- slider -->
		<div>
			<tiles:insertAttribute name="slider" />
		</div>
		<!-- category -->
		<div>
			<tiles:insertAttribute name="category" />
		</div>
		<!-- content -->
		<div style="margin-top: 5rem;">
			<tiles:insertAttribute name="content" />
		</div>
		
		<!-- footer -->
		<div>
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</div>

</body>
</html>