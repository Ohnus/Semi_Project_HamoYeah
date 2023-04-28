<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script>

//선택한 파일로 미리보기 적용하는 함수
	  window.onload = function() {
	  document.getElementById("upload-file").addEventListener("change", function(event) {
			var file = event.target.files[0];
	  		var reader = new FileReader();
	  
			reader.onload = function(e) {
	    	document.getElementById("upload-preview").src = e.target.result;
			document.getElementById("imagepath").src = e.target.result;
	  };

	  reader.readAsDataURL(file);
	});
}



	  
	  
	  function finCheck() {
			let member_id = document.getElementById("member_id").value;
			let board_num = document.getElementById("board_num").value;	
			let imagepath = document.getElementById("imagepath").value;	
			let tag = document.getElementById("tag").value;	
			let content = document.getElementById("content").value;	
			
			if (member_id == '' || board_num == '' || imagepath == '' || tag == '' || content == '') {
		  		alert("입력되지 않은 값이 있습니다. 다시 확인해주세요.")
		   		event.preventDefault();
		   		return;
			}
			 
			  
			f.action = "${pageContext.request.contextPath }/review/add.do";
			f.submit();
		}
	  
	  

	  function editBoard(review_num) {
		   let check = confirm("정말 수정하시겠습니까?");
		   if (check == true) {
		      let param = review_num;
		      let form = document.getElementById("f");
		      f.action = "${pageContext.request.contextPath}/review/editBoard.do?review_num=" + param;
		      f.submit();
		      return;
		   }
		}

	    
	function delBoard(review_num) {
		   let check = confirm("정말 취소하시겠습니까?");
		   if (check == true) {
		      let param = review_Num;
		      let form = document.getElementById("f");
		      f.action = "${pageContext.request.contextPath}/review/deleteBoard.do?review_num=" + param;
		      f.submit();
		      return;
		   }
		}
	  
</script>

</head>
<body>

<h3>리뷰작성</h3>
<form  action="" method="post" id="f" name="f" enctype="multipart/form-data">
<table border="1">
<tr><th>작성자</th><td>${sessionScope.loginId}<input type="hidden" name="memberId" id="memberId" value="${sessionScope.loginId}" readonly></td></tr>

<!-- <th>글번호(원글)</th> -->
<tr><td><input type="hidden" name="boardNum" id="boardNum" value="${vo.boardNum }"></td></tr>

<tr><th>태그</th><td><input type="text" name="tag" id="tag" value="${vo.tag }"></td></tr>
<tr><th>글내용</th><td><textarea rows="10" cols="100" name="content" id="content"></textarea></td></tr>
<tr><th>이미지</th>
<td><input type="file" id="imagepath" name="imagepath"> 


</td></tr>
<tr><th>작성</th><td>
	<input type="submit" value="저장" onclick="fincheck()">
	<a href="${pageContext.request.contextPath }/review/detail.do"><input type="button" value="작성취소" onclick="cancle()"></a></td></tr>
</table>
</form>
</body>
</html>