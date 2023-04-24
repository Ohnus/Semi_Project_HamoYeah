<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="upload.js"></script> -->
<script type="text/javascript">
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
			document.getElementById('preview').src = "";
		}
	}
	// input된 파일은 readonly 속성이기 때문에 value를 임의로 건드릴 수 없음
	// 따라서 초기화하고자 할 경우 아래 코드
	function reset(img) {
		document.getElementById('del').onload = function(){
			document.getElementById('preview').src = "";
		}
		img.upload.select();
		document.selection.clear();
	    }
	function checkId() {
		const xhttp = new XMLHttpRequest();
		let param = "?memberId=" + f.memberId.value;
		xhttp.open("get", "${pageContext.request.contextPath}/member/idcheck.do" + param);
		xhttp.send();

		xhttp.onload = function() {
			let val = xhttp.responseText;
			let html = '<h5 style="color:';
			let obj = JSON.parse(val);
			if (obj.flag) { // obj.flag(key) = true or false
				html += 'blue">사용가능한 아이디입니다.</h5>';
			} else {
				html += 'red">사용 불가능한 아이디입니다.</h5>';
			}
			let res = document.getElementById("res");
			res.innerHTML = html;
		}
	}
	function checkPhone() {
		const xhttp = new XMLHttpRequest();
		let param = "?phone=" + f.phone.value;
		xhttp.open("get", "${pageContext.request.contextPath}/member/phonecheck.do" + param);
		xhttp.send();

		xhttp.onload = function() {
			let val = xhttp.responseText;
			let html = '<h5 style="color:';
			let obj = JSON.parse(val);
			if (obj.flag) { // obj.flag(key) = true or false
				html += 'blue">사용가능한 핸드폰번호입니다.</h5>';
			} else {
				html += 'red">이미 등록된 핸드폰번호입니다.</h5>';
			}
			let res2 = document.getElementById("res2");
			res2.innerHTML = html;
		}
	}
	function checkNickname() {
		const xhttp = new XMLHttpRequest();
		let param = "?nickname=" + f.nickname.value;
		xhttp.open("get", "${pageContext.request.contextPath}/member/nicknamecheck.do" + param);
		xhttp.send();

		xhttp.onload = function() {
			let val = xhttp.responseText;
			let html = '<h5 style="color:';
			let obj = JSON.parse(val);
			if (obj.flag) { // obj.flag(key) = true or false
				html += 'blue">사용가능한 닉네임입니다.</h5>';
			} else {
				html += 'red">이미 사용중인 닉네임입니다.</h5>';
			}
			let res3 = document.getElementById("res3");
			res3.innerHTML = html;
		}
	}
	
	function check() {
		let id = document.getElementById("H_id").value;
		let password = document.getElementById("H_pwd").value;
		let name = document.getElementById("H_name").value;
		let phone = document.getElementById("H_phone").value;
		let age = document.getElementById("H_age").value;
		let gender = document.getElementById("H_gender").value;
		let nickname = document.getElementById("H_nickname").value;
		let tnc = document.querySelector('input[name="tnc"]:checked').value;
		// querySelector: DOM 요소를 선택하는 데 사용, getElementBy는 HTMLCollection 또는 NodeList형태로 반환
		// querySelector는 NodeList형태로 반환, 선택자의 다양한 유형을 지원하므로 복잡한 선택 작업 가능함
		let str = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#$*]).{8,}$/; // 비밀번호 입력 가능한 문자 & 글자수 제한
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
	}
</script>
</head>
<body>
	<h3>회원가입 form</h3>
	<form action="" method="post" enctype="multipart/form-data" name="f">

		<table border="1">
			<tr>
				<td colspan="2">
				<input type="file" id="img" name="imagepath" accept="image/jpeg,image/jpg,image/png" onchange="thumbnail(this);">
				<img id="preview"><br/>
				<input type="button" value="삭제" id="del" onclick="reset(this.img);">
<!-- 				<input type="file" class="hidden_input" id="imageSelector" name="imagepath" accept="image/jpeg,image/jpg,image/png" multiple> -->
<!-- 				<img src="" class="thumb" style="width: 200px; height: 200px"> -->
<!-- 				<input type="button" value="삭제" class="dellink" onclick="void(0);"> -->
				</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="memberId" id="H_id"><input type="button" value="중복확인" onclick="checkId()">
				<span id="res"></span></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd" id="H_pwd"><br/>
				<h6 style="color: red">비밀번호는 영문 대소문자, 숫자, 특수문자(!, @, #, $, *)를 포함하고 8글자 이상이여야 합니다.</h6></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id="H_name"></td>
			</tr>
			<tr>
				<td>핸드폰번호</td>
				<td><input type="text" name="phone" ID="H_phone">
				<span id="res2"></span>
				<input type="button" value="중복확인" onclick="checkPhone()"></td>
			</tr>
			<tr>
				<td>연령대</td>
				<td>
				<select name="age" id="H_age">
					<option value="10대">10대</option>
					<option value="20대">20대</option>
					<option value="30대">30대</option>
					<option value="40대">40대</option>
					<option value="50대 이상">50대 이상</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" name="gender" value="m" id="H_gender">남성
					<input type="radio" name="gender" value="w" id="H_gender">여성
					<input type="radio" name="gender" value="n" id="H_gender">선택안함</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="nickname" id="H_nickname">
				<span id="res3"></span>
				<input type="button" value="중복확인" onclick="checkNickname()"></td>
			</tr>
			<tr>
				<td>관심사</td>
				<td>
				<input type="checkbox" name="tag" id="t" value="문화/예술">문화/예술 
				<input type="checkbox" name="tag" id="t" value="운동/액티비티">운동/액티비티 
				<input type="checkbox" name="tag" id="t" value="푸드/드링크">푸드/드링크 
				<input type="checkbox" name="tag" id="t" value="취미">취미 
				<input type="checkbox" name="tag" id="t" value="봉사활동">봉사활동 <br />
				<input type="checkbox" name="tag" id="t" value="반려동물">반려동물 
				<input type="checkbox" name="tag" id="t" value="자기계발">자기계발 
				<input type="checkbox" name="tag" id="t" value="대화">대화 
				<input type="checkbox" name="tag" id="t" value="창작">창작 
				<input type="checkbox" name="tag" id="t" value="멍때리기">멍때리기 
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
				</script>
				</td>
			</tr>
			<tr>
				<td>한줄 소개</td>
				<td><textarea cols="80" rows="10" name="intro"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><textarea cols="100" rows="15" readonly>이용약관</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<input type="radio" value="y" name="tnc">동의 
				<input type="radio" value="n" name="tnc">미동의 
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="가입" onclick="check()"></td>
			</tr>
		</table>
	</form>
</body>
</html>