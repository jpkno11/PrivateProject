<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jik Job</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>
	

.p-5 {
    padding: 3rem;
}

.rounded {
    border-radius: 0.25rem;
}

.shadow {
    box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
}

hr {
    margin-top: 1rem;
    margin-bottom: 1rem;
    border: 0;
    border-top: 1px solid rgba(0, 0, 0, 0.1);
}

.jh_resume_button {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 0.5rem 1rem;
    cursor: pointer;
}

.jh_resume_button:hover {
    background-color: #0056b3;
}

.jh_resume_content {
    padding: 1rem;
    background-color: white;
    border: 1px solid #dee2e6;
    border-radius: 0.25rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.btn {
    padding: 0.375rem 0.75rem;
    border-radius: 0.25rem;
    cursor: pointer;
    font-size: 0.875rem;
    line-height: 1.5;
    border: 1px solid transparent;
}

.btn-success {
    color: #fff;
    background-color: #28a745;
    border-color: #28a745;
}

.btn-warning {
    color: #212529;
    background-color: #ffc107;
    border-color: #ffc107;
}

.btn-dark {
    color: #fff;
    background-color: #343a40;
    border-color: #343a40;
}

</style>


</head>
<body>

  <%@include file="/WEB-INF/views/include/cheader.jsp" %>
  
  <!-- 사이드 바 -->
	<div class="container d-flex">
		<div class="list-group mx-2">
			<a href="/Company/Info?com_id=${ sessionScope.clogin.com_id }"
				class="list-group-item   shadow" style="width: 150px;">회사정보</a> <a
				href="/Company/PostForm?com_id=${ sessionScope.clogin.com_id }"
				class="list-group-item hs_list_effect shadow">공고 관리</a> <a href="#"
				class="list-group-item shadow">받은 이력서</a> <a href=""
				class="list-group-item shadow">스크랩</a>
		</div>

		<!-- 페이지 내용 -->
		<div class=" mx-2 pb-4 w-100">
			<div class="border border-tertiary  p-5 rounded shadow">
				<h1 class="mb-4">등록한 공고</h1>
				<hr>
				<div class="jh_resume mt-5">
					<button class="jh_resume_button mb-5 rounded  jm_card"
						onclick="location.href=`/Company/PostMake?com_id=${ sessionScope.clogin.com_id}`">
						➕ 새로운 공고 등록</button>

					<c:forEach items="${postList}" var="Po">
						<div class="jh_resume_content mb-3"
							style="display: flex; justify-content: space-between">

							<div class="postList_st" style="">
								<a
									href="/Company/PostDetail?po_num=${Po.po_num}&com_id=${ sessionScope.clogin.com_id }">
									${Po.po_title} </a>
							</div>

							<form
								action="/Company/PostDelete?po_num=${Po.po_num}&com_id=${ sessionScope.clogin.com_id }"
								id="delete_button_${status.count}" method="POST">
								<div style="display: flex;">
									<button type="submit" form="delete_button_${status.count}"
										class="btn btn-dark">삭제</button>
								</div>
							</form>

						</div>
					</c:forEach>

					<input type="hidden" value="${size}" id="postSize" />
				</div>
			</div>
		</div>
	</div>
	<!-- 내용 추가 -->


</body>
</html>