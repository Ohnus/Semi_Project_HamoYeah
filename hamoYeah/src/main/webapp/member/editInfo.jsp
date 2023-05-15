<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
}

 .list-container { 
 	display: grid; 
  	grid-template-columns: repeat(2, 1fr);
   	grid-gap: 1rem; 
 	justify-content: center; 
 	align-items: center; 
 	font-family: "NanumSquareNeoLight"; 
 	margin: 0 auto; 
 	font-family: 'NanumSquareNeoLight', sans-serif; 
}
</style>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#intro').keyup(function (e){
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
<script  type="text/javascript">
// 파일 업로드 미리보기
	function thumbnail(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('preview').style = "width: 200px; height: 200px";
				document.getElementById('preview').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			document.getElementById('preview').src = e.target.result;
			// 이미지 업로드 하다가 취소 눌렀을 때 직전에 업로드한 이미지 유지하도록 수정
		}
	}
	function imgReset() {
		document.getElementById('preview').src = "../img/imageadd.png";
		document.getElementById('img').value = null;
//		input된 파일은 readonly 속성이기 때문에 value를 임의로 건드릴 수 없음
//		따라서 초기화하고자 할 경우 아래 코드
// 		img.upload.select();
// 		document.selection.clear();
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
					html += 'blue">사용가능한 핸드폰번호입니다.</h6>';
				} else {
					html += 'red">이미 등록된 핸드폰번호입니다.</h6>';
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
					html += 'blue">사용가능한 닉네임입니다.</h6>';
				} else {
					html += 'red">이미 사용중인 닉네임입니다.</h6>';
				}
				let res3 = document.getElementById("res3");
				res3.innerHTML = html;
			}
		} else {
			alert("사용하실 닉네임을 입력해주세요.")
		}
	}
	function editage(){
		memberage.style.display = "none";
		H_age.style.display = "";
		btn.style.display = "none";
	}
	function edit() {
		const xhttp = new XMLHttpRequest();

		let phoneCheck1 = f.phone1.value;
		let phoneCheck2 = f.phone2.value;
		let phoneCheck3 = f.phone3.value;
		let phoneCheck = phoneCheck1 + phoneCheck2 + phoneCheck3;
	
		let param = "?memberId=" + f.memberId.value;
		param += "&phone=" + phoneCheck;
		param += "&nickname=" + f.nickname.value;
		xhttp.open("get", "${pageContext.request.contextPath}/member/editcheck.do" + param);
		xhttp.send(param);

		xhttp.onload = function() {
			let val = xhttp.responseText;
			let obj = JSON.parse(val);
			if(obj.flag == 1) {
				alert("중복된 핸드폰번호입니다.");
				event.preventDefault();
			} else if(obj.flag == 2){
				alert("중복된 닉네임입니다.");
				event.preventDefault();
			} else if(obj.flag == 0) {
				let password = document.getElementById("H_pwd").value;
				let passwordcheck = document.getElementById("H_pwdcheck").value;
				let phone1 = document.getElementById("H_phone1").value;
				let phone2 = document.getElementById("H_phone2").value;
				let phone3 = document.getElementById("H_phone3").value;
				let phone = phone1 + phone2 + phone3;
				let age = document.getElementById("H_age").value;
				let nickname = document.getElementById("H_nickname").value;
				let str = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#$*]).{8,}$/; // 비밀번호 입력 가능한 문자 & 글자수 제한
				if(password != passwordcheck) {
					alert("입력하신 비밀번호가 일치하지 않습니다. 다시 확인해 주세요.");
					event.preventDefault();
					return;
				}
				if (phone == '' || age == '' || nickname == '') {
					alert("관심사와 한줄 소개를 제외한 양식을 모두 입력해 주세요.")
					event.preventDefault();
					return;
				}
				if (!str.test(password)) {
				alert("비밀번호는 영문 대소문자, 숫자, 특수문자(!, @, #, $, *)를 포함하고 8글자 이상이여야 합니다.");
				event.preventDefault();
				return;
				}
				f.action = "${pageContext.request.contextPath}/member/edit.do?memberId=${sessionScope.loginId }";
				f.submit();
			}
		}
	}
	function delmember(){
		let check = confirm("정말 탈퇴하시겠습니까?");
		if(check == true){
			let out = prompt("탈퇴를 진행하시려면 '탈퇴'를 입력하세요.");
			if(out == "탈퇴"){
				location.href="${pageContext.request.contextPath}/member/delete.do?memberId=${sessionScope.loginId }";
				return;
			}
		} else {
			event.preventDefault();
			return;
		}
	}
	window.onload = function(){
		let a = document.getElementById("H_phone1");
		let html = "";
		let arr = ['010', '011', '017'];
		for(i=0; i<arr.length; i++){
			if('${phone1}'==arr[i]){
				html += "<option value=" + arr[i] + " selected>"+ arr[i]+"</option>";
			}else{
				html += "<option value=" + arr[i] + ">"+ arr[i]+"</option>";
			}
			
		}
		a.innerHTML = html;
	}
</script>
</head>
<body>
<div id="" style="margin-top:5%"></div>
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
				<img src="${vo.imagepath }" id="preview" style="width: 230px; height: 230px; border-radius: 50%;"><br/>
				</label>
				<input type="file" id="imagepath" name="imagepath" style="display:none" accept="image/jpeg,image/jpg,image/png" onchange="thumbnail(this);">
				<!-- 경로 오류날 때 입력값 띄워서 확인해보기! -->
				<div id="" style="text-align:center; margin-top:15px; padding-right:80px"><input type="button" value="기본 이미지로 설정" id="del" class="H_btn_del" onclick="imgReset();"></div>
						</div>
					</div>
					<div class="col-6">
					<div class="form-group">
					<label class="text-black" for="H_id">아이디</label>
			<span class="form-control" id="memberId">${sessionScope.loginId }</span>
					</div>
			 		<div class="form-group">
                  	<label class="text-black" for="H_pwd">비밀번호</label>
					<input type="hidden" value="${sessionScope.loginId }" name="memberId" id="H_memberId">
					<input type="password" value=${vo.pwd } name="pwd" class="form-control" id="H_pwd">
					<span style="color: blue" id="str">영문 대소문자, 숫자, 특수문자(!, @, #, $, *)포함 8글자 이상: 충족</span>
					</div>
					<div class="form-group">
                  	<label class="text-black" for="H_pwdcheck">비밀번호 확인</label>
					<input type="password" value=${vo.pwd } name="pwdcheck" class="form-control" id="H_pwdcheck">
					<span id="res4"></span>
					</div>
				</div>
			</div>
			
			<div class="form-group" >
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label class="text-black" for="H_phone1">핸드폰번호</label>&nbsp;&nbsp;&nbsp;&nbsp;
			<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select name="phone1" id="H_phone1" style="width: 65px; height: 26px">
			</select>&nbsp;&nbsp;
			<input type="text" value="${phone2 }" name="phone2" ID="H_phone2" style="width: 150px; height: 26px; text-algin:center;" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">&nbsp;&nbsp;
			<input type="text" value="${phone3 }" name="phone3" ID="H_phone3" style="width: 150px; height: 26px; text-algin:center;" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">
			<input type="button" value="중복확인" class="H_btn_del" onclick="checkPhone()">
			<span style="text-align:right" id="res2"></span>
			</div></div>
			</form>
			</div>
			
			<div class="col-lg-5 ml-auto">
         	<div class="form-group">
			<label class="text-black" for="H_nickname">닉네임</label>
			<input type="text" name="nickname" class="form-control" id="H_nickname" value="${vo.nickname }">
			<input type="button" value="중복확인" class="H_btn" onclick="checkNickname()">
			<span id="res3"></span>
			</div>
			
			<div class="form-group">
			<label class="text-black" for="H_age">연령</label>
			<span id="memberage">${vo.age }</span>
			<select name="age" id="H_age" style="display:none">
					<option value="10대">10대</option>
					<option value="20대">20대</option>
					<option value="30대">30대</option>
					<option value="40대">40대</option>
					<option value="50대 이상">50대 이상</option>
			</select>
			<input type="button" value="수정" id="btn" class="H_btn" onclick="editage();">
			</div>
			
			<div class="form-group">
 			<label class="text-black" for="H_like">관심사</label><br/>
			<input type="checkbox" name="tag" id="t1" value="문화/예술" ${tag.contains("문화/예술") ? "checked" : ""}>문화/예술 
			<input type="checkbox" name="tag" id="t2" value="운동/액티비티" ${tag.contains("운동/액티비티") ? "checked" : ""}>운동/액티비티 
			<input type="checkbox" name="tag" id="t3" value="푸드/드링크" ${tag.contains("푸드/드링크") ? "checked" : ""}>푸드/드링크 
			<input type="checkbox" name="tag" id="t4" value="취미" ${tag.contains("취미") ? "checked" : ""}>취미<br />
			<input type="checkbox" name="tag" id="t5" value="봉사활동" ${tag.contains("봉사활동") ? "checked" : ""}>봉사활동
			<input type="checkbox" name="tag" id="t6" value="반려동물" ${tag.contains("반려동물") ? "checked" : ""}>반려동물 
			<input type="checkbox" name="tag" id="t7" value="자기계발" ${tag.contains("성장/자기계발") ? "checked" : ""}>성장/자기계발 
			<input type="checkbox" name="tag" id="t8" value="대화" ${tag.contains("대화/친목") ? "checked" : ""}>대화 
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
			<div class="form-group"><br/>
	        <label class="text-black" for="message">한줄소개</label>
			<textarea id="intro" class="form-control" cols="80" rows="7" name="intro" placeholder="한줄소개는 최대 50자까지 입력 가능합니다." style="resize:none" maxlength="100">${vo.intro }</textarea>
			<br/>
			<span id="counter">0/50자</span>
			</div>
			<input type="button" value="탈퇴" class="H_btn" onclick="delmember()">
			<input type="button" value="취소" class="H_btn" onclick="location.href='${pageContext.request.contextPath}/member/mypage.do?memberId=${sessionScope.loginId}'">
			<input type="button" value="수정" class="H_btn" onclick="edit()">
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