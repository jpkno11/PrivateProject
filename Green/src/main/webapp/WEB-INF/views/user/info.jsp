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
						<form>
							<div class="input-group mb-3">
								<span
									class="input-group-text justify-content-center hs_span_size init_color hs_span">이름</span>
								<input type="text" class="form-control" value="${vo.user_name }"
									readonly>
							</div>

							<div class="input-group mb-3">
								<span
									class="input-group-text justify-content-center hs_span_size init_color hs_span">아이디</span>
								<input type="text" class="form-control"
									value="${ sessionScope.plogin.user_id }" readonly>
							</div>
							<div class="input-group mb-3">
								<span
									class="input-group-text justify-content-center hs_span_size init_color hs_span">전화번호</span>
								<input type="email" class="form-control"
									value="${vo.user_tell }" readonly>
							</div>
							<div class="input-group mb-3">
								<span
									class="input-group-text justify-content-center hs_span_size init_color hs_span">주소</span>
								<input type="email" class="form-control" value="${vo.user_adr }"
									readonly>
							</div>
							<div class="input-group mb-3">
								<span
									class="input-group-text justify-content-center hs_span_size init_color hs_span">생년월일</span>
								<input type="email" class="form-control"
									value="${vo.user_birth }" readonly>
							</div>
                        <!-- 수정하기와 회원탈퇴 버튼을 담을 div -->
                        <div class="d-flex justify-content-between">
                            <!-- 수정하기 버튼 -->
                            <button type="button" class="btn btn-dark" style="width: 100px; height: 40px; margin-right: 10px;"
                                    onclick="location.href='/Users/Infoedit?user_id=${ sessionScope.plogin.user_id }'">수정하기
                            </button>
                            </form>
                            <!-- 회원탈퇴 버튼 -->
                            <form action="/Users/InfoDelete?user_id=${ sessionScope.plogin.user_id }" id="deleteUserBtn" method="POST">
                                <button type="submit" class="btn btn-dark" style="width: 100px; height: 40px;">회원탈퇴</button>
					
						<!-- 회원탈퇴 페이지 만들고 연결 -->
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script>
document.getElementById('deleteUserBtn').addEventListener('submit', function(event) {
    var result = confirm('정말로 탈퇴하시겠습니까?');
    if (!result) {
        // 사용자가 "취소"를 눌렀을 때 실행될 코드
        // 폼의 제출을 막습니다.
        event.preventDefault();
    }
});
</script>

</html>