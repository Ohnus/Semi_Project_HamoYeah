<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function del(){
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
</script>
</head>
<body>
<table border="1">
<tr><td>닉네임</td><td><input type="text" value="${vo.nickname }" readonly></td></tr>
<tr><td>이미지</td><td><img src="${vo.imagepath }" style="width:200px;height:200px"></td></tr>
<tr><td>핸드폰</td><td><input type="text" value="${vo.phone }" readonly></td></tr>
<tr><td>연령대</td><td><input type="text" value="${vo.age }" readonly></td></tr>
<tr>
<td>관심사</td>
<td><input type="text" value="${vo.tag1 }" readonly><input type="text" value="${vo.tag2 }" readonly><input type="text" value="${vo.tag3 }" readonly></td>
</tr>
<tr><td>한줄 소개</td><td><textarea cols="100" rows="5" readonly>${vo.intro }</textarea></td></tr>
<tr><td colspan="2" align="right">
<input type="button" value="수정" onclick="location.href='${pageContext.request.contextPath}/member/edit.do?memberId=${sessionScope.loginId }'">
<input type="button" value="탈퇴" onclick="del();">
</td></tr>
</table>
</body>
</html>