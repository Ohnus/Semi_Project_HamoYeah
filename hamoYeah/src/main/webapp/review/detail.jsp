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
<title>리뷰피드 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
  <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">

<style>
label {
	font-family: 'NanumSquareNeo', sans-serif;
}

body {
	font-family: 'NanumSquareNeoLight', sans-serif;
}
</style>
<style>

.sub_main{
margin:auto;
}
</style>
</head>
<body>



<!-- 맨위에 있는 헤더 -->
		<div class="max-w-screen-md mx-auto p-5" style="margin-top:5%;">
		<div class="text-center mb-16" style="color:#4020DO">
			<p class="mt-4 text-sm leading-7 text-gray-500 font-regular uppercase">Hamoyeah</p>
			<h6 class="sm:text-xl leading-normal font-extrabold tracking-tight text-blue-400" style="color:rgb(64,224,208); font-family:NanumSquareNeoExtraBold">모임에 참가하신 회원분들의 소중한 후기</h6>
		</div>
		
		
<br><br>
		
		
		<form class="sub_main" action="${pageContext.request.contextPath }/review/edit.do?num=${vo.reviewNum}" method="post" enctype="multipart/form-data">
			<input type="hidden" name="memberId" id="memberId" value="${sessionScope.loginId }"> 
			<input type="hidden"name="boardNum" id="boardNum" value="${vo.boardNum }">
			
			
				<div class="container" style="text-align:center; margin-left:120px; margin-bottom:20px;" >
				<span><img src="${mvo.imagepath }" style="width:50px; height:50px; border-radius: 70%;"></span>
				<span><input class="" style="font-size:20px; font-weight:bold" type="text" name="memberId" id="memberId"	value="${sessionScope.loginId }" readonly></span>
				</div>
			
			
				<div style="text-align:center width:500px;">
				</div>
<!-- 			리뷰이미지 -->
			<img src="${vo.imagepath }" class="rounded mx-auto d-block" alt="..." width="400px" height="400px">
			
				
<!-- 				태그와 좋아요버튼 -->
				<div style="text-align:center;">
<%-- 				<span><input 	class="" type="text" name="tag" id="tag" value="${vo.tag }" disabled style="background-color:transparent;"></span> --%>
				<button type="button" value="좋아요" onclick="likes(${vo.reviewNum})" style="border: none; background-color:transparent;">
				<img src="${pageContext.request.contextPath }/review/heart.png" style="width:30px; height:30px;">
				<span id="likenum">${cnt } </span></button>
<%-- 				<div>${vo.tag }</div></div> --%>
		
			
			
					<div style="text-align:center; margin-top:15px;" >
					<textarea style="verticla-align:middel; width:378.4px; height:200px; resize:none; border:1px solid lightgrey;"
						aria-label="content" rows="4" name="content" cols="50" readonly>${vo.content }</textarea></div>
						
			
			
			
		
				
				
<!-- 				뭔지모르는 사진 -->
<!-- 					<label -->
<!-- 						class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" -->
<!-- 						for="imagepath">IMAGE</label> <input -->
<!-- 						class="rounded mx-auto d-block" -->
<!-- 						type="file" name="imagepath" id="imagepath" style="display: none" -->
<!-- 						accept="image/*"> <label for="imagepath"> <img -->
<%-- 						src="${vo.imagepath }" width="400px" height="400px"> --%>
<!-- 					</label> -->
					
				
			
			
			
<!-- 				<label  -->
<!-- 					class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" disabled  -->
<!-- 					for="memberId">WRITER</label><input -->
<!-- 						class="" -->
<!-- 						type="text" name="memberId" id="memberId" -->
<%-- 						value="${sessionScope.loginId }" readonly> --%>
<%-- 						<img src="${mvo.imagepath }" width="100px" height="100px"> --%>
			
		
						
		
<!-- 						<label -->
<!-- 						class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" -->
<!-- 						for="content">Content</label> -->
<!-- 					<textarea class="" -->
<%-- 						aria-label="content" rows="4" name="content" cols="50"  readonly>${vo.content }</textarea> --%>
					
<!-- 					<label -->
<!-- 						class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" -->
<!-- 						for="imagepath">IMAGE</label> <input -->
<!-- 						class="" -->
<!-- 						type="file" name="imagepath" id="imagepath" style="display: none" -->
<!-- 						accept="image/*"> <label for="imagepath"> <img -->
<%-- 						src="${vo.imagepath }" width="400px" height="400px"> --%>
<!-- 					</label> -->
			
			
			
			
			<br><br><br><br>
			
		<!-- 			원글떼오기			 -->
		<div id="">원글 보러가기</div>
	<div style="width: 394px; height: 152px; border: 1px solid black; margin:auto; border-radius:7px;">
  			<div style="vertical align: middle; ">	
  				<a href="${pageContext.request.contextPath}/board/boardDetail.do?boardNum=${bvo.boardNum}&memberId=${bvo.memberId}">
    			<span style="float:left;"><img src="${bvo.imagepath }" width="150px" height="150px" class="rounded mx-auto d-block"></span>
    			</a>
<%-- 	${bvo.imagepath} --%>
				
					<div style="text-align:left">    
				      <span>${bvo.tag}</span>
				    </div>
  
			  	
				    <div style="text-align:left">
				      ${bvo.title}
				      </div>
			 	
			  
				  <div style="text-align:left">
				    <span >내용 ${bvo.content}</span>
				  </div>
		</div>
</div>
					<c:if test="${sessionScope.loginId eq vo.memberId }">
						
						<input type="button" value="수정" onclick="location.href='${pageContext.request.contextPath }/review/edit.do?reviewNum=${vo.reviewNum}'">
						<input type="button" value="삭제" onclick="delreview()">
					</c:if>
				</form>
				</div>
	</div>			
	
		
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
			</body>
			</html>