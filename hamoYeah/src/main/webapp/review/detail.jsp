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
</script>

</head>
<body>


      <form action="${pageContext.request.contextPath }/review/edit.do?num=${vo.reviewNum}" method="post">
         <table border="1" width="800" height="250">
            <tr height="75">
               <td rowspan="2" width="150"><img src="${vo.imagepath }" width="150px" height="100px"></td>
               <td>관심사: <input type="text" value="${vo.tag }" readonly></td>
            </tr>   
            <tr>
               <td>내용: <textarea rows="4" name="content" cols="50" >${vo.content }</textarea></td>
            </tr>
            <c:if test="${sessionScope.loginId eq vo.memberId }">
            <a href="${pageContext.request.contextPath }/review/edit.do?num=${vo.reviewNum}"><input type="button" value="수정"></a>
            </c:if>
            <c:if test="${sessionScope.loginId eq vo.memberId }">
            <input type="button" value="삭제" onclick="javascript:location.href='${pageContext.request.contextPath }/review/del.do?reviewNum=${vo.reviewNum}'">
            </c:if>
         </table>
         <input type="button" value="좋아요" onclick="likes(${vo.reviewNum})"><span id="likenum">${cnt }</span>
      </form>



</body>
</html>