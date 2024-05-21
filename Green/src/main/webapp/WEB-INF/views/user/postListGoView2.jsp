<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고 화면</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>

body {
    background-color: #f9f9f9;
    margin: 0;
    padding: 0;
}

.job-details-container {
    width: 80%;
    max-width: 700px;
    margin: 50px auto;
    background: #fff;
    border-radius: 15px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    overflow: hidden;
}

.job-header {
	position: relative;
    text-align: center;
    background-color: #f4f4f4;
    padding: 20px;
    border-bottom: 2px solid #4f4f4f;
}

.scrap-button {
    position: absolute;
    top: 20px;
    right: 20px;
    color: #fff;
    border: none;
    padding: 10px 20px;
    font-size: 14px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}
/*
.scrap-button:hover {
    background-color: #ff4d4d;
}
*/
.company-logo {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    border: 2px solid #f4f4f4;
    margin-bottom: 10px;
}

.job-title {
    font-size: 24px;
    color: #000088;
    margin: 10px 0;
}

.company-name {
    font-size: 18px;
    color: #000088;
}

.job-content {
    padding: 20px;
}

.job-content h2 {
    font-size: 20px;
    color: #000088;
    margin-bottom: 10px;
}

.job-content p, .job-content ul {
    font-size: 16px;
    color: #666;
    line-height: 1.6;
}

.job-content ul {
    list-style-type: disc;
    margin: 0;
    padding-left: 20px;
}

#apply-btn {
    /* display: block; */
    margin-left: 5%;
    width: 40%;
    background-color: #9966ff;
    color: #fff;
    border: none;
    padding: 15px;
    font-size: 18px;
    cursor: pointer;
    border-radius: 15px;
    transition: background-color 0.3s ease;
}

#apply-btn:hover {
    background-color: #ff4d4d;
}

</style>

</head>

<body>

	<%@include file="/WEB-INF/views/include/pheader.jsp"%>

	<main>

		<section>

			<article>

				<form action="/Post/GoApply?po_num=${po_num}&user_id=${ sessionScope.plogin.user_id }" method="POST">
					<input type="hidden" id="po_num" name="po_num" value="${ po_num }" />
					<input type="hidden" id="user_id" name="user_id"
						value="${ sessionScope.plogin.user_id }" />
					<input type="hidden" id="com_id" name="com_id" value="${ com_id }" />
					

					<c:forEach var="post" items="${postList}">
					
						<div class="job-details-container">
					        <div class="job-header">
					            <img src="/img/Rogo.png" alt="Company Logo" class="company-logo">
					            <div class="header-content">
					                <h1 class="job-title">${ post.po_title }</h1>
					                <p class="company-name">${ post.com_name }</p>
					            </div>
					            <div id="scrapBtn" class="scrap-button"></div>
					        </div>
					        <div class="job-content">
					            <h2>근무내용</h2>
					            <p>${ post.po_content }</p>
					
					            <h2>고용형태</h2>
					            <ul>
					                <li>${ post.po_qual }</li>
					            </ul>
					
					            <h2>Requirements</h2>
					            <ul>
					                <li>${ post.skill }</li>
					            </ul>
					
					            <h2>Location</h2>
					            <p>${ post.region }</p>
					
					            <!-- <button id="apply-btn">Apply Now</button> -->
					            <input type="submit" id="apply-btn" class="btn btn-primary" value="지원하기">&nbsp;&nbsp;
							<a href="/BoardPaging/List?user_id=${sessionScope.plogin.user_id  }&nowpage=1"
							   id="apply-btn" class="btn btn-primary">목록으로</a>&nbsp;&nbsp;
							   <input type="hidden" id="po_title" name="po_title" value="${ post.po_title }" />
					        </div>
					    </div>

					</c:forEach>


				</form>

			</article>

		</section>

	</main>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script>
		$(document).ready(function() {
			// 페이지 로딩
		});

		const user_id = $('#user_id').val();
		const po_num = $('#po_num').val();

		function loadUserBookInfo(user_id, po_num) {
			
			const button = $('.scrap-button');
			console.dir(button);
			
			$.ajax({
				type : 'GET',
				url : '/checkUserBook', // 요청을 처리할 서버의 URL
				data : {
					user_id : user_id,
					po_num : po_num
				},
				success: function(data) {
		            // 성공적으로 데이터를 받았을 때 처리할 내용
		            console.log(data);
		            const scrapBtnEl = document.querySelector('#scrapBtn')
		            console.log(scrapBtnEl)
		            if (data.length > 0) {
		            	//scrapBtnEl.innerHTML = '<input class="btn scrap-button btn-outline-secondary" type="button" value="스크랩 해제">'
		            	scrapBtnEl.innerHTML = '<img src="/img/filled_bookmarks.png" class="mb-2 border border-tertiary bookmarkImg" style="width: 30px; height: 30px;">'
		            } else {
		            	//scrapBtnEl.innerHTML = '<input class="btn scrap-button btn-primary" type="button" value="스크랩 하기">'
		            	scrapBtnEl.innerHTML = '<img src="/img/emptied_bookmarks.png" class="mb-2 border border-tertiary bookmarkImg" style="width: 30px; height: 30px;">'
		            }
		        },
				error : function(xhr, status, error) {
					// 데이터 요청이 실패했을 때 처리할 내용
					console.error(error);
				}
			});
		}

		// 스크랩 버튼 갱신 (꼭 있어야 함)
		loadUserBookInfo(user_id, po_num);
		
		//---------------------------------------------------------------------------------------------------------------
		
		// 스크랩 버튼 클릭 시
		$('#scrapBtn').on('click', 'img', function() {
			
		    const user_id = $('#user_id').val();
		    const po_num = $('#po_num').val();
		    //const isScraped = $(this).hasClass('btn-primary'); // 스크랩 상태 확인
		    
		    const imgSrc = $(this).attr('src');
			const isScraped = imgSrc.includes('emptied_bookmarks.png');
            console.log(imgSrc)
            console.log(isScraped)

		    // Ajax 요청 보내기
		    $.ajax({
		        type: 'POST',
		        url: isScraped ? '/addBookmark' : '/removeBookmark', // 스크랩 상태에 따라 요청 URL 선택
		        data: {
		            user_id: user_id,
		            po_num: po_num
		        },
		        success: function(data) {
		            // 성공적으로 데이터를 받았을 때 처리할 내용
		            console.log(data);

		            // 스크랩 상태 업데이트
		            if (isScraped) {
		                // 스크랩 해제 버튼인 경우
		                alert('스크랩 되었습니다')
		                //$('#scrapBtn').html('<input class="btn scrap-button btn-outline-secondary" type="button" value="스크랩 해제">');
		                //$('#scrapBtn').html('<img src="/img/filled_bookmarks.png" class="mb-2 border border-tertiary bookmarkImg" style="width: 30px; height: 30px;">');
		                $('#scrapBtn').innerHTML = '<img src="/img/filled_bookmarks.png" class="mb-2 border border-tertiary bookmarkImg" style="width: 30px; height: 30px;">';
		                loadUserBookInfo(user_id, po_num);
		            } else {
		                // 스크랩 버튼인 경우
		                alert('스크랩 해제되었습니다')
		                //$('#scrapBtn').html('<input class="btn scrap-button btn-primary" type="button" value="스크랩 하기">');
		                //$('#scrapBtn').html('<img src="/img/emptied_bookmarks.png" class="mb-2 border border-tertiary bookmarkImg" style="width: 30px; height: 30px;">');
		                $('#scrapBtn').innerHTML = '<img src="/img/emptied_bookmarks.png" class="mb-2 border border-tertiary bookmarkImg" style="width: 30px; height: 30px;">';
		                loadUserBookInfo(user_id, po_num);
		            }
		        },
		        error: function(xhr, status, error) {
		            // 데이터 요청이 실패했을 때 처리할 내용
		            console.error(error);
		        }
		    });
		});

		
		
		
		
	</script>

</body>
</html>
