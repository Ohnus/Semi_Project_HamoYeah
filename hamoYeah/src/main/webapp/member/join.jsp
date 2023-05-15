<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<title>HAMO YEAH</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Untree.co">
	<link rel="shortcut icon" href="favicon.png">

	<meta name="description" content="" />
	<meta name="keywords" content="bootstrap, bootstrap4" />

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&family=Source+Serif+Pro:wght@400;700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/owl.carousel.min.css">
	<link rel="stylesheet" href="../css/owl.theme.default.min.css">
	<link rel="stylesheet" href="../css/jquery.fancybox.min.css">
	<link rel="stylesheet" href="../fonts/icomoon/style.css">
	<link rel="stylesheet" href="../fonts/flaticon/font/flaticon.css">
	<link rel="stylesheet" href="../css/daterangepicker.css">
	<link rel="stylesheet" href="../css/aos.css">
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/join.css">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<style>
label {
	font-family: 'NanumSquareNeo', sans-serif;
}

body {
	font-family: 'NanumSquareNeoLight', sans-serif;
	font-size: 13px;
}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	// 한줄소개 글자수 카운트
	$('#message').keyup(function (e){
	    var content = $(this).val();
	    
	    $('#counter').html(content.length+"/50자");    //글자수 실시간 카운팅

	    if (content.length > 50){
	        $(this).val(content.substring(0, 50));
	        $('#counter').html("50/50자");
	    }
	});
	// 비밀번호, 비밀번호확인 일치 불일치 메세지 띄우기
	$('#H_pwdcheck').keyup(function(e){
		var pwd = $('#H_pwd').val();
		var pwdcheck = $(this).val();
		if(pwd == pwdcheck){
			$('#res4').css("color", "blue");
			$('#res4').html("비밀번호가 일치합니다.");
		} else {
			$('#res4').css("color", "red");
			$('#res4').html("비밀번호가 일치하지 않습니다.");
		}
	});
	// 비밀번호 정규표현식 충족, 불충족 메세지 띄우기
	$('#H_pwd').keyup(function(e){
		var str = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#$*]).{8,}$/;
		var pwd = $('#H_pwd').val();
		if(!str.test(pwd)){
			$('#str').css("color", "red");
			$('#str').html("영문 대소문자, 숫자, 특수문자(!, @, #, $, *)포함 8글자 이상: 불충족");
		} else {
			$('#str').css("color", "blue");
			$('#str').html("영문 대소문자, 숫자, 특수문자(!, @, #, $, *)포함 8글자 이상: 충족");
		}
	});
});
</script>
<script>
	// 파일 업로드 미리보기
	function thumbnail(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('preview').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			document.getElementById('preview').src = e.target.result;
		}
	}
	function imgReset() {
		document.getElementById('preview').src = "../img/imageadd.png";
		document.getElementById('img').value = null;
	    }
	function checkId() {
		if(f.memberId.value != ''){
			const xhttp = new XMLHttpRequest();
			let param = "?memberId=" + f.memberId.value;
			xhttp.open("get", "${pageContext.request.contextPath}/member/idcheck.do" + param);
			xhttp.send();
	
			xhttp.onload = function() {
				let val = xhttp.responseText;
				let html = '<h6 style="color:';
				let obj = JSON.parse(val);
				if (obj.flag) { // obj.flag(key) = true or false
					html += 'blue">사용 가능한 아이디</h6>';
				} else {
					html += 'red">사용 불가능한 아이디</h6>';
				}
				let res = document.getElementById("res");
				res.innerHTML = html;
			} 
		} else {
			alert("사용하실 ID를 입력해주세요.")
		}
	}
	function checkPhone() {
		let phone1 = f.phone1.value;
		let phone2 = f.phone2.value;
		let phone3 = f.phone3.value;
		let phone = phone1 + phone2 + phone3;
		if(phone2 != '' & phone3!= ''){
			const xhttp = new XMLHttpRequest();
			let param = "?phone=" + phone;
			xhttp.open("get", "${pageContext.request.contextPath}/member/phonecheck.do" + param);
			xhttp.send();

			xhttp.onload = function() {
				let val = xhttp.responseText;
				let html = '<h6 style="color:';
				let obj = JSON.parse(val);
				if (obj.flag) { // obj.flag(key) = true or false
					html += 'blue">사용가능한 핸드폰번호</h6>';
				} else {
					html += 'red">이미 등록된 핸드폰번호</h6>';
				}
				let res2 = document.getElementById("res2");
				res2.innerHTML = html;
			}
		} else {
			alert("사용하실 핸드폰번호를 입력해주세요.")
		}
	}
	function checkNickname() {
		if(f.nickname.value != ''){
			const xhttp = new XMLHttpRequest();
			let param = "?nickname=" + f.nickname.value;
			xhttp.open("get", "${pageContext.request.contextPath}/member/nicknamecheck.do" + param);
			xhttp.send();
	
			xhttp.onload = function() {
				let val = xhttp.responseText;
				let html = '<h6 style="color:';
				let obj = JSON.parse(val);
				if (obj.flag) { // obj.flag(key) = true or false
					html += 'blue">사용 가능한 닉네임</h6>';
				} else {
					html += 'red">이미 사용중인 닉네임</h6>';
				}
				let res3 = document.getElementById("res3");
				res3.innerHTML = html;
			}
		} else {
			alert("사용하실 닉네임을 입력해주세요.")
		}
	}
	
	function check() {
		const xhttp = new XMLHttpRequest();
		
		let phoneCheck1 = f.phone1.value;
		let phoneCheck2 = f.phone2.value;
		let phoneCheck3 = f.phone3.value;
		let phoneCheck = phoneCheck1 + phoneCheck2 + phoneCheck3;
		
		let param = "memberId=" + f.memberId.value;
		param += "&phone=" + phoneCheck;
		param += "&nickname=" + f.nickname.value;
		xhttp.open("POST", "${pageContext.request.contextPath}/member/joincheck.do");
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send(param);

		xhttp.onload = function() {
			let val = xhttp.responseText;
			let obj = JSON.parse(val);
			if (obj.flag == 1) {
				alert("중복된 아이디입니다.");
				event.preventDefault();
			} else if(obj.flag == 2) {
				alert("중복된 핸드폰번호입니다.");
				event.preventDefault();
			} else if(obj.flag == 3){
				alert("중복된 닉네임입니다.");
				event.preventDefault();
			} else if(obj.flag == 0) {
				let id = document.getElementById("H_id").value;
				let password = document.getElementById("H_pwd").value;
				let passwordcheck = document.getElementById("H_pwdcheck").value;
				let name = document.getElementById("H_name").value;
				let phone1 = document.getElementById("H_phone1").value;
				let phone2 = document.getElementById("H_phone2").value;
				let phone3 = document.getElementById("H_phone3").value;
				let phone = phone1 + phone2 + phone3;
				let age = document.getElementById("H_age").value;
				let gender = document.getElementById("H_gender").value;
				let nickname = document.getElementById("H_nickname").value;
				let tnc = document.querySelector('input[name="tnc"]:checked').value;
				// querySelector: DOM 요소를 선택하는 데 사용, getElementBy는 HTMLCollection 또는 NodeList형태로 반환
				// querySelector는 NodeList형태로 반환, 선택자의 다양한 유형을 지원하므로 복잡한 선택 작업 가능함
				let str = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#$*]).{8,}$/; // 비밀번호 입력 가능한 문자 & 글자수 제한
				if(password != passwordcheck) {
					alert("입력하신 비밀번호가 일치하지 않습니다. 다시 확인해 주세요.");
					event.preventDefault();
					return;
// 					let msg = '<h6 style="color:red">입력하신 비밀번호가 일치하지 않습니다. 다시 확인해 주세요.</h6>';
// 					let res4 = document.getElementById("res4");
// 					res4.style.color = "red";
// 					res4.innerHTML = msg;
				}
				if (id == '' || password == '' || name == '' || phone == '' || age == '' || gender == '' || nickname == '') {
					alert("관심사와 한줄 소개를 제외한 양식을 모두 입력해 주세요.")
					event.preventDefault();
					return;
				}
				if (!str.test(password)) {
					alert("비밀번호는 영문 대소문자, 숫자, 특수문자(!, @, #, $, *)를 포함하고 8글자 이상이여야 합니다.");
					event.preventDefault();
					return;
				}
				if (tnc == 'n') {
					alert("회원가입을 위해 이용약관에 동의해주세요.")
					event.preventDefault();
					return;
				}
				f.action = "${pageContext.request.contextPath }/member/join.do";
				f.submit();
			}
		}

	}
</script>

</head>
<body>
	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>
	
<!-- navbar -->
	<nav class="site-nav">
		    <div class="container">
		      <div class="site-navigation">
		        <a href="${pageContext.request.contextPath}/index.jsp" class="logo m-0">HAMO YEAH<span class="text-primary"></span></a>
			  </div>
			 </div>
		</nav>		
		
  <div class="hero hero-inner">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6 mx-auto text-center">
          <div class="intro-wrap">
            <h1 class="mb-0"></h1>
          </div>
        </div>
      </div>
    </div>
  </div>
  
 <!-- 작성폼 -->
 <form action="" method="post" enctype="multipart/form-data" name="f">
  <div class="untree_co-section">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 mb-5 mb-lg-0">
        
          <form class="contact-form" data-aos="fade-up" data-aos-delay="200">
            <div class="row">
              <div class="col-6">
              	<div class="form-group">
              		<label for="imagepath">
              		<img src="../img/imageadd.png" id="preview" style="width: 230px; height: 230px; border-radius: 50%;">
	                </label>
	                <input type="file" id="imagepath" name="imagepath" style="display:none" accept="image/*" onchange="thumbnail(this);" >
					<div id="" style="text-align:center; margin-top:15px; padding-right:80px"><input type="button" value="기본 이미지로 설정" id="del" class="H_btn_del" onclick="imgReset();"></div>
                </div>
              </div>
              
              <div class="col-6">

              	<div class="form-group">
                  <label class="text-black" for="H_id">아이디</label>
                  <input type="text" name="memberId" class="form-control" id="H_id">
                  <input type="button" value="중복확인" class="H_btn" onclick="checkId()">
                  <span id="res"></span>
                </div>

                <div class="form-group">
                  <label class="text-black" for="H_pwd">비밀번호</label>
                  <input type="password" name="pwd" class="form-control" id="H_pwd">
                  <span style="color: red" id="str">영문 대소문자, 숫자, 특수문자(!, @, #, $, *)포함 8글자 이상: 불충족</span>
                </div>
				
                <div class="form-group">
                  <label class="text-black" for="H_pwdcheck">비밀번호 확인</label>
                  <input type="password" name="pwdcheck" class="form-control" id="H_pwdcheck">
                  <span id="res4"></span>
                </div>
                
              </div>
            </div>
            
            <div class="form-group" style="width:255px; margin-left:285px">
                  <label class="text-black" for="H_name">이름</label>
                  <input type="text" name="name" class="form-control" id="H_name">
                  <span id="res"></span>
            </div>
            <div>
            
            </div>
            <div class="form-group">
                  <label class="text-black" for="H_phone1">핸드폰번호</label>
                  <select name="phone1" id="H_phone1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="017">017</option>
				</select>
				<input type="text" name="phone2" ID="H_phone2" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">
				<input type="text" name="phone3" ID="H_phone3" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">
				<input type="button" value="중복확인" class="H_btn" onclick="checkPhone()">
				<span id="res2"></span>
            </div>
          </form>
        </div>
        
        <div class="col-lg-5 ml-auto">
         <div class="form-group">
                <label class="text-black" for="H_nickname">닉네임</label>
                <input type="text" name="nickname" class="form-control" id="H_nickname">
				<input type="button" value="중복확인" class="H_btn" onclick="checkNickname()">
                <span id="res3"></span>
         </div>
         <div class="form-group">
			<label class="text-black" for="H_age">연령</label>
			<select name="age" id="H_age">
					<option value="10대">10대</option>
					<option value="20대">20대</option>
					<option value="30대">30대</option>
					<option value="40대">40대</option>
					<option value="50대 이상">50대 이상</option>
				</select>
			<label class="text-black" for="H_gender"></label>
				<input type="radio" name="gender" value="m" id="H_gender">남성
				<input type="radio" name="gender" value="w" id="H_gender">여성
				<input type="radio" name="gender" value="n" id="H_gender" checked>선택안함	
			</div>
         
 		<div class="form-group">
 		<label class="text-black" for="H_like">관심사</label><br/>
				<input type="checkbox" name="tag" id="t" value="문화/예술" class="tagtest">문화/예술 
				<input type="checkbox" name="tag" id="t" value="운동/액티비티" class="tagtest">운동/액티비티 
				<input type="checkbox" name="tag" id="t" value="푸드/드링크" class="tagtest">푸드/드링크 
				<input type="checkbox" name="tag" id="t" value="취미" class="tagtest">취미 <br />
				<input type="checkbox" name="tag" id="t" value="봉사활동" class="tagtest">봉사활동
				<input type="checkbox" name="tag" id="t" value="반려동물" class="tagtest">반려동물 
				<input type="checkbox" name="tag" id="t" value="성장/자기계발" class="tagtest">성장/자기계발 
				<input type="checkbox" name="tag" id="t" value="대화/친목" class="tagtest">대화/친목
				<script>
				const maxAllowed = 3;
				const checkboxes = document.querySelectorAll('input[type=checkbox]');
				checkboxes.forEach(function(checkbox) {
					checkbox.addEventListener('click', function() {
						const checkedCount = document.querySelectorAll('input[type=checkbox]:checked').length;
						if (checkedCount > maxAllowed) {
							checkbox.checked = false;
						}
					});
				});
				</script><br/>
	            <div class="form-group">
	              <label class="text-black" for="message">한줄소개</label>
	              <textarea class="form-control" id="message" name="intro" cols="30" rows="5" placeholder="한줄소개는 최대 50자까지 입력 가능합니다." style="resize:none" maxlength="100"></textarea>
	              <br/>
	              <span id="counter">0/50자</span>
	            </div>
	            
	            <form class="form-group">
	             <label class="text-black" for="tnc">이용약관</label>
	            <div class="form-group" style="text-align:center;">
				<iframe src="../tnc/tnc" width="500" height="250"></iframe>
				<input type="radio" value="y" name="tnc"> 동의 
				<input type="radio" value="n" name="tnc" checked> 미동의 
				</div>
				</form>
	
	            <form class="form-group"  style="text-align:center;">
	            <button type="button" class="btn btn-primary" onclick="check()">
	            Join</button>
				</form>
          </div>
        </div>
      </div>
    </div>
  </div>
</form>
	


  <div id="overlayer"></div>
  <div class="loader">
    <div class="spinner-border" role="status">
      <span class="sr-only">Loading...</span>
    </div>
  </div>

  <script src="../js/jquery-3.4.1.min.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/owl.carousel.min.js"></script>
  <script src="../js/jquery.animateNumber.min.js"></script>
  <script src="../js/jquery.waypoints.min.js"></script>
  <script src="../js/jquery.fancybox.min.js"></script>
  <script src="../js/aos.js"></script>
  <script src="../js/moment.min.js"></script>
  <script src="../js/daterangepicker.js"></script>

  <script src="../js/typed.js"></script>
  
  <script src="../js/custom.js"></script>

</body>
</html>