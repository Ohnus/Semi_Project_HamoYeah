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

<style>
.header {
  width: 25%;
  border: 2px solid black;
}
.body{
   width: 25%;
     border: 2px solid black;
}

</style>
<script>

function searchByTag(id) {

   let param = "?id=" + document.getElementById(id).value; // 해당 구문은 무조건 쌍으로 설정. 보냈을 때 어떤 것의 값인지 알아야하기 때문

   f.action = "${pageContext.request.contextPath }/review/tagsearch.do" + param;
   f.submit();
}
</script>
</head>
<body>



<form action="" method="post" id="f">
<input type="button" value="전체" onclick="location.href='${pageContext.request.contextPath }/review/list.do'">
<input type="button" id="1" value="문화/예술" onclick="searchByTag(1)">
<input type="button" id="2" value="운동/액티비티" onclick="searchByTag(2)">
<input type="button" id="3" value="푸드/드링크" onclick="searchByTag(3)">
<input type="button" id="4" value="취미" onclick="searchByTag(4)">
<input type="button" id="5" value="봉사활동" onclick="searchByTag(5)">
<input type="button" id="6" value="반려동물" onclick="searchByTag(6)">
<input type="button" id="7" value="성장/자기계발" onclick="searchByTag(7)">
<input type="button" id="8" value="대화/친목" onclick="searchByTag(8)">
</form>


<div class="header">
  <h2>리뷰 목록</h2>
</div> 
 
<div class="body">
   <c:if test= "${not empty sessionScope.loginId }">
        <a href="${pageContext.request.contextPath }/board/participateList.do?memberId=${sessionScope.loginId}">리뷰작성하러 가기</a>
   </c:if>
</div>


<c:if test="${empty list }"><p>선택하신 관심사로 작성된 글이 없습니다.</p></c:if>


<c:forEach var="vo" items="${list }">
<br/>
<form action="${pageContext.request.contextPath }/review/detail.do?reviewNum=${vo.reviewNum}" method="post">
<%-- <input type="button" value="리뷰작성" onclick="location.href='${pageContext.request.contextPath }/review/add.do?reviewNum=${vo.reviewNum}"> --%>
<table border ="1" style="width:600px, height:200px">


<tr><td rowspan="4"><a href="${pageContext.request.contextPath }/review/detail.do?reviewNum=${vo.reviewNum }" ><img src="${vo.imagepath }" style="width:100px; height:100px"></a></td><td>리뷰번호: ${vo.reviewNum }</td><td>작성자: ${vo.memberId }</td></tr>
<tr><td colspan="2">태그: ${vo.tag }</td></tr>
<tr><td colspan="2">날짜: ${vo.rDate }</td></tr>
<tr><td colspan="2">내용: ${vo.content }</td></tr>


</table>
</form>
</c:forEach>
</body>
</html>