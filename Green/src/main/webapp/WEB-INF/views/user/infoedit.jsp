<%@include file="/WEB-INF/views/include/pheader.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jik Job</title>
<style>
</style>
</head>
<body>
	<!-- 사이드 바 -->
	<div class="container d-flex">
		<div class="list-group mx-2">
			<a href="/Users/Info?user_id=${ sessionScope.plogin.user_id }" class="list-group-item   shadow" style="width: 150px;">개인정보</a>
			<a href="/Users/ResumeForm?user_id=${ sessionScope.plogin.user_id }" class="list-group-item hs_list_effect shadow">이력서 관리</a>
			<a href="/Users/ApplyList?user_id=${ sessionScope.plogin.user_id }" class="list-group-item shadow">입사지원 관리</a>
			<a href="/Users/BookmarkList?user_id=${ sessionScope.plogin.user_id }" class="list-group-item shadow">스크랩</a>
		</div>
		<!-- 페이지 내용 -->

		<div class=" mx-2 pb-4 w-100">
			<div class=" border border-tertiary p-5 rounded shadow">
				<div class="col-sm-9 page">
					<div class="d-flex justify-content-center">
						<img src="/img/face.jpg" id="imagePreview"
							class="mb-2 border border-tertiary"
							style="width: 100px; height: 100px;">

						<form action="/Users/InfoUpdate" method="POST">
							<div class="input-group mb-3">
								<span
									class="input-group-text justify-content-center hs_span_size init_color hs_span">이름</span>
								<input type="text" class="form-control" name="user_name"
									value="${vo.user_name }">
							</div>

							<div class="input-group mb-3">
								<span
									class="input-group-text justify-content-center hs_span_size init_color hs_span">이메일</span>
								<input type="email" class="form-control" name="user_id"
									value="${vo.user_id }" readonly>
							</div>

							<div class="input-group mb-3">
								<span
									class="input-group-text justify-content-center hs_span_size init_color hs_span">비밀번호</span>
								<input type="password" class="form-control" name="user_pw"
									value="${vo.user_pw}">
							</div>

							<div class="input-group mb-3">
								<span
									class="input-group-text justify-content-center hs_span_size init_color hs_span">전화번호</span>
								<input type="text" class="form-control" name="user_tell"
									value="${ vo.user_tell }">
							</div>
							<div class="input-group mb-3">
								<span
									class="input-group-text justify-content-center hs_span_size init_color hs_span">주소</span>
								<input type="text" class="form-control" name="user_adr"
									value="${vo.user_adr }">
							</div>
							<div class="input-group mb-3">
								<span
									class="input-group-text justify-content-center hs_span_size init_color hs_span">생년월일</span>
								<input type="text" class="form-control" name="user_birth"
									value="${vo.user_birth }">
							</div>
							<input type="hidden" name="user_date">

							<div class="d-flex justify-content-between">
								<button type="submit" class="btn btn-dark"
									style="width: 100px; height: 40px; margin-right: 5px;">수정완료
								</button>

								<button type="button" class="btn btn-dark"
									style="width: 100px; height: 40px;"
									onClick="location.href='/Users/Info?user_id=${ sessionScope.plogin.user_id}'">취소</button>
								<!-- 회원탈퇴 페이지 만들고 연결 -->
							</div>
						</form>
					</div>

					<!-- 회원탈퇴 페이지 만들고 연결 -->
				</div>
			</div>
		</div>
	</div>
</body>


</html>