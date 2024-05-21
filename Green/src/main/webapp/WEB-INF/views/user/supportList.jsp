<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>

</head>
<body>

	<%@include file="/WEB-INF/views/include/pheader.jsp"%>

	<!-- 사이드 바 -->
	<div class="container d-flex">
		<div class="list-group mx-2">
			<a href="/Users/Info?user_id=${ sessionScope.plogin.user_id }"
				class="list-group-item   shadow" style="width: 150px;">개인정보</a> <a
				href="/Users/ResumeForm?user_id=${ sessionScope.plogin.user_id }"
				class="list-group-item hs_list_effect shadow">이력서 관리</a> <a
				href="/Users/ApplyList?user_id=${ sessionScope.plogin.user_id }"
				class="list-group-item shadow">입사지원 관리</a> <a
				href="/Users/BookmarkList?user_id=${ sessionScope.plogin.user_id }"
				class="list-group-item shadow">스크랩</a>
		</div>

		<!-- 페이지 내용 -->
		<!-- 페이지 내용 -->
		<div class=" mx-2 pb-4 w-100">
			<div class="border border-tertiary  p-5 rounded shadow">
				<div class="d-flex justify-content-between">
					<h1>회원님이 지원하신 기업입니다</h1>
				</div>
				<div class="container mb-5 mt-5 w-100">
					<table class="table table-hover">
						<tr class=" table-dark">
							<th class="col-1 text-center">기업명</th>
							<th class="col-3 text-center">공고제목</th>
							<th class="col-4 text-center">이력서</th>
							<th class="col-2.5 text-center">분야</th>
							<th class="col-2 text-center">결과</th>
						</tr>

							<c:forEach var="item" items="${applyList}">

							<tr>
								<td>${item.com_name}</td>
								<td class="text-center">&nbsp &nbsp <a href="#"
									style="text-decoration: none;">${item.po_title }</a></td>
								<td class="text-center">&nbsp &nbsp <a href="#"
									style="text-decoration: none;">${item.re_title }</a></td>
								<td class="text-center">${item.career }</td>
								<td class="text-center" style="text-align: center;">
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
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
