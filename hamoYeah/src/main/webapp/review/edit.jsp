<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 수정</title>
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

<script type="text/javascript">
//파일 업로드 미리보기
function thumbnail(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('preview').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} else {
		document.getElementById('preview').src = e.target.result;
	}
}
function imgReset() {
	document.getElementById('preview').src = "../img/nopic.jpg";
	document.getElementById('imgpath').value = null;
}
</script>
</head>
<body>

<div class="max-w-screen-md mx-auto p-5">
  <div class="text-center mb-16">
    <p class="mt-4 text-sm leading-7 text-gray-500 font-regular uppercase" style=font-family:NanumSquareNeo>
        Hamoyeah 
      </p>
      <h5 class="sm:text-2xl leading-normal font-extrabold tracking-tight" style="color:rgb(64,224,208); font-family:NanumSquareNeoExtraBold">후기를 수정해보세요📝</h5>
  </div>
  
<form class="w-full" action="${pageContext.request.contextPath }/review/edit.do" enctype="multipart/form-data" method="post" >
  <div class="flex flex-wrap -mx-3 mb-6">
   <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
    <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="memberId">WRITER</label>
	<input class="appearance-none bg-transparent border-b border-blue-400 w-full text-gray-700 mr-3 p-4 leading-tight focus:outline-none focus:bg-gray-200" 
	type="text" name="writer" id="member_id" value="${sessionScope.loginId}" readonly style="border-bottom-color:rgb(64, 224, 208)">
	<input type="hidden" value="${vo.reviewNum }" name="reviewNum">
	</div>

	<div class="w-full md:w-1/2 px-3">
	<label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="tag">TAG</label>
	<input class="appearance-none bg-transparent border-b border-blue-400 w-full text-gray-700 mr-3 p-4 leading-tight focus:outline-none focus:bg-gray-200"
	type="text" name="tag" id="tag" value="${vo.tag }" readonly  style="border-bottom-color:rgb(64, 224, 208)">
	</div></div>
  
  <div class="flex flex-wrap -mx-3 mb-6">
    <div class="w-full px-3">
    <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="content">CONTENT</label>
	<textarea name="content" id="content"  rows="10" cols="100" 
	class="appearance-none bg-transparent border-b border-blue-400 w-full text-gray-700 mr-3 p-4 focus:bg-gray-200 leading-tight focus:outline-none" aria-label="content" style="border-bottom-color:rgb(64, 224, 208)">${vo.content }</textarea>
  </div></div>

  <div class="flex flex-wrap -mx-3 mb-6">
    <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
<label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="imagepath">IMAGE</label>
<input class="appearance-none bg-transparent border-b border-blue-400 w-full text-gray-700 mr-3 p-4 leading-tight focus:outline-none focus:bg-gray-200"
type="file" id="imagepath" name="imagepath" accept="image/*" onchange="thumbnail(this);">
 <label for="imagepath">
<img src="${vo.imagepath }" id="preview" style="width: 400px; height: 400px">
<!-- <input type="button" value="삭제" id="del" onclick="imgReset();"> -->
</label>
  </div>
  </div>
  </form>
  
   <div class="flex justify-between w-full px-3">
	<input class="shadow bg-blue-400 hover:bg-blue-200 focus:shadow-outline focus:outline-none text-white font-bold py-2 px-6 rounded"
	type="submit" value="수정" style="background-color:rgb(64, 224, 208)"> <!-- 저장을 누르면 post로 전송 -->
	<input class="shadow bg-blue-400 hover:bg-blue-200 focus:shadow-outline focus:outline-none text-white font-bold py-2 px-6 rounded"
	type="button" value="취소" onclick="location.href='${pageContext.request.contextPath }/review/detail.do?reviewNum=${vo.reviewNum}'" style="background-color:rgb(64, 224, 208)">
  </div>
</div>

</body>
</html>