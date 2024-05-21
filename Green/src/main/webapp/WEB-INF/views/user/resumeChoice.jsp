<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
                            onclick="location.href=`/Users/ResumeMake?user_id=${ sessionScope.plogin.user_id }`">➕ 새 이력서 등록</button>
                        
                        <c:forEach items="${goresumeList}" var="Re">
						    <div id="resume_del" class="jh_resume_content mt-2 mb-2" style="display: flex; justify-content: space-between">
						        <div class="d-flex align-items-center">
						            <a href="/Users/ResumeView?re_num=${Re.re_num}&user_id=${sessionScope.plogin.user_id}"> ${Re.re_title} </a>
						        </div>
						        <div>
						            <form action="/Post/Apply" method="POST">
						                <input type="hidden" name="re_num" value="${Re.re_num}" />
						                <input type="hidden" name="user_id" value="${sessionScope.plogin.user_id}" />
						                <input type="hidden" name="re_title" value="${Re.re_title}" />
						                <input type="hidden" name="po_title" value="${po_title}" />
						                <input type="hidden" name="po_num" value="${po_num}" />
						                <button type="submit" class="btn btn-success">선택</button>
						            </form>
						        </div>
						    </div>
						</c:forEach>
                    </div>
                </div>
            </div>
         </div>
    <!-- 내용 추가 -->


</body>
</html>