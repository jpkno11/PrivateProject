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
body {
	/* background-color: #f4f4f4; */
	margin: 0;
}

.job-listings {
	max-width: 1000px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f4f4f4;
}

a {
	color: #0073e6;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

.bookmarkBtn {
	border: none;
	cursor: pointer;
}

.bookmarkBtn:hover {
	background-color: #005bb5;
}
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

						<div>
							<table>
								<thead>
									<tr>
										<th>No.</th>
										<th>기업명</th>
										<th>공고제목</th>
										<th>근무조건</th>
										<th>북마크</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${postbookList}" var="post">
										<tr>
											<td>${post.po_num}</td>
											<td>${post.com_name}</td>
											<td><a
												href="/Post/View?po_num=${post.po_num}&user_id=${sessionScope.plogin.user_id}">
													${post.po_title} </a></td>
											<td>${post.po_qual}</td>
											<td>
												<div class="scrapBtn">
													<button class="bookmarkBtn">
													<!-- <img src="/img/filled_bookmarks.png" class="mb-2 border border-tertiary"
													     id="bookmarkImg" style="width: 30px; height: 30px;"> -->
													<img src="/img/filled_bookmarks.png" class="mb-2 border border-tertiary bookmarkImg"
													     style="width: 30px; height: 30px;">
													</button>
													<input type="hidden" id="po_num" value="${ post.po_num }" />
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					<input type="hidden" id="user_id" value="${ sessionScope.plogin.user_id }" />
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>

	$(document).ready(function() {
	
	const user_id = $('#user_id').val();
	const po_num = $('#po_num').val();
	console.log(user_id)
	console.log(po_num)
	
	function loadUserBookInfo(user_id, po_num) {
		
		$.ajax( {
			type : 'GET',
			url  : '/checkUserBook',
			data : {
				user_id : user_id,
				po_num  : po_num
			},
			success : function(data) {
				console.log(data);
			},
			error : function(xhr, status, error) {
				console.error(error);
			}
		});
		
	}
	
	loadUserBookInfo(user_id, po_num);

	//-----------------------------------------------------------------
	//const scrapBtnEl = document.querySelector('.bookmarkImg');
	// 이유는 모르겠는데 scrapBtnEl.addEventListener 안먹음
	
	$('.bookmarkImg').click(function() {

        $.ajax({
            type: 'POST',
            url: '/removeBookmark',
            data: {
                user_id: user_id,
                po_num: po_num
            },
            success: function(data) {
                alert('스크랩 해제되었습니다');
                loadUserBookInfo(user_id, po_num);
                location.reload(); // 페이지 새로고침
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    });
  });
	
</script>

</html>