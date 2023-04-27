<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
h2, h4, h5 {
	 text-align: center;
}
.header {
	display: flex;
}
div.head1 {
	flex: 1;
}
div.head2 {
	flex: 1;
}

.content{
	display: flex;
}
div.con1{
	flex: 1;
}
div.con2{
	flex: 1;
}
#ok {
	float: left;
}

</style>


<body>
	<h2>${title }</h2>
<div class="header">
<div class="head1">
	<h4>승인</h4>
	<h5>${now} / ${max}</h5>
</div>
<div class="head2">
	<h4>미승인</h4>
	<h5><span id="cnt">0</span> / ${rest}</h5>
	<input type="button" id="ok" value="승인하기" onclick="ok(${boardNum})">
</div>
</div>
<script>
	// 승인하기 버튼 누름 
function ok(num){
	const checkedCount = document.querySelectorAll('input[type=checkbox]:checked').length;
	if (checkedCount == 0) {
		alert('승인할 사람을 선택해주세요.');
	} else {
		let result = confirm('승인 후에는 되돌릴 수 없습니다. 승인하시겠습니까?');
		if(result){
			let param = "?boardNum=" + num;
			alert('갑니다~');
			f.action = "${pageContext.request.contextPath}/member/okList.do" + param;
			f.submit();
		}
	}
}
</script>

<div class="content">
<div class="con1">
	<!-- 승인한 사람 리스트 -->
	<!-- 여기에 (3/5) 이렇게 보여주고 싶음. -->
	<c:forEach var="vo" items="${list1}">
		<table>
			<tr>
				<td rowspan="2"><img src="${vo.imagepath}"
					style="width: 100px; height: 100px;"></td>
				<td>${vo.nickname}</td>
			</tr>
			<tr>
				<td>${vo.intro}</td>
			</tr>
		</table>
	</c:forEach>
</div>
<div class="con2">
	<!-- 미승인 사람 리스트 -->
	<form action="" method="post" name="f">
	<c:forEach var="vo" items="${list0}">
		<table>
			<tr>
			<td rowspan="2"><input type="checkbox" name="check" value="${vo.memberId}"></td>
				<td rowspan="2"><img src="${vo.imagepath}"
					style="width: 100px; height: 100px;"></td>
				<td>${vo.nickname}</td>
			</tr>
			<tr>
				<td>${vo.intro}</td>
			</tr>
		</table>
	</c:forEach>
			<script>
			// 체크된 수가 잔여 수와 같으면 더 선택 안되게...
			let rest = ${rest};
			const checkboxes = document.querySelectorAll('input[type=checkbox]');
			checkboxes.forEach(function(checkbox) {
				checkbox.addEventListener('click', function() {
					const checkedCount = document.querySelectorAll('input[type=checkbox]:checked').length;
					if (checkedCount > rest) {
						checkbox.checked = false;
					} else {
						document.getElementById("cnt").innerHTML = checkedCount;
					}
				});
			});
			</script>
	</form>
</div>
</div>

</body>
</html>