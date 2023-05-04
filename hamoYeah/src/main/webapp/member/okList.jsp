<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 멤버 승인</title>
<link rel="stylesheet" href="./style.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/oklist.css">

<script type="text/javascript">
function userinfo(memberId){
	let win = open('${pageContext.request.contextPath}/member/otherInfo.jsp?memberId=' + memberId, '', 'width=400, height=400 top=200, left=600');
}
</script>
</head>

<body>
<div class="oktitle">
<div class="title">${title }</div>
<c:if test="${empty list0 && empty list1}"><h5>참여 신청한 사람이 없습니다.</h5></c:if>
</div>


<c:if test="${not empty list0 || not empty list1}">

<div class="header">
<div class="head2">
   <h5>승인요청</h5>
   <h4><span id="cnt">0</span> / ${rest}</h4>
</div>
<div> 
   <c:if test="${rest ne 0 }">
   <input type="button" id="ok" value="▶" onclick="ok(${boardNum})" style="background-color:transparent">
   </c:if>
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
			f.action = "${pageContext.request.contextPath}/member/okList.do" + param;
			f.submit();
		}
	}
}
</script>
<div class="head1">
   <h4>승인완료</h4>
   <h5>${now} / ${max}</h5>
</div>

</div>


<div class="content">

<div class="NO_container" style="width: 200px;">
   <!-- 미승인 사람 리스트 -->
   <form action="" method="post" name="f">
   <c:forEach var="vo" items="${list0}">
   <br/>
      <div class="No_container" style="margin-left: 47%; border-collapse: collapse; width:200px">
         <div>
         <div rowspan="2" style="width:10%">
         <input type="checkbox" name="check" value="${vo.memberId}" >
         </div>
            <div rowspan="2" style="width:20%"><a onclick="userinfo('${vo.memberId}')"><img src="${vo.imagepath}"
               name="img" style="width:50px; height:50px; border-radius:50%"></a></div>
            <div style="font-size:12px">${vo.nickname}</div>
         </div>
         <div>
         <div style="font-size:12px; width:70%; height:25px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${vo.intro}</div>
         </div>
      </div>
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

<!-- <div class="con3" style="width:50px;"> -->
<!-- 버튼있던 자리 --> 
<!-- </div> -->


<div class="con1" style="width: 200px;">
   <!-- 승인한 사람 리스트 -->
   <c:forEach var="vo" items="${list1}">
   <br/>
   <div class="OK_container" style="margin-left: 47%;; border-collapse: collapse; width:200px">
         <div class="img">
            <div rowspan="2" style="width:20%"><a onclick="userinfo('${vo.memberId}')"><img src="${vo.imagepath}"
               name="img" style="width:50px; height:50px; border-radius:50%"></a></div>
         </div>
         
         <div class="nic">
            <div style="font-size:12px">${vo.nickname}</div>
            <div style="font-size:12px; width:100%; height:25px;">${vo.intro}</div>
         </div>
   </div>

   </c:forEach>
</div>

</div>
</c:if>
</body>
</html>