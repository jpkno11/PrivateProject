<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<%@include file="/WEB-INF/views/include/pheader.jsp"%>

	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">

				<form action="/PWrite" method="POST">

					<div class="membertab">
						<a href="/PWriteForm" type="button" role="tab" class="btn btn-info">개인회원</a>
						<a href="/CWriteForm" type="button" role="tab" class="btn btn-light">기업회원</a>
					</div>

					<div class="form-group">
						<label for="user_id">아이디</label>
						<input type="text" class="form-control" name="user_id" id = "user_id" placeholder="아이디를 입력하세요">
					</div>
					 <button type="button" class="btn btn-primary btn-block" id="Check">중복확인 <i class="fas fa-user-plus"></i></button>
					<div class="form-group">
						<label for="user_name">이름</label>
						<input type="text" class="form-control" name="user_name" placeholder="이름을 입력하세요">
					</div>

					<div class="form-group">
						<label for="user_pw">비밀번호</label>
						<input type="password" class="form-control" name="user_pw" placeholder="비밀번호를 입력하세요">
					</div>

					<div class="form-group">
						<label for="confirm_user_pw">비밀번호 확인</label>
						<input type="password" class="form-control" name="confirm_user_pw" placeholder="비밀번호를 다시 입력하세요">
					</div>

					<div class="form-group">
						<label for="user_tell">전화번호</label>
						<input type="tel" class="form-control" name="user_tell" placeholder="전화번호를 입력하세요">
					</div>

					<div class="form-group">
						<label for="com_adr">주소</label>
						<div class="input-group">
							<input type="text" class="form-control" id="user_adr"
								name="user_adr" placeholder="회사주소를 입력하세요">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button"
									id="searchAdr">주소 검색</button>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="user_birth">생년월일</label>
						<input type="date" class="form-control" name="user_birth" placeholder="생년월일을 입력하세요">
					</div>

					<div style="display: flex;">
					  <button type="submit" class="btn btn-primary btn-block" id="join">가입하기 <i class="fas fa-user-plus"></i></button>
					  <button type="button" class="btn btn-secondary btn-block" id="cancel">취소 <i class="fas fa-user-plus"></i></button>
					</div>

				</form>

			</div>
		</div>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const checkButton = document.getElementById('Check');
        checkButton.addEventListener('click', function(event) {
            event.preventDefault();
            check_id();
        });
    });
    function check_id() {
        const userId = document.getElementById('user_id').value;
        if (userId === "") {
            alert('아이디를 입력해주세요.');
            return;
        }
        const url = '/CheckUserId';
        const params = {
            method: 'POST',
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ user_id : userId })
        };
        fetch(url, params)
            .then(response => response.json())
            .then(data => {
                if(data == 0) { 
                    alert('사용 가능한 아이디입니다.');
                } else {
                    alert('이미 사용 중인 아이디입니다.');
                }
            })
            .catch(error => console.error('Error:', error));
    }
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	
	  // 취소 버튼
	  const cancelEl = document.getElementById('cancel');
	  cancelEl.addEventListener( 'click', function() {
		  location.href = '/LoginForm';
		  alert('가입이 취소되었습니다. 로그인창으로 이동합니다.');
	  })
	
	  
	  // 주소 api
	  
	      document.getElementById('searchAdr').addEventListener('click', function() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 주소 선택 후 처리할 코드
                // 예: document.getElementById('com_adr').value = data.address; // 사용자가 선택한 주소를 'com_adr' 필드에 입력
            	document.getElementById('user_adr').value = data.address;
            }
        }).open();
    });

	
	  
	</script>
</body>
</html>