<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jik Job</title>
<!-- 부트스트랩 CDN 링크 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
<style>

    /* 본문 */
    .page {
     margin-top:50px;
     margin-left: 250px;
    }
   /* 마이페이지*/
   .form-floating {
      
      margin : 0 auto;
      padding-top : 20px;
      width : 50%;
      font-size: 15px;
      
   }
   .btn {
   padding : 15px;
   cursor: pointer;
   margin: 20px;
   
   
   }
   .flex-container{
   display: flex;
   justify-content:center;
   padding : 20px;
   }

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
			href=""
			class="list-group-item shadow">스크랩</a>
	</div>
</div>
	<!-- 페이지 내용 -->
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			<div class="col-sm-9 page">

				<div class="jh_resume_flexbox mt-3">
					<img src="/img/face.jpg" id="imagePreview"
						style="width: 200px; height: 250px; display: flex; justify-content: center; align-items: center; margin-left: auto; margin-right: auto;"
						class="mb-2 border border-tertiary">

					<div class="form-floating mb-3">
						<label for="floatingInput">이름</label> <input type="text"
							class="form-control" id="floatingInput" value="${vo.user_name }"
							readonly>
					</div>
					<div class="form-floating mb-3">
						<label for="floatingInput">이메일</label> <input type="email"
							class="form-control" id="floatingInput"
							value="${ sessionScope.plogin.user_id }" readonly>
					</div>
					<div class="form-floating mb-3">
						<label for="floatingInput">전화번호</label> <input type="text"
							class="form-control" id="floatingInput" value="${vo.user_tell }"
							readonly>
					</div>
					<div class="form-floating mb-3">
						<label for="floatingInput">주소</label> <input type="text"
							class="form-control" id="floatingInput" value="${vo.user_adr }"
							readonly>
					</div>
					<div class="form-floating mb-3">
						<label for="floatingInput">생년월일</label> <input type="text"
							class="form-control" id="floatingInput" value="${vo.user_birth }"
							readonly>
					</div>

					<div class="flex-container">
						<button type="button" class="btn"
							style="background-color: #5215a6; color: white; border: white;">수정</button>
						<!-- 수정 페이지 만들고 연결 -->
						<button type="button" class="btn"
							style="background-color: #5215a6; color: white; border: white;"
							onClick="location.href='/Users/Info?user_id=${ sessionScope.login.user_id}class'">회원탈퇴</button>
						<!-- 회원탈퇴 페이지 만들고 연결 -->
					</div>
				</div>
			</div>
		</main>
</body>
</html>