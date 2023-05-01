<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <title>CodePen - Tailwind CSS Contact Form/Page - 5th</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/1.7.3/tailwind.min.css'>
  <link rel="stylesheet" href="./style.css">
  

<script>


// function checkDatetime() {
//     // 입력된 날짜와 시간 가져오기
//     var input = document.getElementById("dDay").value;

//     var now = new Date();

//     // 입력된 값과 현재 시간 비교
//     var inputDatetime = new Date(input);
//     if (inputDatetime < now) {
//       alert("과거의 날짜와 시간을 입력하셨습니다.");
//     } 
// }

window.onload = function() {
	  document.getElementById("imagepath").addEventListener("change", function(event) {
			var file = event.target.files[0];
	  		var reader = new FileReader();
	  
			reader.onload = function(e) {
	    	document.getElementById("upload-preview").src = e.target.result;
			document.getElementById("imagepath").src = e.target.result;
	  };

	  reader.readAsDataURL(file);
	});
}

function editBoard(boardNum) {
	let check = confirm("정말 수정하시겠습니까?");
	if (check == true) {
		let param = boardNum;
		let form = document.getElementById("f");
		f.action = "${pageContext.request.contextPath}/board/editBoard.do?boardNum=" + param;
		f.submit();
		return;
	}
}


// function delBoard(boardNum) {
// 	let check = confirm("정말 삭제하시겠습니까?");
// 	if (check == true) {
// 		let param = boardNum;
// 		let form = document.getElementById("f");
// 		f.action = "${pageContext.request.contextPath}/board/deleteBoard.do?boardNum=" + param;
// 		f.submit();
// 		return;
// 	}
// }

function editTag() {
	tagSelected.style.display = "none";
	tag.style.display = "";
	tagEdit.style.display = "none";
}

function alertdDay() {
	alert("모임진행일시는 수정이 불가능합니다.");
}

    
</script>
</body>


<body>


<div class="max-w-screen-md mx-auto p-5">
  <div class="text-center mb-16">
    <p class="mt-4 text-sm leading-7 text-gray-500 font-regular uppercase">
        Hamoyeah 
      </p>
      <h5 class="sm:text-2xl leading-normal font-extrabold tracking-tight text-blue-400">모임글을 수정해보세요✏</h5>
  </div>
  
 <form class="w-full" action ="${pageContext.request.contextPath }/board/editBoard.do" method="post" enctype="multipart/form-data" id="f" name="f">
 <input type="hidden" name="memberId" value="${vo.memberId }">
  <div class="flex flex-wrap -mx-3 mb-6">
    <div class="w-full px-3 mb-6 md:mb-0">
      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">title</label>
      <input class="appearance-none bg-transparent border-b border-blue-400 w-full text-gray-700 mr-3 p-4 leading-tight focus:outline-none focus:bg-gray-200" 
      type="text" name="title" id="title" value="${vo.title }" aria-label="title">
    </div>
  </div>

  <div class="flex flex-wrap -mx-3 mb-6">
 	<div class="w-full px-3">
      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-password">Content</label>
      <textarea name="content" id="content" rows="10" class="appearance-none bg-transparent border-b border-blue-400 w-full text-gray-700 mr-3 p-4 focus:bg-gray-200 leading-tight focus:outline-none" aria-label="content">${vo.content }</textarea>
    </div>
  </div>
  
  
  <div class="flex flex-wrap -mx-3 mb-6">
    <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="place">관심태그설정</label>
      <span id="tagSelected">${vo.tag }</span>
      <select name ="tag" id="tag" style="display:none" class="appearance-none bg-transparent border-b border-blue-400 w-full text-gray-700 mr-3 p-4 leading-tight focus:outline-none focus:bg-gray-200">
		<option value="문화/예술">문화/예술</option>
		<option value="운동/액티비티">운동/액티비티</option>	
		<option value="푸드/드링크">푸드/드링크</option>
		<option value="취미">취미</option>
		<option value="봉사활동">봉사활동</option>
		<option value="반려동물">반려동물</option>
		<option value="성장/자기계발">성장/자기계발</option>
		<option value="대화/친목">대화/친목</option>
	  </select>
	  <input class="shadow bg-blue-400 hover:bg-blue-200 focus:shadow-outline focus:outline-none text-white font-bold py-1 px-3 rounded inline-block" 
      type="button" value="수정" id="tagEdit" onclick="editTag()">
    </div>
  <div class="w-full md:w-1/2 px-3">
      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="dDay">모임인원설정</label>
      <input class="appearance-none bg-transparent border-b border-blue-400 w-full text-gray-700 mr-3 p-4 leading-tight focus:outline-none focus:bg-gray-200" 
      type="number" min="1" name="peopleMax" id="peopleMax" value="${vo.peopleMax }">
    </div>
  </div>
  
  
  <div class="flex flex-wrap -mx-3 mb-6">
    <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="place">모임장소설정</label>
      <input class="appearance-none bg-transparent border-b border-blue-400 w-full text-gray-700 mr-3 p-4 leading-tight focus:outline-none focus:bg-gray-200" 
      type="text" name="place" id="place" value="${vo.place }">
    </div>
    <div class="w-full md:w-1/2 px-3">
      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="dDay">모임일시설정</label>
      <input class="appearance-none bg-transparent border-b border-blue-400 w-full text-gray-700 mr-3 p-4 leading-tight focus:outline-none focus:bg-gray-200" 
      type="text" name="dDay" id="dDay" value="${vo.dDay }" readonly onclick="alertdDay()">
    </div>
  </div>
   
  
  <div class="flex flex-wrap -mx-3 mb-6">
    <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="imagepath">IMAGE</label>
      <input class="appearance-none bg-transparent border-b border-blue-400 w-full text-gray-700 mr-3 p-4 leading-tight focus:outline-none focus:bg-gray-200" 
      type="file" name="imagepath" id="imagepath" style="display:none" accept="image/*">
      <label for="imagepath">
	  <img src="${vo.imagepath }" width="150px" height="150px" id="upload-preview">
  	</label>
  </div>
  </div>
 </form> 
  
  <div class="flex justify-between w-full px-3">
    <input class="shadow bg-blue-400 hover:bg-blue-200 focus:shadow-outline focus:outline-none text-white font-bold py-2 px-6 rounded" 
    type="button" value="취소" onclick="location.href='${pageContext.request.contextPath }/board/boardAllList.do?memberId=${sessionScope.loginId}'">
  
    <input class="shadow bg-blue-400 hover:bg-blue-200 focus:shadow-outline focus:outline-none text-white font-bold py-2 px-6 rounded" 
    type="submit" value="수정" onclick="editBoard(${vo.boardNum})">
  </div>
</div>
</body>
</html>