<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jik Job</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>
	

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
    <div class="container d-flex">
		<div class="list-group mx-2">
			<a href="/Users/Info?user_id=${ sessionScope.plogin.user_id }" class="list-group-item   shadow" style="width: 150px;">개인정보</a>
			<a href="/Users/ResumeForm?user_id=${ sessionScope.plogin.user_id }" class="list-group-item hs_list_effect shadow">이력서 관리</a>
			<a href="/Users/ApplyList?user_id=${ sessionScope.plogin.user_id }" class="list-group-item shadow">입사지원 관리</a>
			<a href="/Users/BookmarkList?user_id=${ sessionScope.plogin.user_id }" class="list-group-item shadow">스크랩</a>
	</div>

  <!-- 페이지 내용 -->
            <div class="container">
                <div class="border border-tertiary p-5 rounded shadow">
                    <div>
                        <h1>이력서 관리</h1>
                    </div>
                    <hr>

                    <div class="jh_resume mt-5">
                        <button class="jh_resume_button mb-5 rounded jm_card"
                            onclick="location.href=`/Users/ResumeMake?user_id=${ sessionScope.plogin.user_id }`">이력서 등록</button>
                        <c:forEach items="${resumeList}" var="Re">

                            <div id="resume_del" class="jh_resume_content mt-2 mb-2"
                                style="display: flex; justify-content: space-between">
                                <div class="d-flex align-items-center">
                                    <a href="/Users/ResumeView?re_num=${Re.re_num}&user_id=${ sessionScope.plogin.user_id }"> ${Re.re_title} </a>
                                </div>

								<form
									action="/Users/ReusmeDelete?re_num=${Re.re_num}&user_id=${ sessionScope.plogin.user_id }"
									id="delete_resume_${status.count}" method="POST">
									<button type="submit" class="btn btn-dark"
										id="delete_resume_${status.count}" onclick="deleteAlert()" >삭제</button>
							    </form>
								</div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
       </div>
    <!-- 내용 추가 -->
	<script>
	  function deleteAlert() {
		    alert("이력서가 삭제되었습니다");
		  }
	</script>
</body>
</html>