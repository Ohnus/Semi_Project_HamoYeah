<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>후기 글 작성</title>
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

	function fincheck() {
		let imagepath = document.getElementById("imagepath").value;
		let content = document.getElementById("content").value;
		if (imagepath == '' || content == '') {
			alert("입력되지 않은 값이 있습니다. 다시 확인해주세요.")
			event.preventDefault();
			return;
		}
		f.action = "${pageContext.request.contextPath }/review/add.do";
		f.submit();
	}

	function cancel() {
		let check = confirm("정말 취소하시겠습니까?");
		if (check == true) {
			f.action = "${pageContext.request.contextPath}/board/participateList.do?memberId=${sessionScope.loginId}";
			f.submit();
		}
	}
</script>

</head>
<body>

	<div class="max-w-screen-md mx-auto p-5">
  <div class="text-center mb-16">
    <p class="mt-4 text-sm leading-7 text-gray-500 font-regular uppercase" style=font-family:NanumSquareNeo>
        Hamoyeah 
      </p>
      <h6 class="sm:text-xl leading-normal font-extrabold tracking-tight" style="color:rgb(64,224,208); font-family:NanumSquareNeoExtraBold">모임은 즐거우셨나요? 후기를 작성해보세요!😃</h6>
  </div>
  
  
	<form class="w-full" action="" method="post" enctype="multipart/form-data" id="f" name="f" >
		<input type="hidden" name="memberId" id="memberId" value="${sessionScope.loginId}" readonly>
		<input type="hidden" name="boardNum" id="boardNum" value="${vo.boardNum }">
			<div class="flex flex-wrap -mx-3 mb-6">
   				<div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
				<label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="memberId">WRITER</label>
				<input class="appearance-none bg-transparent border-b border-blue-400 w-full text-gray-700 mr-3 p-4 leading-tight focus:outline-none focus:bg-gray-200" 
      type="text" name="memberId" id="memberId" value="${sessionScope.loginId }" style="border-bottom-color:rgb(64, 224, 208)">
				</div>
			
			 <div class="w-full md:w-1/2 px-3">
				<label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="tag">TAG</label>
				<input class="appearance-none bg-transparent border-b border-blue-400 w-full text-gray-700 mr-3 p-4 leading-tight focus:outline-none focus:bg-gray-200"
				type="text" name="tag" id="tag" value="${vo.tag }" readonly style="border-bottom-color: rgb(64, 224, 208)">
				</div></div>
				
				<div class="flex flex-wrap -mx-3 mb-6">
    		    <div class="w-full px-3">
     		    <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="content">Content</label>
				<textarea rows="10" cols="100" name="content" id="content" class="appearance-none bg-transparent border-b border-blue-400 w-full text-gray-700 mr-3 p-4 focus:bg-gray-200 leading-tight focus:outline-none"
						placeholder="내용을 입력해주세요" aria-label="content" style="border-bottom-color: rgb(64, 224, 208)"></textarea>
						</div></div>
			
				
			
				 <div class="flex flex-wrap -mx-3 mb-6">
    			<div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
         	 <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="imagepath">IMAGE</label>
				<input class="appearance-none bg-transparent border-b border-blue-400 w-full text-gray-700 mr-3 p-4 leading-tight focus:outline-none focus:bg-gray-200"
				type="file" id="imagepath" name="imagepath" accept="image/*" style="display:none"  onchange="thumbnail(this);">
<!-- 			<input type="button" value="삭제" id="del" onclick="imgReset();"> -->
			 <label for="imagepath" >
					<img src="../img/nopic.jpg" id="preview" style="width: 200px; height: 200px"><br />
				</label>
				</div>
     			</div>
			</form>
			
		  <div class="flex justify-between w-full px-3">
				<input class="shadow bg-blue-400 hover:bg-blue-200 focus:shadow-outline focus:outline-none text-white font-bold py-2 px-6 rounded"
				type="submit" value="저장" onclick="fincheck()" style="background-color: rgb(64, 224, 208)">
				<input class="shadow bg-blue-400 hover:bg-blue-200 focus:shadow-outline focus:outline-none text-white font-bold py-2 px-6 rounded"
				type="button" value="작성취소" onclick="cancel()" style="background-color: rgb(64, 224, 208)">
	  	</div>
	  </div>
</body>
</html>