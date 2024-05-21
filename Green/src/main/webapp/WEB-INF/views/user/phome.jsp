<%@include file="/WEB-INF/views/include/pheader.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jik Job</title>
<style>
  .select_box {
  display: flex;
  justify-content: center; /* 가로로 중앙 정렬 */
  align-items: center; /* 세로로 중앙 정렬 */
  flex-wrap: wrap; /* 내용이 넘칠 경우 다음 줄로 이동 */
  gap: 10px; /* 자식 요소들 사이의 간격 */
}

  .announcement {
    display: inline-block;
    padding: 20px;
    background-color: #f2f2f2;
    border: 1px solid #ddd;
    text-align: center;
  }

</style>
</head>
<body>
	<form action =/Users/Umain>
	<!-- 옵션바 -->
		<div class="select_box jm_select_box mt-5">
		<select id="skill" name="skill" class="jm_select selectpicker"
			data-style="btn-info" >
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

	<!-- 채용 공고 -->
		<div class="container jm_container mt-5">
			<div class="row row-cols-3 g-4 d-flex flex-wrap">
				<c:forEach items="${ postList }" var="Vo" varStatus="status">
					<div class="col-xs-4 post">
						<a href="/Post/View?po_num=${ Vo.po_num }&user_id=${sessionScope.plogin.user_id}"
							style="color: inherit; text-decoration: none;">
							<div class="card jm_card h-120">
								<img src="${ Vo.po_image }"
									class="card-img-top jm_card_img_top">
								<div class="card-body jm_card_body">
									<div class="jm_company_title">${ Vo.po_title}</div>

									<div class="jm_company_address">${post.address}</div>
									<div class="jm_D-day d-flex justify-content-between">
										<div id="dDay-${status.count}"></div>
								<input type="hidden" id="user_id" value="${ sessionScope.plogin.user_id }" />
									</div>
								</div>
							</div>
						</a> <input type="hidden" value="${post.deadline}" name=""
							class="deadline" id="deadline-${status.count}" />
					</div>
				</c:forEach>
			</div>
		</div>
	</form>
		<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
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
        console.log(userId);
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

    // 필터링 결과를 가져올 URL (이 예제에서는 모든 필터링 조건을 처리할 수 있는 하나의 URL을 사용한다고 가정)
    const url = '/Filter/GetPosts';

    // Fetch API를 사용하여 서버로 필터링 조건 전송 및 결과 처리
    fetch(url, {
        method: 'POST',
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(requestData)
    })
    .then(response => response.json())
    .then(json => {
        const container = document.querySelector('.jm_container .row');
        container.innerHTML = ''; // 결과를 담을 컨테이너 초기화
        json.forEach(post => {
            let html = ''; 
            html += '<a href="/Post/View?po_num=' + post.po_num + '&user_id=' + post.userId + '" style="color: inherit; text-decoration: none;">';
            html += '<div class="card jm_card h-100">';
            html += '<img src="/Company/Images?com_id=' + post.com_id + '" class="card-img-top jm_card_img_top">';
            html += '<div class="card-body jm_card_body">';
            html += '<div class="jm_company_title">' + post.po_title + '</div>';
            html += '</div>';
            html += '</div>';
            html += '</a>';
            
            const postElement = document.createElement('div');
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

</html>