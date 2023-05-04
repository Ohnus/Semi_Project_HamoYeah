<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 모임 리스트</title>

<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/1.7.3/tailwind.min.css'>
<link rel="stylesheet" href="./style.css">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'><link rel="stylesheet" href="./style.css">
  
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<style>
label {
	font-family: 'NanumSquareNeo', sans-serif;
}

body {
	font-family: 'NanumSquareNeoLight', sans-serif;
}

 .list-container { 
 	display: grid; 
  	grid-template-columns: repeat(2, 1fr);
   	grid-gap: 1rem; 
 	justify-content: center; 
 	align-items: center; 
 	font-family: "NanumSquareNeoLight"; 
 	margin: 0 auto; 
 	font-family: 'NanumSquareNeoLight', sans-serif; 
}
</style>

<style>
.list-container {
	display: grid;
 	grid-template-columns: repeat(4, 1fr);
  	grid-gap: 4rem;
	justify-content: center;
	align-items: center;
	font-family: "NanumSquareNeoLight";
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
	font-family: "NanumSquareNeoBold";
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

function searchByKeyword() {
	let type = k.keywordSearch.value;
	let searchText = document.getElementById("searchText").value;
    let form = document.getElementById("f");
	// 비동기로 결과 리스트 전환하기
	if (type == "1") {
		let param = "?place=" + searchText;
		param += "&memberId=${sessionScope.loginId}";
		k.action = "${pageContext.request.contextPath }/board/placeList.do" + param;
		k.submit();
		
	} else if (type == "2") {
		let param = "?title=" + searchText;
		param += "&memberId=${sessionScope.loginId}";
		k.action = "${pageContext.request.contextPath }/board/titleList.do" + param;
		k.submit();
		
	} else if (type == "3") {
		let param = "?content=" + searchText;
		param += "&memberId=${sessionScope.loginId}";
		k.action = "${pageContext.request.contextPath }/board/contentList.do" + param;
		k.submit();
	}
}


function searchByTag(id) {
	let param = "?id=" + document.getElementById(id).value; // 해당 구문은 무조건 쌍으로 설정. 보냈을 때 어떤 것의 값인지 알아야하기 때문
	param += "&memberId=${sessionScope.loginId}";
	f.action = "${pageContext.request.contextPath }/board/tagList.do" + param;
	f.submit();
}


function change(board, id) {
	const xhttp = new XMLHttpRequest();
	
	xhttp.onload = function() {
		let obj = JSON.parse(xhttp.responseText);
		let img = document.getElementById("img_" + board);
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
	
	
</script>
</head>

<body>

<form action="" method="post" id="k" style="margin-top:5%;">
<div class="container mt-3">

  <div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-2">
      <select class="form-select" name="keywordSearch" id="keywordSearch" style="font-family:NanumSquareNeoLight">
        <option value="1">장소</option>
        <option value="2">제목</option>
        <option value="3">내용</option>
      </select>
    </div>
    <div class="col-md-6">
      <div class="input-group">
        <input type="text" class="form-control" id="searchText" name="searchText" placeholder="검색할 내용을 입력해주세요" style="font-family:NanumSquareNeoLight; border:1px solid #ced4da">
        <div class="input-group-append">
          <button class="btn btn-info" type="button" value="검색" onclick="searchByKeyword()">
            <i class="fa fa-search"></i>
          </button>
        </div>
      </div>
    </div>
    <div class="col-md-2">
    </div>
  </div>
</div>
<br/>
</form>


<form action="" method="post" id="f" class="tagbutton">

<button type="button" style="background-color: rgba(0, 0, 0, 0); border-color: transparent;" id="1" value="전체" 
onclick="location.href='${pageContext.request.contextPath }/board/boardAllList.do?memberId=${sessionScope.loginId}'">ALL</button>

<button type="button" id="1" value="문화/예술" onclick="searchByTag(1)">🎨문화/예술</button>
<button type="button" id="2" value="운동/액티비티" onclick="searchByTag(2)">⚽운동/액티비티</button>
<button type="button" id="3" value="푸드/드링크" onclick="searchByTag(3)">🍕푸드/드링크</button>
<button type="button" id="4" value="취미" onclick="searchByTag(4)">🎮취미</button>
<button type="button" id="5" value="봉사활동" onclick="searchByTag(5)">💙봉사활동</button>
<button type="button" id="6" value="반려동물" onclick="searchByTag(6)">🐶반려동물</button>
<button type="button" id="7" value="성장/자기계발" onclick="searchByTag(7)">📚성장/자기계발</button>
<button type="button" id="8" value="대화/친목" onclick="searchByTag(8)">👨‍👩‍👦대화/친목</button>

</form>
<br/>


<c:if test="${empty list }"><p style="text-align:center; font-family:NanumSquareNeo">선택한 관심사로 작성된 글이 없습니다.</p></c:if>

<div class="list-container grid">

<c:forEach var="vo" items="${list }">

<div class="container mx-auto px-10" id="list" style="width:300px; height:500px">
  <div class="grid grid-cols-1 gap-10">
  
    <div class="rounded overflow-hidden shadow-sm flex flex-col">
    <a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}&memberId=${sessionScope.loginId}">
    <img class="w-full" src="${vo.imagepath }" style="width:300px; height:200px;"></a>    

    <div class="px-6 py-3 mb-auto flex">
    
    <div class="text-xs transition duration-500 ease-in-out flex-grow-1" style="color:rgb(64,224,208); font-family:NanumSquareNeo; font-size:13px">${vo.tag }</div>
 
    <div class="text-xs transition duration-500 ease-in-out flex-grow-2">
    <c:if test="${not empty sessionScope.loginId && sessionScope.loginId ne vo.memberId }">
        <c:if test="${vo.fav eq 0}"> 
          <img src="../img/F2.jpeg" id="img_${vo.boardNum }" style="width:20px; height:20px;" onclick="change('${vo.boardNum}', '${sessionScope.loginId }')">
        </c:if>

        <c:if test="${vo.fav eq 1}"> 
          <img src="../img/F1.png" id="img_${vo.boardNum }" style="width:20px; height:20px;" onclick="change('${vo.boardNum}', '${sessionScope.loginId }')">
        </c:if>
    </c:if>
    </div>
    </div>
    

    <div class="px-6 py-1 mb-auto">
    <div class="font-medium text-lg hover:text-indigo-600 transition duration-500 ease-in-out mb-2" 
    style="color:rgb(64,224,208); width:225px; height:25px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis; font-family:NanumSquareNeoBold">${vo.title }</div>
 
    <div class="text-gray-500 text-sm mb-2" style="width:225px; height:44px; font-family:NanumSquareNeo; display:-webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;">${vo.content }</div>
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

</div>


</body>
</html>