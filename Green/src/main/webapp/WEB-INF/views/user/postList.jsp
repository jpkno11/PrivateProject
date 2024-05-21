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
	background-color: #f4f4f4;
	margin: 0;
}

.post-listings {
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

.post-listings tr td:nth-child(4) {
	width: 400px;
}

/* 모달 스타일 */
.modal {
  position: absolute;
  z-index: 9999;
  left: 0;
  top: 0;
  width: 80%;
  height: 80%;
  background-color: rgba(0, 0, 0, 0.5);
  display: none;
  align-items: center;
  justify-content: center;
  overflow: auto;
}

.modal-content {
  background-color: #fefefe;
  border-radius: 10px;
  margin: 5% auto;
  padding: 20px;
  max-width: 600px;
  width: 90%;
  box-shadow:0 2px 3px 0 rgba(34,36,38,0.15); /* 테두리 그림자 */
  transform:translateY(-50%); /* 모듈창열었을때 위치설정 가운데로 */
  position:absolute;
  top:40%; /* 모달을 화면가운데 놓기위함. */ 
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
  cursor: pointer;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
}

.modal-header {
  display: flex;
  align-items: center;
  margin-bottom: 15px;
}

.company-logo {
  width: 100px;
  height: auto;
  margin-right: 10px;
}

.modal-body p {
  margin-bottom: 10px;
}

.modal-body p strong {
  font-weight: bold;
  margin-right: 5px;
}

/* 모달 내용 간 구분선 */
.modal-body p {
  margin-bottom: 10px;
  border-bottom: 1px solid #ddd; /* 각 내용 사이에 선 추가 */
}

/* 마지막 내용의 선 제거 */
.modal-body p:last-child {
  border-bottom: none; /* 마지막 요소에는 선을 표시하지 않음 */
}

/* 평점 스타일 */
.rating {
  display: inline-block;
}

.rating input {
  display: none;
}

.rating label {
  cursor: pointer;
  width: 30px;
  font-size: 24px;
  color: #ffd700; /* 별 색상 */
}

.rating label:hover,
.rating label:hover ~ label {
  color: #ffcc00; /* 호버 시 색상 변경 */
}

.ratingSubmitBtn {
  background-color: #007bff; /* 제출 버튼 배경색 */
  color: white; /* 제출 버튼 텍스트 색상 */
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  font-size: 16px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}
.ratingSubmitBtn:hover {
  background-color: #0056b3; /* 호버 시 배경색 변경 */
}

/* CSS 파일에 추가 */
/* 별점을 표시하기 위한 스타일 */
.star {
    font-size: 20px;
    color: #ccc;
    cursor: pointer;
}

.star.filled {
    color: gold;
}
  
</style>

</head>

<body>

	<%@include file="/WEB-INF/views/include/pheader.jsp"%>

	<main>

		<section>
			<article>
				<form action="/Post/View?po_num=${ po_num }&user_id=${ user_id }"
					method="post">
					<input type="hidden" name="" />
					<!-- 옵션바 -->

					<div class="select_box jm_select_box mt-5">
						<select id="skill" name="skill" class="jm_select selectpicker"
							data-style="btn-info">
							<option value="none" selected>분야</option>
							<option value="JavaScript">JavaScript</option>
							<option value="TypeScript">TypeScript</option>
							<option value="Java">Java</option>
							<option value="Python">Python</option>
							<option value="C#">C#</option>
							<option value="Kotlin">Vue.js</option>
							<option value="MySQL">MySQL</option>
							<option value="MongoDB">MongoDB</option>
							<option value="GitHub">GitHub</option>
							<option value="Swift">Swift</option>
							<option value="Django">Django</option>
						</select> <select id="career" class="jm_select">
							<option value="none" selected>고용형태</option>
							<option value="신입">신입</option>
							<option value="경력">경력</option>
						</select> <select id="region" class="jm_select">
							<option value="none" selected>근무지</option>
							<option value="서울">서울</option>
							<option value="부산">부산</option>
							<option value="대구">대구</option>
							<option value="인천">인천</option>
							<option value="광주">광주</option>
							<option value="대전">대전</option>
							<option value="울산">울산</option>
							<option value="강원도">강원도</option>
							<option value="세종">세종</option>
							<option value="제주">제주</option>
						</select>
					</div>

	     <h2 style="text-align:center; padding-top: 2%;">공고보기</h2>
		 <hr/>
			
			
		 <div class=" mx-2 pb-4 w-100">
			<div class=" border border-tertiary p-5 rounded shadow">
					<div class="d-flex justify-content-center">

						<div>
							<table class="post-listings">
								<thead>
									<tr>
										<th>No.</th>
										<th>기업명</th>
										<th>평점</th>
										<th>공고제목</th>
										<th>근무조건</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${response.list}" var="post">
										<tr>
											<td>${post.po_num}</td>
											<td>
											  <a href="#"
											     id="comName"
											     onclick="openPopup('${ post.com_name }','${ post.com_num }',
											     '${ post.com_boss }','${ post.com_adr }','${ post.com_tell }',
											     '${ post.com_id }'
											     )">
											  ${post.com_name}
											  </a>
											</td>
											<td>${post.rating}</td>
											<td>
											  <a href="/Post/View?po_num=${ post.po_num }&user_id=${ sessionScope.plogin.user_id }">${ post.po_title }</a>
											</td>
											<td>${ post.po_qual }</td>
										</tr>
							
										<!-- 모달 팝업 -->
										<!-- <div id="popupModal" class="modal"> -->
										<div class="modal">
										  <div class="modal-content">
										    <span class="close" onclick="closePopup()">&times;</span>
										    <div class="modal-header">
											    <img src="/img/Rogo.png" alt="회사 로고" class="company-logo">
											    <h3 id="popupTitle"></h3>
										    </div>
										    <div class="modal-body">
											    <p id="popupContent"></p>
											    <p id="popupComNum"></p>
											    <p id="popupComBoss"></p>
											    <p id="popupComAdr"></p>
											    <p id="popupComTell"></p>
											    <!-- 평점 입력 폼 -->
											      <form id="ratingForm" onsubmit="submitRating(event)">
											        <label for="rating">평점:</label>
											          <!-- <input type="number" id="rating" name="rating" min="1" max="5" required> -->
											          <input type="hidden" id="user_id" name="user_id" value="${ sessionScope.plogin.user_id }" />
											    	  <input type="hidden" id="poNum" value="${ post.po_num }"/>
											    	  
											    	  <div class="ratingStar">
													    <span class="star" data-value="1">&#9733;</span>
													    <span class="star" data-value="2">&#9733;</span>
													    <span class="star" data-value="3">&#9733;</span>
													    <span class="star" data-value="4">&#9733;</span>
													    <span class="star" data-value="5">&#9733;</span>
													    <span>&nbsp;&nbsp;&nbsp;</span>
											        <button type="button" class="ratingSubmitBtn"><i class="fas fa-check"></i> 제출</button>
													</div>
											      

												      <!-- 평점 표시 영역 -->
												      <div class="ratingDisplay"></div>											      
											        
											      </form>
										    </div>
										  </div>
										</div>
							
									</c:forEach>
								<%@include file="/WEB-INF/views/include/userpaging.jsp"%>
								</tbody>
							</table>
						</div>
					<input type="hidden" id="user_id" value="${ sessionScope.plogin.user_id }" />
					</div>
				</div>
		</div>
		
		</form>
	   </article>
	 </section>
   </main>
   

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // 모든 필터 조건에 대한 이벤트 리스너 추가
    document.getElementById('skill').addEventListener('change', filterPosts);
    document.getElementById('career').addEventListener('change', filterPosts);
    document.getElementById('region').addEventListener('change', filterPosts);
    
    // 'user_id'를 가진 요소가 있는지 확인 후 값을 가져옴
    const userIdElement = document.getElementById('user_id');
    if (userIdElement) {
        const userId = userIdElement.value;
    } else {
        console.error("요소 'user_id'를 찾을 수 없습니다.");
    }
});

function filterPosts() {
    // 각 필터링 조건의 값을 가져옴
    const selectedSkill = document.querySelector('#skill>option:checked').value;
    const selectedCareer = document.querySelector('#career>option:checked').value;
    const selectedRegion = document.querySelector('#region>option:checked').value;

    // 'user_id'를 가진 요소가 있는지 확인 후 값을 가져옴
    const userIdElement = document.getElementById('user_id');
    const userId = userIdElement ? userIdElement.value : null;


    // 서버에 보낼 데이터 객체 생성
    const requestData = {
        skill: selectedSkill,
        career: selectedCareer,
        region: selectedRegion
    };
    const url = '/Filter/GetPosts';
    fetch(url, {
        method: 'POST',
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(requestData)
    })
    .then(response => response.json())
    .then(json => {
    	const container = document.querySelector('.post-listings tbody');
        let html = '';
        container.innerHTML = html;
        json.forEach(post => {
        	let html = '';
        	html += '<tr>';
        	html += '<td>' + post.po_num + '</td>';
        	html += '<td>';
        	html += '<a href="#" id="comName" onclick="openPopup(\'' +  post.com_name.replace(/'/g, "\\'") + '\',\'' + post.com_num + '\',\'' + post.com_boss.replace(/'/g, "\\'") + '\',\'' + post.com_adr.replace(/'/g, "\\'") + '\',\'' + post.com_tell + '\',\'' + post.com_id + '\')">' + post.com_name +'</a>';
        	html += '</td>';
        	html += '<td>' + post.rating + '</td>';
        	html += '<td><a href="/Post/View?po_num=' + post.po_num + '&user_id=' + post.userId + '">' + post.po_title + '</a></td>';
        	html += '<td>' + post.po_qual + '</td>';
        	html += '</tr>';
            const postElement = document.createElement('tr');
            postElement.classList.add('col-xs-4', 'post'); 
            postElement.innerHTML = html;
            container.appendChild(postElement);
        });
    })

    .catch(error => {
        console.error('에러:', error);
        alert('요청을 처리하는 중 문제가 발생했습니다.');
    });
}
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
   
   //-----------------------------------------------------------------------------
   // 모달 열기
   
   function openPopup(com_name, com_num, com_boss, com_adr, com_tell, com_id) {
	  const modal = document.querySelector(".modal");
	  const title = document.getElementById("popupTitle");
	  const content = document.getElementById("popupContent");
	  const comNum  = document.querySelector('#popupComNum');
	  const comBoss = document.querySelector('#popupComBoss');
	  const comAdr  = document.querySelector('#popupComAdr');
	  const comTell = document.querySelector('#popupComTell');
      // 모달 제목과 기본 내용 설정
      title.innerHTML   = com_name + ' 정보';
      content.innerHTML = '이곳에 ' + com_name + '의 정보를 표시합니다.';
      comNum.innerHTML = '사업자등록번호: ' + com_num;
      comBoss.innerHTML = '회사 대표명: ' + com_boss;
      comAdr.innerHTML = '회사 주소: ' + com_adr;
      comTell.innerHTML = '회사 전화번호: ' + com_tell;

      modal.style.display = "block";
      
   //-----------------------------------------------------------------------------
   // 평점 표시
   
      $(document).ready(function() {
    	  const user_id = $('#user_id').val();

   		// 별점을 클릭했을 때 이벤트 처리
   		const starEls = document.querySelectorAll('.star');
   		
   		starEls.forEach( star => {
   			
   			star.addEventListener('click', function() {
   				
   				// 클릭한 별의 값을 가져옴
		        const value = parseInt(this.getAttribute('data-value'));
   				console.log('클릭한 별의 값: ' + value);
   				
		        // 클릭한 별보다 작거나 같은 별에 'filled' 클래스 추가
		        document.querySelectorAll('.star').forEach(star => {
		        	
		            const starValue = parseInt(star.getAttribute('data-value'));
		            
		            if (starValue <= value) {
		                star.classList.add('filled');
		            } else {
		                star.classList.remove('filled');
		            }
		            
		        });
		        
		        // 평점 제출 처리 함수
			   const ratingSubmitBtnEl = document.querySelector('.ratingSubmitBtn');
			
			   ratingSubmitBtnEl.addEventListener('click', function submitRating(e) {
				   e.preventDefault();
			       const rating = value;
			       const user_id = $('#user_id').val();
			       console.log('rating: ' + rating)
			
			       // 서버로 평점 데이터 전송
			       fetch('/Company/ratings/add?com_id=' + com_id + '&user_id=' + user_id + '&rating=' + rating, {
			           method: 'POST'
			       })
			       .then(response => response.text())
			       .then(data => {
				        console.log(data);
		
				        const ratingDisplayEl = document.querySelector('.ratingDisplay');
				        
				     	// 이전 평점을 업데이트하기 위한 FETCH 요청
				        fetch('/Company/getRating?user_id=' + user_id + '&com_id=' + com_id, {
				            method : 'GET'
				        })
				        .then(response => response.text())
				        .then(data => {
				        	
				        	const ratingDisplayEl = document.querySelector('.ratingDisplay');
		    	            console.log(ratingDisplayEl)
		    	            
		    	            
				        })
			       .catch(error => console.error(error));
			   })
		        
   			})
   			
   		} )
   
      })
      });
   }
   //-----------------------------------------------------------------------------
   // 모달 닫기
   function closePopup() {
	  const modal = document.querySelector(".modal");
      modal.style.display = "none";
      location.reload();
   }
   
   // 모달 바깥을 클릭하면 모달이 닫히도록 설정
   window.onclick = function(event) {
	  const modal = document.querySelector(".modal");
      if (event.target == modal) {
         modal.style.display = "none";
      location.reload();
      }
   }
   
</script>
</body>


</html>