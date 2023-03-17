<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>


<style type="text/css">
</style>

</head>
<body>


<section class="vh-100" style="background-color: #F8EEE1;">
	<div class="container py-5 h-100">
		<div class="row d-flex justify-content-center align-items-center h-100">
			<div class="col col-xl-10">
				<div class="card" style="border-radius: 1rem;">
					<div class="row g-0">
						<div class="col-md-6 col-lg-5 d-none d-md-block">
							<!-- <img
								src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/img1.webp"
								alt="login form" class="img-fluid"
								style="border-radius: 1rem 0 0 1rem;" />  --> <!-- 이미지넣는곳 -->
							
						</div>
						
<div class="col-md-6 col-lg-7 d-flex align-items-center">
	<div class="card-body p-4 p-lg-5 text-black">
	
		<form action="loginAf" method="post">
			<!-- loginAf 컨트롤러로 보내줌 -->
	
			<div class="d-flex align-items-center mb-3 pb-1">
				<i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
				<span class="h1 fw-bold mb-0">Login</span>
			</div>
	
			<h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign
				into your account</h5>
	
	
			<!-- id input -->
			<div class="form-outline mb-4">
				<input type="text" id="id" name="id"
					class="form-control form-control-lg" placeholder="id" /> 
					<!-- <label class="form-label" for="form2Example17"></label> -->
			</div>
	
			<!-- password input -->
			<div class="form-outline mb-4">
				<input type="password" id="pwd" name="pwd"
					class="form-control form-control-lg" placeholder="password" />
				<!-- <label class="form-label" for="form2Example27"></label> -->
			</div>
	
			<!-- 로그인버튼 -->
			<div class="pt-1 mb-4">
				<button class="btn btn-dark btn-lg btn-block" type="submit">Login</button>
			</div>

			<!-- Checkbox -->
			<div class="form-check mb-0">
				<input class="form-check-input me-2" type="checkbox" value=""
					id="chk_save_id" /> <label class="form-check-label"
					for="form2Example3"> Remember me </label>
			</div>

			<a href="#" class="small text-muted" onclick="findId()">
			Forgot account?/</a> 
				
			<a href="#" id=findPassword class="small text-muted" onclick="findPassword()">
			Forgot password?</a>
			
			<p class="mb-5 pb-lg-2" style="color: #393f81;">
				Don't have an account? 
				<a href="#" onclick="account()" style="color: #393f81;">Register here</a>
			</p>

			<a href="#!" class="small text-muted">Terms of use.</a> 
			<a href="#!" class="small text-muted">Privacy policy</a>

			<div></div>
										
		</form>
		
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

	<script type="text/javascript">
		let user_id = $.cookie("user_id");

		function account() {

			location.href = "regi";
		}

		function findPassword() {
			location.href = "findPassword";
		}

		function findId() {
			location.href = "findId";
		}
		/*
		 cookie : id저장, pw저장 == String  	client
		 session : login한 정보 == Object		server
		 */

		if (user_id != null) { // 저장한 id가 있음
			$("#id").val(user_id);
			$("#chk_save_id").prop("checked", true);
		}

		$("#chk_save_id").click(function() {

			if ($("#chk_save_id").is(":checked") == true) {

				if ($("#id").val().trim() == "") {
					alert('id를 입력해 주십시오');
					$("#chk_save_id").prop("checked", false);
				} else {
					// cookie를 저장
					$.cookie("user_id", $("#id").val().trim(), {
						expires : 7,
						path : './'
					});
				}

			} else {
				$.removeCookie("user_id", {
					path : './'
				});
			}
		});
	</script>

</body>
</html>



