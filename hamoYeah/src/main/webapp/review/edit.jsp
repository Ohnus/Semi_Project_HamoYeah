<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>





<form action="${pageContext.request.contextPath }/review/edit.do" method="post" enctype="multipart/form-data">
<table border="1">
<tr><th>작성자</th><td><input type="text" name="writer" id="member_id" value="${sessionScope.loginId}" readonly></td></tr>
<tr><th>태그</th><td><input type="text" name="tag" id="tag" value="${tag }"></td></tr>
<tr><th>글내용</th><td><textarea rows="10" cols="100" name="content" id="${content }"></textarea></td></tr>
<tr><th>이미지</th>
<td><input type="file" id="imagepath" name="imagepath"> 


</td></tr>
<tr><th>작성</th><td>
	<input type="submit" value="수정완료"> <!-- 저장누르면 post로 전송-->
	<a href="${pageContext.request.contextPath }/board/participateList.do"><input type="button" value="수정취소"></a></td></tr>

</table>
</form>
</body>
</html>