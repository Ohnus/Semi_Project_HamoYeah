<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload = function() {
		ff.img.src = opener.document.f.img.src;
		ff.nickname.value = opener.document.f.nickname.value;
		ff.intro.value = opener.document.f.intro.value;
		ff.gender.value = opener.document.f.gender.value;
		ff.age.value = opener.document.f.age.value;
		ff.gender.value = opener.document.f.gender.value;
		ff.tag1.value = opener.document.f.tag1.value;
		ff.tag2.value = opener.document.f.tag2.value;
		ff.tag3.value = opener.document.f.tag3.value;
	}
</script>
</head>
<body>
<h3>땡땡님 정보</h3>
<form action="" method="post" name="ff">
<table border="1">
<tr><td rowspan="2"><img src="" name="img"></td><td><input type="text" name="nickname"></td></tr>
<tr><td><input type="text" name="intro"></td></tr>
<tr><td>성별</td><td><input type="text" name="gender"></td></tr>
<tr><td>연령대</td><td><input type="text" name="age"></td></tr>
<tr><td>태그</td>
<td>
<input type="text" name="tag1">
<input type="text" name="tag2">
<input type="text" name="tag3">
</td></tr>
</table>
</form>
</body>
</html>