<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="upload.js"></script>
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
		document.getElementById('preview').src = "../img/nopic.jpg";
		document.getElementById('img').value = null;
//		input된 파일은 readonly 속성이기 때문에 value를 임의로 건드릴 수 없음
//		따라서 초기화하고자 할 경우 아래 코드
// 		img.upload.select();
// 		document.selection.clear();
   	 }
	function checkPhone() {
		const xhttp = new XMLHttpRequest();
		let phone1 = f.phone1.value;
		let phone2 = f.phone2.value;
		let phone3 = f.phone3.value;
		let phone = phone1 + phone2 + phone3;
		let param = "?phone=" + phone;
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
// 				let str = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#$*]).{8,}$/; // 비밀번호 입력 가능한 문자 & 글자수 제한
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
// 				if (!str.test(password)) {
// 				alert("비밀번호는 영문 대소문자, 숫자, 특수문자(!, @, #, $, *)를 포함하고 8글자 이상이여야 합니다.");
// 				event.preventDefault();
// 				return;
// 				}
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
<form action="" method="post" enctype="multipart/form-data" name="f">
	<table border="1">
		<tr>
			<td colspan="2">
				<input type="file" id="img" name="imagepath" accept="image/jpeg,image/jpg,image/png" onchange="thumbnail(this);">
				<!-- 경로 오류날 때 입력값 띄워서 확인해보기! -->
				<img src="${vo.imagepath }" id="preview" style="width: 200px; height: 200px"><br/>
				<input type="button" value="삭제" id="del" onclick="imgReset();">
			</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><span id="memberId">${sessionScope.loginId }</span></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
			<input type="hidden" value="${sessionScope.loginId }" name="memberId" id="H_memberId">
			<input type="password" name="pwd" id="H_pwd"><br />
			<!-- 비밀번호만 따로 수정하게 만들까? 핸들러 하나 추가해서 비밀번호만 업데이트 되도록? 고민고민 -->
			<!-- submit에 onclick 함수 부여하고 비밀번호 핸들러로 슝 -->
				<h6 style="color: red">비밀번호는 영문 대소문자, 숫자, 특수문자(!, @, #, $, *)를 포함하고 8글자 이상이여야 합니다.</h6></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" name="pwdcheck" id="H_pwdcheck"><br/>
			<span id="res4"></span>
<!-- 		<h6 style="color: red">비밀번호는 영문 대소문자, 숫자, 특수문자(!, @, #, $, *)를 포함하고 8글자 이상이여야 합니다.</h6> -->
			</td>
		</tr>
		<tr>
			<td>핸드폰번호</td>
			<td>
			<select name="phone1" id="H_phone1">
			
			</select>
<%-- 			<input type="text" value="${phone1 }" name="phone1" ID="H_phone1" pattern="\d*" maxlength="3" readonly> --%>
			<input type="text" value="${phone2 }" name="phone2" ID="H_phone2" pattern="\d*" maxlength="4">
			<input type="text" value="${phone3 }" name="phone3" ID="H_phone3" pattern="\d*" maxlength="4">
			<span id="res2"></span>
			<input type="button" value="중복확인" onclick="checkPhone()"></td>
		</tr>
		<tr>
			<td>연령대</td>
			<!-- option 한개에 ${vo.age}넣어서 처음에 보여주고, 버튼(funciton -->
			<td>
<%-- 			<input type="text" id="memberage" value="${vo.age }" readonly> --%>
			<span id="memberage">${vo.age }</span>
			<select name="age" id="H_age" style="display:none">
					<option value="10대">10대</option>
					<option value="20대">20대</option>
					<option value="30대">30대</option>
					<option value="40대">40대</option>
					<option value="50대 이상">50대 이상</option>
			</select>
			<input type="button" value="수정" id="btn" onclick="editage();">
			</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td><input type="text" name="nickname" id="H_nickname" value="${vo.nickname }">
			<span id="res3"></span>
			<input type="button" value="중복확인" onclick="checkNickname()"></td>
		</tr>
		<tr>
			<td>관심사</td>
			<td>
			<input type="checkbox" name="tag" id="t1" value="문화/예술" ${tag.contains("문화/예술") ? "checked" : ""}>문화/예술 
			<input type="checkbox" name="tag" id="t2" value="운동/액티비티" ${tag.contains("운동/액티비티") ? "checked" : ""}>운동/액티비티 
			<input type="checkbox" name="tag" id="t3" value="푸드/드링크" ${tag.contains("푸드/드링크") ? "checked" : ""}>푸드/드링크 
			<input type="checkbox" name="tag" id="t4" value="취미" ${tag.contains("취미") ? "checked" : ""}>취미 
			<input type="checkbox" name="tag" id="t5" value="봉사활동" ${tag.contains("봉사활동") ? "checked" : ""}>봉사활동 <br />
			<input type="checkbox" name="tag" id="t6" value="반려동물" ${tag.contains("반려동물") ? "checked" : ""}>반려동물 
			<input type="checkbox" name="tag" id="t7" value="자기계발" ${tag.contains("자기계발") ? "checked" : ""}>자기계발 
			<input type="checkbox" name="tag" id="t8" value="대화" ${tag.contains("대화") ? "checked" : ""}>대화 
			<input type="checkbox" name="tag" id="t9" value="창작" ${tag.contains("창작") ? "checked" : ""}>창작 
			<input type="checkbox" name="tag" id="t10" value="멍때리기" ${tag.contains("멍때리기") ? "checked" : ""}>멍때리기
<%-- 			<br/>${tag[0]} / ${tag[1]} / ${tag[2]} --%>
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
			<td><textarea cols="80" rows="10" name="intro">${vo.intro }</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
			<input type="button" value="수정" onclick="edit()">
			<input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/member/mypage.do?memberId=${sessionScope.loginId}'">
			<input type="button" value="탈퇴" onclick="delmember()">
			</td>
		</tr>
	</table>
</form>
</body>
</html>