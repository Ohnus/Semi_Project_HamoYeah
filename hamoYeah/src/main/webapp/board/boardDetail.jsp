<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Detail</title>
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
    	    html += '<img src=' + obj.imagepath + '><span class="author">' + obj.memberId +'</span><span class="content">' 
    	        + obj.content + '<input type="button" value="삭제" onclick="del(' + obj.repNum + ')"></span><br/><div id="place_'+ obj.repNum + '"> </div>';
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

</script>
</head>
<body>
	<!-- 게시글 등록된 이미지, 작성자 정보(프사,닉네임,인트로), 제목(게시글), 내용(게시글), 참여자 리스트, 참여신청버튼, 댓글창, 목록버튼, 즐겨찾기, 신고 -->
	<input type="button" value="즐겨찾기">
	<input type="button" value="신고">
	<input type="button" value="목록" onclick="javascript:location.href='${pageContext.request.contextPath }/board/boardList.do'">
	<img src="${boardvo.imagepath }"> <!-- boardvo 등록된 게시글 이미지 -->
<%-- 	<br /> favorites: ${boardvo.favorites }<!-- boardvo 즐겨찾기 --> --%>
	<br /> title: ${boardvo.title } <!-- boardvo 제목 -->
	<br /> img: ${membervo.imagepath } <!-- membervo 프로필사진  -->
	<br /> nickname: ${membervo.nickname } <!-- membervo 닉네임  -->
	<br /> intro: ${membervo.intro } <!-- membervo 한줄소개  -->
	<br /> content: ${boardvo.content } <!-- boardvo 게시글 등록 내용 -->
	<br /> 
	<input type="button" value="참여신청" onclick="par()">
	<br /> 
	<!-- 참여자 리스트 -->
	oklist: ${boardvo.ok }<br/>
<!-- 	<div id="ok"> -->
<%-- 		<c:forEach var="membervo" items="${mvolist }"> --%>
<%-- 			<div id="${membervo.memberId }"> --%>
<%-- 			<img src="${membervo.imagepath }"><br/> --%>
<%-- 			${membervo.nickname }<br/> --%>
<!-- 			</div> -->
<%-- 		</c:forEach> --%>
<!-- 	</div> -->
	
	<!-- 댓글 -->
	<div id="comments">
		<h3>댓글</h3>
		<form action="" name="repf" method="post">
			<input type="hidden" name="boardNum" value="${boardvo.boardNum}" readonly> 
			<input type="text" name="memberId"value="${sessionScope.loginId}" readonly>
			<input type="text" name="content" id="content"> 
			<input type="button" value="작성" onclick="comm()">
		</form>
		
		<!-- 댓글삭제 -->
		<div id="reps">
			<c:forEach var="rep" items="${boardvo.reps}">
				<div id="${rep.repNum}">
					<!-- <img src="../img/nopic.jpg" id="imgtest"> -->
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
		
	</div>
</body>
</html>