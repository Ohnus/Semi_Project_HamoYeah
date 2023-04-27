<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<script>
	function par(){
		const xhttp = new XMLHttpRequest();
		let param = "?memberId=" + ${sessionScope.loginId};
		param += "&boardNum=" + ${boardvo.boardNum}; 
		xhttp.open("GET", "${pageContext.request.contextPath}/board/participate.do");
		xhttp.send();	
	}
	
	
	
	function comm(){
		alert("comm");
		const xhttp = new XMLHttpRequest();
	    
	    xhttp.onload = function(){ 
	    	alert("result");
	    	let arr = JSON.parse(xhttp.responseText);
	    	html = '';
	    	
	    	for(let obj of arr){   /* 자바스크립트의 반복자 */ // membervo.imagepath......
	    		html += '<img src=' + obj.imagepath + '><span class="author">' + obj.memberId +'</span><span class="content">' 
	            + obj.content + '<input type="button" value="삭제" onclick="del(${commentvo.repNum })></span><br/><div id="place_'+ obj.repNum + '"> </div>';
	    	}

			let div = document.getElementById("reps");
	    	div.innerHTML = html;
	    	repf.content.value = '';
		}


		let param = "memberId=${sessionScope.loginId}";
		param += "&boardNum=${boardvo.boardNum}"; 
		param += "&content=" + repf.content.value; 
		param += "&reRepNum=0";
		alert(param);
		xhttp.open("POST", "${pageContext.request.contextPath}/board/comment.do");
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send(param);	
	}


// 	# 삭제
	function del(repNum){
	let delDiv = document.getElementById("repNum");
	document.getElementById("list").removeChild(delDiv);	
	}

</script>
</head>
<body>
<!-- 이미지, 작성자 정보, 제목, 내용, 참여자 리스트, 참여신청버튼, 댓글창, 목록버튼, 즐겨찾기, 신고 -->
	<img src="${boardvo.imagepath }"><br/>
	title: ${boardvo.title }<br/>
	nickname: ${membervo.nickname }<br/>
	intro: ${membervo.intro }<br/>
	content: ${boardvo.content }<br/>
	<input type="button" value="참여신청" onclick="par()">
	<input type="button" value="목록" onclick="javascript:location.href=/board/boardList.do">

<!-- 참여 승인 리스트 -->

	<!-- 댓글 -->
	<div id="comments">	
		<h3>댓글</h3>
         <form action="" name="repf" method="post">         
         	<input type="hidden" name="boardNum" value="${boardvo.boardNum}" readonly>
     	   	<input type="text" name="memberId" value="${sessionScope.loginId}" readonly>
         	<input type="text" name="content" id="content">
         	<input type="button" value="작성" onclick="comm()">
         </form>
		
         
		<div id="reps">
         <c:forEach var="rep" items="${boardvo.reps }">
			<div id="${commentvo.repNum}">         
         	<img src="${membervo.imagepath}">
            <span class="author">${rep.memberId }</span>
            <span class="content">
            ${rep.content } repNum : ${commentvo.repNum }<input type="button" value="삭제" onclick="del('${commentvo.repNum }')">
            </span>
            </div><br/>
         </c:forEach> 
        </div>
     </div>

</body>
</html>