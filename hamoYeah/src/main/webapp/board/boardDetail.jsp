<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Detail</title>
<style>
#content {
	text-align: center;
}
#host {
	text-align: center;
}
#participate {
	text-align: center;
}
#comments {
	text-align: center;
}

</style>
<script type="text/javascript">

//참가신청 버튼 실행시
function par(){
// 	const xhttp = new XMLHttpRequest();
// 	let param = "memberId=" + ${sessionScope.loginId};
// 	param += "&boardNum=" + ${boardvo.boardNum}; 
// 	xhttp.open("POST", "${pageContext.request.contextPath}/board/boardDetail.do");
// 	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
// 	xhttp.send(param);		
}

//댓글
function comm(){
	//alert("comm");
	const xhttp = new XMLHttpRequest();
    
    xhttp.onload = function(){ 
    	//alert("result");
    	let arr = JSON.parse(xhttp.responseText);
    	html = '';
    	for(let obj of arr){
    		html += '<div id=' + obj.repNum + '>';
    		html += '<span class="author">' + obj.memberId + '   </span>';
    		html += '<span class="content">' + obj.content;
    		// 여기부터 
    		html += '<c:if test="${sessionScope.loginId eq' + obj.memberId + '}">';
    		html += "<input type='button' value='삭제' onclick='del(\"" + obj.repNum + "\")'>";
    		// 여기까지 안 됨 ^^..
    		html += '</c:if></span></div><br/>'
    	}
		let div = document.getElementById("reps");
    	div.innerHTML = html;
    	repf.content.value = '';
	}


	let param = "memberId=${sessionScope.loginId}";
	param += "&boardNum=${boardvo.boardNum}"; 
	param += "&content=" + repf.content.value; 
	param += "&reRepNum=0";
	//alert(param);
	xhttp.open("POST", "${pageContext.request.contextPath}/board/comment.do");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);	
}	
//댓글 삭제
function del(repNum) {
    //alert("del");
    const xhttp = new XMLHttpRequest();
  
    xhttp.onload = function(){ 
//         alert("delrep");
//         let arr = JSON.parse(xhttp.responseText);
//         html = '';

        // 화면에서 데이터 지우기 
        let repDiv = document.getElementById("reps");
        let delrep = document.getElementById(repNum);
        repDiv.removeChild(delrep);
    };
    
   		// db에서 데이터 삭제
   		let param =  "repNum=" + repNum;
    	//alert(param);
    	xhttp.open("POST", "${pageContext.request.contextPath}/board/delcomment.do");
    	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    	xhttp.send(param);
   
}

// 즐겨찾기 
function fav(board, id) {
	const xhttp = new XMLHttpRequest();
	
	xhttp.onload = function() {
		let obj = JSON.parse(xhttp.responseText);
		let img = document.getElementById("img");
		if(obj.color == 0){
			img.src = "../img/F1.png";
		} else {
			img.src = "../img/F2.jpeg";
		}
	}
	
    let param = "boardNum=" + board;
    param += "&memberId=" + id;
	xhttp.open("Post", "${pageContext.request.contextPath}/board/favorites.do");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
	
}

// 게시글 삭제 
function delBoard(boardNum, memberId) {
	let check = confirm("정말 삭제하시겠습니까?");
	if (check == true) {
		let param = "?boardNum=" + boardNum;
		param += "&memberId=" + memberId;
		location.href = "${pageContext.request.contextPath}/board/deleteBoard.do" + param;
	}
}

</script>
</head>
<body>
<!-- 작성자가 본인일 경우 + 옐로카드 3미만일 경우 -->
<c:if test="${sessionScope.loginId eq boardvo.memberId && boardvo.y_card < 3}">
	<input type="button" value="수정" onclick="javascript:location.href='${pageContext.request.contextPath}/board/editBoard.do?boardNum=${boardvo.boardNum }'">
	<input type="button" value="삭제" onclick="delBoard('${boardvo.boardNum}', '${sessionScope.loginId}')">
</c:if>
<!-- 로그인 했지만 작성자가 아닐 경우 -->
<c:if test="${not empty sessionScope.loginId && sessionScope.loginId ne boardvo.memberId }">
	<c:if test="${boardvo.fav eq 0}"> 
		<img src="../img/F2.jpeg" id="img" style="width:20px; height:20px;"  onclick="fav('${boardvo.boardNum}', '${sessionScope.loginId }')">
	</c:if>
	<c:if test="${boardvo.fav eq 1}"> 
		<img src="../img/F1.png" id="img" style="width:20px; height:20px;"  onclick="fav('${boardvo.boardNum}', '${sessionScope.loginId }')">
	</c:if>
	<input type="button" value="신고">
</c:if>
	
<div id="content">
<%-- 	<input type="button" value="목록" onclick="javascript:location.href='${pageContext.request.contextPath }/board/boardList.do'"> --%>
	<br/><img src="${boardvo.imagepath }" style="width:300px; height:300px;"> <!-- boardvo 등록된 게시글 이미지 -->
	<h2> ${boardvo.title } </h2><!-- boardvo 제목 -->
	<h4> 장소 |  ${boardvo.place } </h4>
	<h4> 날짜 |  ${boardvo.dDay } </h4>
	<h5> ${boardvo.ok } 명 / ${boardvo.peopleMax} 명 </h5>
	<br/><br/>
	<h4> ${boardvo.content } </h4> <!-- boardvo 게시글 등록 내용 -->
</div>
	
	<br/><br/>
<div id="host">
	<h4> host </h4>
	<img src="${membervo.imagepath }" style="width:50px; height:50px;"><!-- membervo 프로필사진  -->
	<p>${membervo.nickname } </p>
<%-- 	<h5>${membervo.intro }</h5> <!-- membervo 한줄소개  --> --%>
</div>

	<br /> <br/>
	<br /> 
	
<div id="participate">	
	<!-- 참여자 리스트 -->
<!-- 	<div id="ok"> -->
<%-- 		<c:forEach var="membervo" items="${mvolist }"> --%>
<%-- 			<div id="${membervo.memberId }"> --%>
<%-- 			<img src="${membervo.imagepath }"><br/> --%>
<%-- 			${membervo.nickname }<br/> --%>
<!-- 			</div> -->
<%-- 		</c:forEach> --%>
<!-- 	</div> -->
	
	<input type="button" value="참여신청" onclick="par()">
	<br/><br/>
</div>

<c:if test="${not empty sessionScope.loginId && boardvo.y_card < 3}">
	<!-- 댓글 -->
<div id="comments">
		<h4> comment </h4>
		<div id="reps">
			<c:forEach var="rep" items="${boardvo.reps}">
				<div id="${rep.repNum}">
					<span class="author">${rep.memberId}</span> <span class="content">
						${rep.content}
					<c:if test="${sessionScope.loginId eq rep.memberId}">
					<input type="button" value="삭제" onclick="del('${rep.repNum}')">					
					</c:if>					
					</span>
				</div>
				<br />
			</c:forEach>
		</div>
		
		<form action="" name="repf" method="post">
			<input type="hidden" name="boardNum" value="${boardvo.boardNum}" readonly> 
			<input type="hidden" name="memberId"value="${sessionScope.loginId}" readonly>
			<input type="text" name="content" id="content"> 
			<input type="button" value="작성" onclick="comm()">
		</form>
</div>
</c:if>
</body>
</html>