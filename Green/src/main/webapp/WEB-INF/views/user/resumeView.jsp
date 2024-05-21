<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/pheader.jsp"%>
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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>

	<!-- 이력서 -->
	<div class="resume-container">
		<form action="/Users/UpdateResume" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="user_id"
				value="${sessionScope.plogin.user_id}"> <input type="hidden"
				name="user_img">
			<div class="border border-tertiary w-100 p-5 rounded shadow">
				<h2>
					<input type="text" value="${rvo.re_title }" style="width: 700px"
						class="hs_input_title" name="re_title">
				</h2>
				<hr>
				<div class="container" style="width: 85%;">
					<div class="content-center">

						<div class="jh_resume_flexbox mt-3">
							<img src="${rvo.user_img}" id="imagePreview"
								style="width: 200px; height: 250px;"
								class="mb-2 border border-tertiary">
							<div class="jh_resume_personal_info">
								<div class="input-group mb-3">
									<span
										class="input-group-text w-25 justify-content-center init_color hs_span">회사명</span>
									<input type="text" class="form-control" style="width: 120px;"
										value="${uvo.user_name}" readonly>
								</div>

								<div class="input-group mb-3">
									<span
										class="input-group-text w-25 justify-content-center init_color hs_span">생년월일</span>
									<input type="text" class="form-control" style="width: 120px;"
										value="${uvo.user_date}" readonly>
								</div>
								<div class="input-group mb-3">
									<span
										class="input-group-text w-25 justify-content-center init_color hs_span">주소</span>
									<input type="text" class="form-control" style="width: 120px;"
										value="${uvo.user_adr}" readonly>
								</div>


								<div class="input-group mb-3">
									<span
										class="input-group-text w-25 justify-content-center init_color hs_span">연락처</span>
									<input type="tel" class="form-control" value="${uvo.user_tell}"
										readonly>
								</div>

								<div class="input-group mb-3">

									<span
										class="input-group-text w-25 justify-content-center init_color hs_span">이메일</span>
									<input type="text" class="form-control" value="${uvo.user_id}"
										readonly>
								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="container" style="width: 85%;">
					<div class="row justify-content-center">
						<div class="col-md-14 mx-auto">
							<!-- <input type="file" class="form-control mt-2" name="user_img들어갈곳"
								onchange="chooseImage(this)" /> <br>  -->

							<span>분야 &nbsp | &nbsp </span> <select name="skill">
								<option value="JavaScript"
									<c:if test="${rvo.skill == 'JavaScript'}"> selected</c:if>>JavaScript</option>
								<option value="TypeScript"
									<c:if test="${rvo.skill == 'TypeScript'}"> selected</c:if>>TypeScript</option>
								<option value="Java"
									<c:if test="${rvo.skill == 'Java'}"> selected</c:if>>Java</option>
								<option value="Python"
									<c:if test="${rvo.skill == 'Python'}"> selected</c:if>>Python</option>
								<option value="C#"
									<c:if test="${rvo.skill == 'C#'}"> selected</c:if>>C#</option>
								<option value="Kotlin"
									<c:if test="${rvo.skill == 'Kotlin'}"> selected</c:if>>Kotlin</option>
								<option value="Vue.js"
									<c:if test="${rvo.skill == 'Vue.js'}"> selected</c:if>>Vue.js</option>
								<option value="MySQL"
									<c:if test="${rvo.skill == 'MySQL'}"> selected</c:if>>MySQL</option>
								<option value="MongoDB"
									<c:if test="${rvo.skill == 'MongoDB'}"> selected</c:if>>MongoDB</option>
								<option value="GitHub"
									<c:if test="${rvo.skill == 'GitHub'}"> selected</c:if>>GitHub</option>
								<option value="Swift"
									<c:if test="${rvo.skill == 'Swift'}"> selected</c:if>>Swift</option>
								<option value="Angular"
									<c:if test="${rvo.skill == 'Angular'}"> selected</c:if>>Angular</option>
								<option value="Django"
									<c:if test="${rvo.skill == 'Django'}"> selected</c:if>>Django</option>
							</select> <span>&ensp;&ensp;</span> <span>경력 &nbsp | &nbsp </span> <select
								name="career">
								<option value="신입"
									<c:if test="${rvo.career == '신입'}"> selected</c:if>>신입</option>
								<option value="경력"
									<c:if test="${rvo.career == '경력'}"> selected</c:if>>경력</option>
							</select> <span>&ensp;&ensp;</span> <span>근무지 &nbsp | &nbsp </span> <select
								name="region">
								<option value="서울"
									<c:if test="${rvo.region == '서울'}"> selected</c:if>>서울</option>
								<option value="부산"
									<c:if test="${rvo.region == '부산'}"> selected</c:if>>부산</option>
								<option value="대구"
									<c:if test="${rvo.region == '대구'}"> selected</c:if>>대구</option>
								<option value="인천"
									<c:if test="${rvo.region == '인천'}"> selected</c:if>>인천</option>
								<option value="광주"
									<c:if test="${rvo.region == '광주'}"> selected</c:if>>광주</option>
								<option value="대전"
									<c:if test="${rvo.region == '대전'}"> selected</c:if>>대전</option>
								<option value="울산"
									<c:if test="${rvo.region == '울산'}"> selected</c:if>>울산</option>
								<option value="강원도"
									<c:if test="${rvo.region == '강원도'}"> selected</c:if>>강원도</option>
								<option value="세종"
									<c:if test="${rvo.region == '세종'}"> selected</c:if>>세종</option>
								<option value="제주"
									<c:if test="${rvo.region == '제주'}"> selected</c:if>>제주</option>
							</select>
							<div class="mt-5">
								<h4>학력</h4>
								<input type="text" class="form-control mt-2" id="floatingInput"
									value="${rvo.user_edu}" name="user_edu" style="display: block;"
									required>

								<div class="mt-5">
									<h4>경력</h4>
									<input type="text" class="form-control mt-2" id="floatingInput"
										value="${rvo.user_car}" name="user_car" required>
								</div>
								<br>
								<div>
									<h4>자기소개</h4>
									<textarea name="user_intro" class="w-100 opacity-50" rows="10">${rvo.user_intro}</textarea>
								</div>
								<button type="submit" class="btn btn-primary">저장</button>
								<button type="submit" class="btn btn-primary" onclick="location.href=`/Users/ResumeForm?user_id=${ sessionScope.plogin.user_id }`">취소</button>
							</div>
						</div>
					</div>
				</div>
		</form>
	</div>

</body>
</html>