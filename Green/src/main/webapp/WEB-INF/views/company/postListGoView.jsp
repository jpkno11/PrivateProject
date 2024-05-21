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

#list-btn {
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

#list-btn:hover {
    background-color: #ff4d4d;
}
</style>

</head>

<body>

	<%@include file="/WEB-INF/views/include/cheader.jsp"%>

	<main>

		<section>

			<article>
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
							<a href="/BoardPaging/CList?com_id=${sessionScope.clogin.com_id}&nowpage=1"
							   id="apply-btn" class="btn btn-primary">지원하기</a>&nbsp;&nbsp;
							   <input type="hidden" id="po_title" name="po_title" value="${ post.po_title }" />
							<a href="/BoardPaging/CList?com_id=${sessionScope.clogin.com_id}&nowpage=1"
							   id="list-btn" class="btn btn-primary">목록으로</a>&nbsp;&nbsp;
							   <input type="hidden" id="po_title" name="po_title" value="${ post.po_title }" />
					        </div>
					    </div>

					</c:forEach>



			</article>

		</section>

	</main>
	<script>
// "apply-btn" 아이디를 가진 요소를 찾아서 클릭 이벤트 리스너를 추가합니다.
document.getElementById('apply-btn').addEventListener('click', function(event) {
    alert('기업회원은 지원할수없습니다');

});
</script>
</body>
</html>
