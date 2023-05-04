<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Detail</title>
	<title>HAMO YEAH</title>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Untree.co">
	<link rel="shortcut icon" href="logo.png">

	<meta name="description" content="" />
	<meta name="keywords" content="bootstrap, bootstrap4" />

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&family=Source+Serif+Pro:wght@400;700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/owl.carousel.min.css">
	<link rel="stylesheet" href="../css/owl.theme.default.min.css">
	<link rel="stylesheet" href="../css/jquery.fancybox.min.css">
	<link rel="stylesheet" href="../fonts/icomoon/style.css">
	<link rel="stylesheet" href="../fonts/flaticon/font/flaticon.css">
	<link rel="stylesheet" href="../css/daterangepicker.css">
	<link rel="stylesheet" href="../css/aos.css">
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/boardDetail.css">
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

//참가신청 버튼 실행시
function par(boardNum, memberId){
	const xhttp = new XMLHttpRequest();
	
	xhttp.onload = function(){
		let obj = JSON.parse(xhttp.responseText);
		if(obj.flag){ // 참가신청 버튼을 눌렀음.
			let result = confirm('신청되었습니다.\n주최자의 사정에 의해 거절될 수 있습니다.\n히스토리로 이동하시겠습니까?');
			if(result){
				location.href = "${pageContext.request.contextPath}/board/participateList.do?memberId=${sessionScope.loginId}";
			} else {
				location.href = "${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${boardvo.boardNum}&memberId=${sessionScope.loginId}";
			}
		} else { // 신청 취소 버튼을 눌렀음.
			alert('신청 취소되었습니다.');
			location.href = "${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${boardvo.boardNum}&memberId=${sessionScope.loginId}";
		}
	}
	
	let param = "memberId=" + memberId;
	param += "&boardNum=" + boardNum; 
	xhttp.open("POST", "${pageContext.request.contextPath}/board/boardDetail.do");
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

// 즐겨찾기 
function fav(board, id) {
	const xhttp = new XMLHttpRequest();
	
	xhttp.onload = function() {
		let obj = JSON.parse(xhttp.responseText);
		let img = document.getElementById("img");
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

// 게시글 삭제 
function delBoard(boardNum, memberId) {
	let check = confirm("정말 삭제하시겠습니까?");
	if (check == true) {
		let param = "?boardNum=" + boardNum;
		param += "&memberId=" + memberId;
		location.href = "${pageContext.request.contextPath}/board/deleteBoard.do" + param;
	}
}
// 신고하기 기타의견 제약조건
function reportBoard(){
	let checkedRadio = document.querySelector("input[type=radio]:checked").value;
	if(checkedRadio == 6){
		let etc = document.getElementById("etc").value; // textarea value 먼저 변수에 담고
		if(etc == ''){ // value가 널이라면
			alert("기타 의견을 입력해 주세요.");
			event.preventDefault();
			return;
		}
		document.getElementById("warnetc").value = etc; // 널이 아니면 라디오버튼에 담기
	}
	const xhttp = new XMLHttpRequest();
	let param = "?memberId=${sessionScope.loginId}";
	param += "&boardNum=${boardvo.boardNum}";
	param += "&content=" + document.querySelector("input[type=radio]:checked").value;
	xhttp.open("get", "${pageContext.request.contextPath}/board/warning.do" + param);
	xhttp.send();

	xhttp.onload = function() {
		let val = xhttp.responseText;
		let obj = JSON.parse(val);
		if (obj.flag) {
			alert("신고 접수가 완료되었습니다.");
			location.href = "${pageContext.request.contextPath }/board/boardAllList.do";
			return;
		} else {
			alert("이미 신고한 게시글입니다.");
			event.preventDefault();
			return;
		}
	}
}
function userinfo(memberId){
	let win = open('${pageContext.request.contextPath}/member/otherInfo.jsp?memberId=' + memberId, '', 'width=400, height=400 top=200, left=600');
}
</script>

</head>

<body>
<div class="H-cantainer">
	<!-- 작성자가 본인일 경우 + 옐로카드 3미만일 경우 -->
	<div class="HB_btn">
	<c:if test="${sessionScope.loginId eq boardvo.memberId && boardvo.y_card < 3}">
		<input type="button" value="수정" onclick="javascript:location.href='${pageContext.request.contextPath}/board/editBoard.do?boardNum=${boardvo.boardNum }'">
		<input type="button" value="삭제" onclick="delBoard('${boardvo.boardNum}', '${sessionScope.loginId}')">
	</c:if>
	</div>

	<!-- 로그인 했지만 작성자가 아닐 경우 -->
	<div class="">
		<c:if test="${not empty sessionScope.loginId && sessionScope.loginId ne boardvo.memberId }">
		<div class="parent">
			<div class="HB_img">
				<c:if test="${boardvo.fav eq 0}"> 
					<img src="../img/F2.jpeg" id="img" style="width:20px; height:20px;"  onclick="fav('${boardvo.boardNum}', '${sessionScope.loginId }')">
				</c:if>
			
				<c:if test="${boardvo.fav eq 1}"> 
					<img src="../img/F1.png" id="img" style="width:20px; height:20px;"  onclick="fav('${boardvo.boardNum}', '${sessionScope.loginId }')">
				</c:if>
			 </div>
		</div>	 
		
			 <div class="detail">	
				<input class="WH_btn" type="button" id="reportbtn" value="신고">
				<input class="M_btn" type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/board/boardAllList.do';">
		     </div>
		    
		
				<div id="modal" class="modal-overlay">
				<div class="modal-window">
					<div class="title">
						<h3>신고하기</h3>
					</div>
					<div class="close-area">X</div>
					<div class="content">
						<form action="" method="post" name="f">
						<input type="hidden" name="memberId" value="${sessionScope.loginId }">
						<input type="hidden" name="boardNum" id="${boardvo.boardNum}" value="${boardvo.boardNum}">
						<input type="radio" name="content" id="warn" value="혐오 발언 또는 상징" onclick="this.form.textarea.disabled=true">혐오 발언 또는 상징<br/>
						<input type="radio" name="content" id="warn" value="폭력적인 게시글" onclick="this.form.textarea.disabled=true">폭력적인 게시글<br/>
						<input type="radio" name="content" id="warn" value="불법 또는 규제 상품 판매" onclick="this.form.textarea.disabled=true">불법 또는 규제 상품 판매<br/>
						<input type="radio" name="content" id="warn" value="이미지 도용" onclick="this.form.textarea.disabled=true">이미지 도용<br/>
						<input type="radio" name="content" id="warn" value="자살 또는 자해 유도성 게시글" onclick="this.form.textarea.disabled=true">자살 또는 자해 유도성 게시글<br/>
						<input type="radio" name="content" id="warn" value="사기 또는 거짓" onclick="this.form.textarea.disabled=true">사기 또는 거짓<br/>
						<input type="radio" name="content" id="warn" value="정치적 또는 종교적 성향 게시글" onclick="this.form.textarea.disabled=true">정치적 또는 종교적 성향 게시글<br/>
						<input type="radio" name="content" id="warnetc" value="6" onclick="this.form.textarea.disabled=false">기타<br/>
						<textarea name="textarea" id="etc" cols="50" rows="7" style="scrolling:yes" placeholder="기타 의견을 입력해 주세요." disabled></textarea>
						<input type="button" value="신고" id="reportbtn2" onclick="reportBoard()">
						</form>
					</div>
				</div>
			</div>
		
			<script>
			const modal = document.getElementById("modal")
			function modalOn() {
				modal.style.display = "flex"
			}
			function isModalOn() {
				return modal.style.display === "flex"
			}
			function modalOff() {
		    	modal.style.display = "none"
			}
			const btnModal = document.getElementById("reportbtn")
			btnModal.addEventListener("click", e => {
		    	modalOn()
			})
			const closeBtn = modal.querySelector(".close-area")
			closeBtn.addEventListener("click", e => {
		    	modalOff()
			})
			modal.addEventListener("click", e => {
		    	const evTarget = e.target
		    	if(evTarget.classList.contains("modal-overlay")) {
		        	modalOff()
		    	}
			})
			window.addEventListener("keyup", e => {
		    	if(isModalOn() && e.key === "Escape") {
		        	modalOff()
		    	}
			})
			</script>
		</c:if>
	</div>
</div>
<%-- 	<input type="button" value="목록" onclick="javascript:location.href='${pageContext.request.contextPath }/board/boardList.do'"> --%>
<div class="container">	
	<div id="content-board">
		<!-- boardvo 등록된 게시글 이미지 -->
		<div class="B_img ">
		<img src="${boardvo.imagepath }" style="width:880px; height:350px; padding-left: 8%; padding-right: 8% "> 
		</div>
		<!-- boardvo 제목 -->
		<div class="B_title">
			<div class="title"> ${boardvo.title } </div>
		</div>
		
		<div class="content-place">
			<div class="pal"> 장소 |  ${boardvo.place } </div>
			<div class="wth"> 날짜 |  ${boardvo.dDay } </div>
			<div class="ok"> ${boardvo.ok } 명 / ${boardvo.peopleMax} 명 </div>
			<div class="con"> ${boardvo.content } </div>
		</div>	  
	</div>
	
	<div class="content-host">
		<div class="content-H_ost">
			<div id="host">
				<div class="ho"> host </div>  
				<a onclick="userinfo('${membervo.memberId}')"><img src="${membervo.imagepath }" style="width:50px; height:50px;"></a><!-- membervo 프로필사진  -->
				<div class="nick"> ${membervo.nickname } </div>
			</div>
		</div>
	</div>

	<div class="content-participate">
		<!-- 승인된 참여자 리스트 -->
		<div class="p_list font-size: 24px;"> 참가자 </div>
			<div id="P_ok">
				<c:forEach var="mvo" items="${boardvo.mvolist}">
					<div id="${mvo.memberId }" onclick="userinfo('${mvo.memberId}')">
						<img src="${mvo.imagepath }" style="width:50px; height:50px;">
						${mvo.nickname }
					</div>
				</c:forEach>
			</div>
		
		<div class="PH_btn text-align:center;">
			<!-- 로그인 + 본인 글 아님 + 진행중 => 참여신청 버튼 뜸! -->
			<c:if test="${not empty sessionScope.loginId && sessionScope.loginId ne boardvo.memberId && off eq 0}">
				<!-- 참여 신청 안함 + 인원수 다 안참 + 신고 누적 3미만  -->
				<c:if test="${membervo.participate eq 0 && boardvo.ok ne boardvo.peopleMax && boardvo.y_card ne 3}">
					<input type="button" value="참여신청" onclick="par('${boardvo.boardNum}', '${sessionScope.loginId}')" style="background-color:red;">
				</c:if>
				<!-- 참여 신청을 이미 했다면? 혹은 승인됐지만 신청 취소하고 싶다면? -->
				<c:if test="${membervo.participate eq 1 || membervo.participate eq 2}">
					<input type="button" value="신청취소" onclick="par('${boardvo.boardNum}', '${sessionScope.loginId}')" style="background-color:grey;">
				</c:if>
				<!-- 참여 신청 안했는데 최대 인원이 다 찼다면? + 신고누적 3미만-->	
				<c:if test="${membervo.participate eq 0 && boardvo.ok eq boardvo.peopleMax && boardvo.y_card ne 3}">
					<input type="button" value="신청마감" onclick="alert('신청이 마감되었습니다.')" style="background-color:grey;">
				</c:if>
			</c:if>
		</div>
	</div>
	
	<c:if test="${not empty sessionScope.loginId && boardvo.y_card < 3}">
		
		<!-- 댓글 -->
		<div class="content-comments">
			<div class="com"> 댓글 </div>
			<div class="comsub">	
				<form action="${pageContext.request.contextPath}/board/comment.do" name="repf" method="post">
					<input type="hidden" name="boardNum" value="${boardvo.boardNum}" readonly> 
					<input type="hidden" name="memberId" value="${sessionScope.loginId}" readonly>
					<input type="hidden" name="reRepNum" value="0" readonly>
					<input type="text" name="content" id="content"> 
					<input type="submit" value="작성">
				</form>
			</div>
		</div>
			
		<div class="reps" style="display: inline-block;">
		  <c:forEach var="rep" items="${boardvo.reps}">
		    <div id="${rep.repNum}">
		      <span class="author">${rep.memberId}</span> 
		      <span class="content">
		        ${rep.content}
		        <c:if test="${sessionScope.loginId eq rep.memberId}">
		          <input type="button" value="삭제" onclick="del('${rep.repNum}')">					
		        </c:if>					
		      </span>
		    </div> 
		  </c:forEach> 
		</div>

	</c:if>
	
</div>

	<script src="../js/jquery-3.4.1.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/jquery.animateNumber.min.js"></script>
	<script src="../js/jquery.waypoints.min.js"></script>
	<script src="../js/jquery.fancybox.min.js"></script>
	<script src="../js/aos.js"></script>
	<script src="../js/moment.min.js"></script>
	<script src="../js/daterangepicker.js"></script>

	<script src="../js/typed.js"></script>
	
	<script src="../js/custom.js"></script>
</body>
</html>