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
			<a href="/Company/CInfo?com_id=${ sessionScope.clogin.com_id }" class="list-group-item   shadow" style="width: 150px;">회사정보</a>
			<a href="/Company/PostForm?com_id=${ sessionScope.clogin.com_id }" class="list-group-item hs_list_effect shadow">공고관리</a>
			<a href="/Company/SupportedList?com_id=${ sessionScope.clogin.com_id }" class="list-group-item shadow">받은 이력서 관리</a>
			<a href="#"class="list-group-item shadow">스크랩</a>
		</div>
	<!-- 페이지 내용 -->

	<div class=" mx-2 pb-4 w-100">
		<div class=" border border-tertiary p-5 rounded shadow">
			<div class="col-sm-9 page">
				<div class="d-flex justify-content-center">
					<img src="/img/post1.png" id="imagePreview"
						class="mb-2 border border-tertiary"
						style="width: 100px; height: 100px;">

					<form action="/Company/CInfoUpdate">

						<div class="input-group mb-3">
							<span
								class="input-group-text justify-content-center hs_span_size init_color hs_span">이메일</span>
							<input type="email" class="form-control" name="com_id"
								value="${vo.com_id}" readonly>
						</div>

						<div class="input-group mb-3">
							<span
								class="input-group-text justify-content-center hs_span_size init_color hs_span">비밀번호</span>
							<input type="password" class="form-control" name="com_pw"
								value="${vo.com_pw}">
						</div>

						<div class="input-group mb-3">
							<span
								class="input-group-text justify-content-center hs_span_size init_color hs_span">회사명</span>
							<input type="text" class="form-control" name="com_name"
								value="${vo.com_name }">
						</div>

						<div class="input-group mb-3">
							<span
								class="input-group-text justify-content-center hs_span_size init_color hs_span">사업자등록증</span>
							<input type="text" class="form-control" name="com_num"
								value="${vo.com_num }">
						</div>

						<div class="input-group mb-3">
							<span
								class="input-group-text justify-content-center hs_span_size init_color hs_span">대표자명</span>
							<input type="text" class="form-control" name="com_boss"
								value="${ vo.com_boss }" readonly>
						</div>

						<div class="input-group mb-3">
							<span
								class="input-group-text justify-content-center hs_span_size init_color hs_span">회사주소</span>
							<input type="text" class="form-control" name="com_adr"
								value="${vo.com_adr}">
						</div>

						<div class="input-group mb-3">
							<span
								class="input-group-text justify-content-center hs_span_size init_color hs_span">전화번호</span>
							<input type="text" class="form-control" name="com_tell"
								value="${ vo.com_tell }">
						</div>

						<input type="hidden" name="com_date">

						<div class="d-flex justify-content-between">
							<button type="submit" class="btn btn-dark"
								style="width: 100px; height: 40px; margin-right: 5px;">수정완료
							</button>

							<button type="button" class="btn btn-dark"
								style="width: 100px; height: 40px;"
								onClick="location.href='/Company/CInfo?com_id=${ sessionScope.clogin.com_id}'">취소</button>
							<!-- 회원탈퇴 페이지 만들고 연결 -->
						</div>
					</form>


					<!-- 회원탈퇴 페이지 만들고 연결 -->
				</div>
			</div>
		</div>
	</div>

</body>


</html>