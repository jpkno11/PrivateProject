<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 CDN 링크 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
<style>

   /* 사이드바 */
    .sidenav {
      background-color: #f1f1f1;
      position: fixed;
      width: 200px;
      height: 100%;
      margin-left: -20px;
      margin-top:50px
    }
    /* 본문 */
    .page {
     margin-top:50px;
     margin-left: 250px;
    }
/* 전체 페이지에 대한 기본 스타일 */
body {
    font-family: 'Noto Sans', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f8f9fa;
}

/* 이력서 관리 섹션 스타일 */
.mx-2 {
    margin-left: 2rem;
    margin-right: 2rem;
}

.pb-4 {
    padding-bottom: 4rem;
}

.w-100 {
    width: 100%;
}

.border {
    border: 1px solid #808080;
    width: 600px; /* 너비 */
  	height: 500px; /* 높이 */
    border-radius: 5px; /* 모서리 둥글기 */
}
.container {
  display: flex;
  justify-content: center; /* 수평 중앙 정렬 */
  align-items: center; /* 수직 중앙 정렬 */
  height: 100vh; /* 부모 요소의 높이를 브라우저 창의 높이와 동일하게 설정 */
}


.border-tertiary {
    border-color: #6c757d; /* 삼차 색상 */
}

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

  <%@include file="/WEB-INF/views/include/pheader.jsp" %>
  
  <!-- 사이드 바 -->
  <nav class="col-sm-3 sidenav">
      <h4> 개인정보</h4>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="/Users/Info?user_id=${ sessionScope.plogin.user_id }">개인정보</a></li>
        <li><a href="/Users/ResumeForm?user_id=${ sessionScope.plogin.user_id }">이력서 관리</a></li>
        <li><a href="#">입사지원 관리</a></li>
        <li><a href="#">스크랩</a></li>
      </ul>
    </nav>

  <!-- 페이지 내용 -->
            <div class="container">
                <div class="border border-tertiary p-5 rounded shadow">
                    <div>
                        <h1>이력서 관리</h1>
                    </div>
                    <hr>

                    <div class="jh_resume mt-5">
                        <button class="jh_resume_button mb-5 rounded jm_card"
                            onclick="location.href=`/Users/ResumeMake?user_id=${ sessionScope.pLogin.user_id }`">➕ 새 이력서 등록</button>
                        <c:forEach items="${resumeList}" var="Re">

                            <div id="resume_del" class="jh_resume_content mt-2 mb-2"
                                style="display: flex; justify-content: space-between">
                                <div class="d-flex align-items-center">
                                    <a href="/Users/ResumeDetail?re_num=${Re.re_num}&user_id=${ sessionScope.pLogin.user_id }"> ${Re.user_title} </a>
                                </div>
                                <div>
                                   <c:choose>
                                        <c:when test="${resume.publish == true}">
                                            <button type="button" class="btn btn-success">공개중</button>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="button" class="btn btn-warning">비공개중</button>
                                        </c:otherwise>
                                    </c:choose>
      							 <form action="/Users/DeleteResume?re_num=${Re.re_num}&user_id=${ sessionScope.login.user_id }"
       							 id="delete_resume_${status.count}"  method="POST"> 
       							<button type="submit" class="btn btn-dark" id="delete_resume_${status.count}"> 삭제
       					</button>
       				</form>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
    <!-- 내용 추가 -->


</body>
</html>