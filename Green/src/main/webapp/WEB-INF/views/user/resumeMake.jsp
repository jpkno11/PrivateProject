<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jik Job</title>
<style>

/* 전체 페이지 스타일링 */
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f8f9fa;
	color: #212529;
}

/* 사이드바 스타일링 */
.sidenav {
	background-color: #f1f1f1;
	position: fixed;
	width: 200px;
	height: 100%;
	margin-left: -20px;
	margin-top: 50px;
	padding-top: 20px;
}

/* 이력서 컨테이너 */
.resume-container {
	display: flex;
	justify-content: center;
	margin-top: 50px;
	margin-bottom: 50px;
}

/* 이력서 내부 스타일 */
.border-tertiary {
	border-color: #6c757d !important; /* 경계선 색상 변경 */
}

.hs_input_title, .form-control {
	border-radius: 0.25rem;
}

/* 이력서 내용 */
.resume-content {
	background-color: #ffffff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 85%;
}

/* 입력 폼 스타일링 */
.input-group-text {
	background-color: #e9ecef;
}

/* 포트폴리오, 자기소개서 입력 필드 스타일링 */
#floatingInput {
	border-radius: 0.25rem;
	width: 500px; /* 너비를 500px로 설정 */
	height: 50px; /* 높이를 50px로 설정 */
}

.button-container {
	display: flex;
	justify-content: center;
}
/* 버튼 스타일링 */
.btn-dark {
	background-color: #89CFF0; /* 밝은 파란색 */
	color: black; /* 글자 색상 */
	border: none; /* 테두리 없애기 */
}
.btn-dark:hover {
	background-color: #B3E0F2; /* 마우스 오버시 색상 */
}


textarea {
	border-radius: 0.25rem;
	width: 500px; /* 너비를 500px로 설정 */
	height: 300px; /* 높이를 300px로 설정 */
}

/* 이미지와 개인 정보를 나란히 표시하기 위한 스타일 */
.jh_resume_flexbox {
    display: flex; /* Flexbox 사용 */
    align-items: center; /* 항목들을 세로 중앙에 정렬 */
    justify-content: start; /* 내용을 시작점에서 정렬 */
    gap: 20px; /* 항목 사이의 간격 */
}


</style>
    <%@include file="/WEB-INF/views/include/pheader.jsp" %>
</head>
<body>

    <!-- 이력서 -->
	 <div class="resume-container">
        <form action="/Users/SaveResume" method="post" enctype="multipart/form-data">
            <input type="hidden" name="user_id" value="${sessionScope.plogin.user_id}">
            <input type="hidden" name="user_img" value="/img/face.jpg">
            	<div class="border border-tertiary w-100 p-5 rounded shadow">
				<h2>
					<input type="text" placeholder="이력서 제목을 입력하세요" style="width: 700px"
						class="hs_input_title" name="re_title" >
				</h2>
				<hr>
				<div class="container" style="width: 85%;">
					<div class="content-center">

						<div class="jh_resume_flexbox mt-3">
							<img src="/img/face.jpg" id="imagePreview"
								style="width: 200px; height: 250px;"
								class="mb-2 border border-tertiary" name="user_img">
							<div class="jh_resume_personal_info">
								<div class="input-group mb-3">
									<span
										class="input-group-text w-25 justify-content-center init_color hs_span">이름</span>
									<input type="text" class="form-control" style="width: 120px;"
										value="${vo.user_name}" readonly>
								</div>

								<div class="input-group mb-3">
									<span class="input-group-text w-25 justify-content-center init_color hs_span">생년월일 </span>
									<input type="text" class="form-control" style="width: 120px;"
										value="${vo.user_date}" readonly>
								</div>
																<div class="input-group mb-3">
									<span class="input-group-text w-25 justify-content-center init_color hs_span">주소</span>
									<input type="text" class="form-control" style="width: 120px;"
										value="${vo.user_adr}" readonly>
								</div>
								

								<div class="input-group mb-3">
									<span class="input-group-text w-25 justify-content-center init_color hs_span">연락처</span>
									<input type="tel" class="form-control"
										value="${vo.user_tell}"  readonly>
								</div>

								<div class="input-group mb-3">

									<span
										class="input-group-text w-25 justify-content-center init_color hs_span">이메일</span>
									<input type="text" class="form-control"
										value="${vo.user_id}" readonly>
								</div>
							</div>
						</div>
					</div>
				<div class="container" style="width: 85%;">
					<div class="row justify-content-center">
						<div class="col-md-14 mx-auto">
								<span>분야 &ensp;&ensp; </span> <select name="skill">
								<option value="JavaScript">JavaScript</option>
								<option value="TypeScript">TypeScript</option>
								<option value="Java">Java</option>
								<option value="Python">Python</option>
								<option value="C#">C#</option>
								<option value="Kotlin">Vue.js</option>
								<option value="MySQL">MySQL</option>
								<option value="MongoDB">MongoDB</option>
								<option value="GitHub">GitHub</option>
								<option value="Swift">Swift</option>
								<option value="Django">Django</option>
							</select>
							<span>&ensp;&ensp;</span>
							 <span>경력 &nbsp | &nbsp </span> <select name="career">
								<option value="신입">신입</option>
								<option value="경력">경력</option>
							</select>
								<span>&ensp;&ensp;</span>
							 <span>근무지 &nbsp | &nbsp </span> <select name="region">
								<option value="서울">서울</option>
								<option value="부산">부산</option>
								<option value="대구">대구</option>
								<option value="인천">인천</option>
								<option value="광주">광주</option>
								<option value="대전">대전</option>
								<option value="울산">울산</option>
								<option value="강원도">강원도</option>
								<option value="세종">세종</option>
								<option value="제주">제주</option>
							</select>
							<div class="mt-5">
								<h4>학력</h4>
								<input type="text" class="form-control mt-2" id="floatingInput"
									placeholder="학력을 입력하세요" name="user_edu"
									style="display: block;" required>
							<br>
							<div class="mt-5">
								<h4>경력</h4>
								<input type="text" class="form-control mt-2" id="floatingInput"
									placeholder="제목을 입력하세요" name="user_car" required>
							</div>
							<br>
							<div>
								<h4>자기소개</h4>
								<textarea name="user_intro" class="w-100 opacity-50" rows="10"
									placeholder="내용을 입력하세요"></textarea>
							</div>
							<button type="submit" class="btn btn-primary" onclick="showAlert()" >저장</button>
							<button type="submit" class="btn btn-primary" onclick="location.href=`/Users/ResumeForm?user_id=${ sessionScope.plogin.user_id }`">취소</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script>
	  function showAlert() {
	    alert("이력서가 등록되었습니다");
	  }
	</script>
</body>
</html>