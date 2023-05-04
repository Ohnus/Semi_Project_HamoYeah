<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기한 모임</title>


<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/1.7.3/tailwind.min.css'>
<link rel="stylesheet" href="./style.css">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'><link rel="stylesheet" href="./style.css">

<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
 
<style>

.list-container {
	display: grid;
 	grid-template-columns: repeat(4, 1fr);
  	grid-gap: 4rem;
	justify-content: center;
	align-items: center;
	font-family: "나눔스퀘어";
	margin: 0 auto;
	max-width: 1200px;
	font-family: 'NanumSquareNeoLight', sans-serif;
}

.grid {
  display: grid;
  grid-gap: 1rem;
  align-items: start;
}


.list {
  	width: 300px;
}

.tagbutton {
	font-family: "나눔스퀘어";
	background-color: transparent;
    border: none;
    text-align: center;
}

.tagbutton button {
    margin: 10px; 
}

#f button {
	justify-content: center;
	align-items: center;
}

</style>

<script>
// 노란별을 누르면 회색별로 변하고 0->1 
// 회색별을 누르면 노란별로 변하고 1->0
function change(board, id){
	const xhttp = new XMLHttpRequest();
	
	xhttp.onload = function(){
		let obj = JSON.parse(xhttp.responseText);
		let img = document.getElementById("img_"+board);
		if (obj.color == 0){ // true - 노랗게 변하기
			img.src = "../img/F1.png";
		} else { // false - 회색으로 변하기
			img.src = "../img/F2.jpeg";
		}
	}
	
    let param = "boardNum=" + board;
    param += "&memberId=" + id;
	xhttp.open("Post", "${pageContext.request.contextPath}/board/favorites.do");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
}
</script>
</head>  
<body>
<div id="" style="margin-top:5%"></div>
<c:if test="${empty finalList }"><p style="text-align:center; font-family:NanumSquareNeo">즐겨찾기한 모임이 없습니다.</p></c:if>

<div class="list-container grid">

<c:if test="${not empty finalList}">
<c:forEach var="vo" items="${finalList}">

<div class="container mx-auto px-10" id="list" style="width:300px; height:500px">
  <div class="grid grid-cols-1 gap-10">
  
    <div class="rounded overflow-hidden shadow-sm flex flex-col">
    <a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}&memberId=${sessionScope.loginId}">
    <img class="w-full" src="${vo.imagepath }" style="width:300px; height:200px;"></a>    

    <div class="px-6 py-3 mb-auto flex">
    
    <div class="text-xs transition duration-500 ease-in-out flex-grow-1" style="color:rgb(64,224,208); font-family:NanumSquareNeo; font-size:13px">${vo.tag }</div>
 
    <div class="text-xs transition duration-500 ease-in-out flex-grow-2">
    <img src="../img/F1.png" id="img_${vo.boardNum }" style="width:20px; height:20px;" onclick="change('${vo.boardNum}', '${sessionScope.loginId }')">
    </div>
    </div>
    
    <div class="px-6 py-1 mb-auto">
    <div class="font-medium text-lg hover:text-indigo-600 transition duration-500 ease-in-out mb-2" 
    style="color:rgb(64,224,208); width:225px; height:25px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis; font-family:NanumSquareNeoBold">${vo.title }</div>
 
    <div class="text-gray-500 text-sm mb-2" style="width:225px; height:44px; font-family:NanumSquareNeo; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;">${vo.content }</div>
     </div>
  
    <div class="flex items-center px-6 py-1 pb-4">
      <div class="text-sm text-gray-90" style="font-family:NanumSquareNeoLight; font-size:13px">
        <span class="text-gray-900">⏰ ${vo.dDay }</span><br/>
        <span class="text-gray-900">🚩 ${vo.place }</span><br/>
        <span class="text-gray-900">🙋🏻‍♂️ ${vo.ok } / ${vo.peopleMax}</span><br/>
    </div>
</div>
</div>
</div>
</div>
</c:forEach>
</c:if>


</div>
</body>
</html>