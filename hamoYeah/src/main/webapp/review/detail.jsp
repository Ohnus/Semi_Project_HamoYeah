<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function likes(num){
   const xhttp = new XMLHttpRequest();
      
      xhttp.onload = function(){
         let val = xhttp.responseText;
         let arr = JSON.parse(val);
         let html = '';
         html = arr.cnt;
         let res = document.getElementById("likenum");
         res.innerHTML = html;//responseText: 서버로부터 받은 응답값
      }
      
      let param = "?reviewNum=" + num;
      param += "&writer=${sessionScope.loginId}";
      
      //요청 전송방식, 서버페이지 url 설정. get방식인 경우 url뒤에 파람 붙임
      xhttp.open("GET", "${pageContext.request.contextPath}/review/likes.do"+param);
      xhttp.send();
}

function delreview(){
	let check = confirm("리뷰를 삭제하시겠습니까?");
	if(check == true){
		location.href = '${pageContext.request.contextPath }/review/del.do?reviewNum=${vo.reviewNum}';
	} else {
		event.preventDefault();
		return;
	}
}
</script>

</head>
<body>
	<form
		action="${pageContext.request.contextPath }/review/edit.do?num=${vo.reviewNum}"
		method="post">
		<table border="1">
			<tr><td colspan="3" align="center"><img src="${mvo.imagepath }" width="100px" height="100px"><br/>작성자: ${mvo.memberId }</td></tr>
			<tr>
				<td colspan="3" align="center"><img src="${vo.imagepath }" width="200px" height="200px"></td>
			</tr>
			<tr>
				<td colspan="3" align="center">내용<br />
				<textarea rows="4" name="content" cols="50" readonly>${vo.content }</textarea></td>
			</tr>
			<tr><td rowspan="2"><img src="${bvo.imagepath }" width="100px" height="100px"></td>
			<td><a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${bvo.boardNum}&memberId=${bvo.memberId}">원글제목: ${bvo.title }</a></td>
			<td>${bvo.tag }</td></tr>
			<tr><td colspan="2">${bvo.content }</td></tr>
			<tr>
				<td colspan="3"><input type="button" value="좋아요" onclick="likes(${vo.reviewNum})"><span id="likenum">${cnt }</span></td>
			</tr>
			<tr>
				<td colspan="3" align="right">
					<c:if test="${sessionScope.loginId eq vo.memberId }">
						<a href="${pageContext.request.contextPath }/review/edit.do?num=${vo.reviewNum}">
						<input type="button" value="수정"></a>
						<input type="button" value="삭제" onclick="delreview()">
					</c:if></td>
			</tr>
		</table>
	</form>
</body>
</html>