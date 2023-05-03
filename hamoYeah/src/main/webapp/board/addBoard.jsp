<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <title>모임글 추가</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/1.7.3/tailwind.min.css'>
  <link rel="stylesheet" href="./style.css">
  <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">

<style>
label {
	font-family: 'NanumSquareNeo', sans-serif;
}

body {
	font-family: 'NanumSquareNeoLight', sans-serif;
	font-size: 13px;
}
</style>

<script>


function checkDatetime() {
    // 입력된 날짜와 시간 가져오기
    var input = document.getElementById("dDay").value;

    var now = new Date();

    // 입력된 값과 현재 시간 비교
    var inputDatetime = new Date(input);
    if (inputDatetime < now) {
      alert("과거의 날짜와 시간을 입력하셨습니다.");
    } 
}

function finCheck() {
	let title = document.getElementById("title").value;
	let content = document.getElementById("content").value;	
	let imagepath = document.getElementById("imagepath").value;	
	let place = document.getElementById("place").value;	
	let dDay = document.getElementById("dDay").value;	
	let tag = document.getElementById("tag").value;	
	let peopleMax = document.getElementById("peopleMax").value;	
	
	if (title == '' || content == '' || imagepath == '' || place == '' || dDay == '' || tag == '' || peopleMax == '') {
  		alert("입력되지 않은 값이 있습니다. 다시 확인해주세요.")
   		event.preventDefault();
   		return;
	}
	f.action = "${pageContext.request.contextPath }/board/addBoard.do";
	f.submit();
}


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

    
</script>
</head>
</body>


<body>


<div class="max-w-screen-md mx-auto p-5">
  <div class="text-center mb-16">
    <p class="mt-4 text-sm leading-7 text-gray-500 font-regular uppercase" style=font-family:NanumSquareNeo>
        Hamoyeah 
      </p>
      <h5 class="sm:text-2xl leading-normal font-extrabold tracking-tight" style="color:rgb(64,224,208); font-family:NanumSquareNeoExtraBold">모임을 주최해보세요😃</h5>
  </div>
  
 <form class="w-full" action ="" method="post" enctype="multipart/form-data" id="f" name="f">
 <input type="hidden" name="memberId" value="${sessionScope.loginId }">
  <div class="flex flex-wrap -mx-3 mb-6">
    <div class="w-full px-3 mb-6 md:mb-0">
      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">title</label>
      <input class="appearance-none bg-transparent border-b border-blue-400 w-full text-gray-700 mr-3 p-4 leading-tight focus:outline-none focus:bg-gray-200" 
      type="text" name="title" id="title" placeholder="제목을 입력해주세요(최대 40자)" aria-label="title" style="border-bottom-color:rgb(64, 224, 208)">
    </div>
  </div>

  <div class="flex flex-wrap -mx-3 mb-6">
 	<div class="w-full px-3">
      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-password">Content</label>
      <textarea name="content" id="content" rows="10" class="appearance-none bg-transparent border-b border-blue-400 w-full text-gray-700 mr-3 p-4 focus:bg-gray-200 leading-tight focus:outline-none" style="border-bottom-color: rgb(64, 224, 208)" placeholder="내용을 입력해주세요(최대 2000자)" aria-label="content"></textarea>
    </div>
  </div>
  
  
  <div class="flex flex-wrap -mx-3 mb-6">
    <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="place">관심태그설정</label>
      
      <select name ="tag" id="tag" class="appearance-none bg-transparent border-b border-blue-400 w-full text-gray-700 mr-3 p-4 leading-tight focus:outline-none focus:bg-gray-200" style="border-bottom-color: rgb(64, 224, 208)">
		<option value="문화/예술">문화/예술</option>
		<option value="운동/액티비티">운동/액티비티</option>	
		<option value="푸드/드링크">푸드/드링크</option>
		<option value="취미">취미</option>
		<option value="봉사활동">봉사활동</option>
		<option value="반려동물">반려동물</option>
		<option value="성장/자기계발">성장/자기계발</option>
		<option value="대화/친목">대화/친목</option>
	  </select>
    </div>
  <div class="w-full md:w-1/2 px-3">
      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="dDay">모임인원설정</label>
      <input class="appearance-none bg-transparent border-b border-blue-400 w-full text-gray-700 mr-3 p-4 leading-tight focus:outline-none focus:bg-gray-200" 
      type="number" min="1" name="peopleMax" id="peopleMax" style="border-bottom-color: rgb(64, 224, 208)">
    </div>
  </div>
  
  
  <div class="flex flex-wrap -mx-3 mb-6">
    <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="place">모임장소설정</label>
      <input class="appearance-none bg-transparent border-b border-blue-400 w-full text-gray-700 mr-3 p-4 leading-tight focus:outline-none focus:bg-gray-200" 
      type="text" name="place" id="place" placeholder="(예시)서울 여의도 한강공원" style="border-bottom-color: rgb(64, 224, 208)">
    </div>
    <div class="w-full md:w-1/2 px-3">
      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="dDay">모임일시설정</label>
      <input class="appearance-none bg-transparent border-b border-blue-400 w-full text-gray-700 mr-3 p-4 leading-tight focus:outline-none focus:bg-gray-200" 
      type="datetime-local" name="dDay" id="dDay" onchange="checkDatetime()" style="border-bottom-color: rgb(64, 224, 208)">
    </div>
  </div>
   
  
  <div class="flex flex-wrap -mx-3 mb-6">
    <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
      <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="imagepath">IMAGE</label>
      <input class="appearance-none bg-transparent border-b border-blue-400 w-full text-gray-700 mr-3 p-4 leading-tight focus:outline-none focus:bg-gray-200" 
      type="file" name="imagepath" id="imagepath" style="display:none" accept="image/*">
      <label for="imagepath">
	  <img src="../img/imageadd.png" width="300px" height="300px" id="upload-preview">
  	</label>
  </div>
  </div>
 </form> 
  

 <div class="flex justify-between w-full px-3">
  <input class="shadow bg-teal-400 hover:bg-teal-200 focus:shadow-outline focus:outline-none text-white font-bold py-2 px-6 rounded" 
    type="button" value="취소" onclick="location.href='${pageContext.request.contextPath }/board/boardAllList.do?memberId=${sessionScope.loginId}'" 
    style="background-color: rgb(64, 224, 208);">
  
    <input class="shadow bg-blue-400 hover:bg-blue-200 focus:shadow-outline focus:outline-none text-white font-bold py-2 px-6 rounded" 
    type="button" value="등록" onclick="finCheck()" style="background-color: rgb(64, 224, 208)">
  </div>
</div>

</body>
</html>