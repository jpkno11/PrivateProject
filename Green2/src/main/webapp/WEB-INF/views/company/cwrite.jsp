<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jik Job</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	rel="stylesheet">

<style>
  /* 추가적인 스타일링 */
  .form-control {
    border-radius: 30px; /* 입력 필드의 모서리를 둥글게 */
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
  }

  .btn-block {
    width: 50%;
    background: linear-gradient(to right, #4facfe, #00f2fe);
	/* 라디언트 그라데이션 */
    border: none;
    border-radius: 30px;
    padding: 10px 25px;
  }
  
  .container.mt-5 {
    height: 100vh;
  }
  
  .membertab {
    display: flex;
    justify-content: center;
    align-items: center;
  }
  
</style>

</head>
<body>

    <%@include file="/WEB-INF/views/include/pheader.jsp" %>
    
    <div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">

				<form action="/CWrite" method="POST">

					<div class="membertab">
						<a href="/PWriteForm" type="button" role="tab" class="btn btn-light">개인회원</a>
						<a href="/CWriteForm" type="button" role="tab" class="btn btn-info">기업회원</a>
					</div>

					<div class="form-group">
						<label for="com_id">아이디</label>
						<input type="text" class="form-control" name="com_id" placeholder="아이디를 입력하세요">
					</div>

					<div class="form-group">
						<label for="com_pw">비밀번호</label>
						<input type="password" class="form-control" name="com_pw" placeholder="비밀번호를 입력하세요">
					</div>

					<div class="form-group">
						<label for="confirm_com_pw">비밀번호 확인</label>
						<input type="password" class="form-control" name="confirm_com_pw" placeholder="비밀번호를 다시 입력하세요">
					</div>
					
					<div class="form-group">
						<label for="com_name">회사명</label>
						<input type="text" class="form-control" name="com_name" placeholder="회사이름을 입력하세요">
					</div>

					<div class="form-group">
						<label for="com_num">사업장등록증</label>
						<input type="text" class="form-control" name="com_num" placeholder="전화번호를 입력하세요">
					</div>
					
					<div class="form-group">
						<label for="com_boss">대표자명</label>
						<input type="text" class="form-control" name="com_boss" placeholder="대표자 이름을 입력하세요">
					</div>

					<div class="form-group">
						<label for="com_adr">주소</label>
						<input type="text" class="form-control" name="com_adr" placeholder="회사주소를 입력하세요">
					</div>

					<div class="form-group">
						<label for="com_tell">전화번호</label>
						<input type="tel" class="form-control" name="com_tell" placeholder="전화번호를 입력하세요">
					</div>

					<div style="display: flex;">
					  <button type="submit" class="btn btn-primary btn-block" id="join">가입하기 <i class="fas fa-user-plus"></i></button>
					  <button type="button" class="btn btn-secondary btn-block" id="cancel">취소 <i class="fas fa-user-plus"></i></button>
					</div>

				</form>

			</div>
		</div>
	</div>

	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	
	<script>
	
	  // 취소 버튼
	  const cancelEl = document.getElementById('cancel');
	  cancelEl.addEventListener( 'click', function() {
		  location.href = '/LoginForm';
		  alert('가입이 취소되었습니다. 로그인창으로 이동합니다.');
	  })
	
	</script>
	
</body>
</html>