<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jik Job</title>

<style>


</style>
	<%@include file="/WEB-INF/views/include/cheader.jsp"%>
</head>
<body>

	<!-- 사이드 바 -->
	<div class="container d-flex">
		<div class="list-group mx-2">
			<a href="/Company/CInfo?com_id=${ sessionScope.clogin.com_id }"
				class="list-group-item   shadow" style="width: 150px;">회사정보</a> <a
				href="/Company/PostForm?com_id=${ sessionScope.clogin.com_id }"
				class="list-group-item hs_list_effect shadow">공고관리</a> <a
				href="/Company/SupportedList?com_id=${ sessionScope.clogin.com_id }"
				class="list-group-item shadow">받은 이력서 관리</a> <a href="#"
				class="list-group-item shadow">스크랩</a>
		</div>
		<!-- 페이지 내용 -->
		<div class=" mx-2 pb-4 w-100">
			<div class="border border-tertiary  p-5 rounded shadow">
				<div class="d-flex justify-content-between">
					<h1>지원한 이력서</h1>
				</div>
				<hr>
				<div class="container mb-5 mt-5 w-100">
					<table class="table table-hover">
						<tr class=" table-dark">
							<th class="col-1 text-center">공고번호</th>
							<th class="col-3 text-center">공고제목</th>
							<th class="col-4 text-center">이력서 제목</th>
							<th class="col-2.5 text-center">유저아이디</th>
							<th class="col-2 text-center">결과</th>
						</tr>
							<c:forEach var="item" items="${applyedList}">

							<tr>
								<td>${item.po_num }</td>
								<td class="text-center">&nbsp &nbsp <a href="#"
									style="text-decoration: none;">${item.po_title }</a></td>
								<td class="text-center">&nbsp &nbsp <a href="#"
									style="text-decoration: none;">${item.re_title }</a></td>
								<td class="text-center">${item.user_id }</td>
								<td class="btn-center">
								<c:choose>
										<c:when test="${item.result == 0}">
											<button type="button" class="btn btn-danger">대기</button>
										</c:when>
										<c:when test="${item.result == 1}">
											<button type="button" class="btn btn-danger">불합격</button>
										</c:when>
										<c:when test="${item.result == 2}">
											<button type="button" class="btn btn-info">합격</button>
										</c:when>
									</c:choose></td>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>