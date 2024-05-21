<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jik Job</title>
</head>
<body>

   <%@include file="/WEB-INF/views/include/cheader.jsp"%>

   <!-- 사이드 바 -->
   <div class="container d-flex">
      <div class="list-group mx-2">
         <a href="/Company/CInfo?com_id=${ sessionScope.clogin.com_id }"
            class="list-group-item   shadow" style="width: 150px;">회사정보</a> <a
            href="/Company/PostForm?com_id=${ sessionScope.clogin.com_id }"
            class="list-group-item hs_list_effect shadow">공고관리</a> <a
            href="/Company/SupportedList?com_id=${ sessionScope.clogin.com_id }"
            class="list-group-item shadow">받은 이력서 관리</a> <a href="#"
            class="list-group-item shadow">스크랩</a>
      </div>
      <!-- 페이지 내용 -->
      <div class=" mx-2 pb-4 w-100">
         <div class=" border border-tertiary p-5 rounded shadow">
            <div class="col-sm-9 page">
               <div class="d-flex justify-content-center">
                  <img src="/img/post1.png" id="imagePreview"
                     class="mb-2 border border-tertiary"
                     style="width: 200px; height: 200px;">
                  <form>
                     <div class="input-group mb-3">
                        <span
                           class="input-group-text justify-content-center hs_span_size init_color hs_span">아이디</span>
                        <input type="email" class="form-control"
                           value="${ sessionScope.clogin.com_id }" readonly>
                     </div>
                     <div class="input-group mb-3">
                        <span
                           class="input-group-text justify-content-center hs_span_size init_color hs_span">회사명</span>
                        <input type="text" class="form-control" value="${po.com_name }"
                           readonly>
                     </div>
                     <div class="input-group mb-3">
                        <span
                           class="input-group-text justify-content-center hs_span_size init_color hs_span">사업자등록증</span>
                        <input type="text" class="form-control" value="${po.com_num }"
                           readonly>
                     </div>
                     <div class="input-group mb-3">
                        <span
                           class="input-group-text justify-content-center hs_span_size init_color hs_span">대표자명</span>
                        <input type="text" class="form-control" value="${po.com_boss }"
                           readonly>
                     </div>
                     <div class="input-group mb-3">
                        <span
                           class="input-group-text justify-content-center hs_span_size init_color hs_span">회사주소</span>
                        <input type="text" class="form-control" value="${po.com_adr }"
                           readonly>
                     </div>
                     <div class="input-group mb-3">
                        <span
                           class="input-group-text justify-content-center hs_span_size init_color hs_span">전화번호</span>
                        <input type="text" class="form-control" value="${po.com_tell}"
                           readonly>
                     </div>
                       <!-- 수정하기와 회원탈퇴 버튼을 담을 div -->
                        <div class="d-flex justify-content-between">
                            <!-- 수정하기 버튼 -->
                            <button type="button" class="btn btn-dark" style="width: 100px; height: 40px; margin-right: 10px;"
                                    onclick="location.href='/Company/CInfoedit?com_id=${ sessionScope.clogin.com_id }'">수정하기
                            </button>
                            </form>
                            <!-- 회원탈퇴 버튼 -->
                            <form action="/Company/CInfoDelete?com_id=${ sessionScope.clogin.com_id }" id="deleteCompanyBtn" method="POST">
                                <button type="submit" class="btn btn-dark" style="width: 100px; height: 40px;">회원탈퇴</button>
                            </form>
                        </div>
               <!-- 회원탈퇴 페이지 만들고 연결 -->
            </div>
         </div>
      </div>
   </div>
</body>
<script>
document.getElementById('deleteCompanyBtn').addEventListener('submit', function(event) {
    var result = confirm('정말로 탈퇴하시겠습니까?');
    if (!result) {
        // 사용자가 "취소"를 눌렀을 때 실행될 코드
        // 폼의 제출을 막습니다.
        event.preventDefault();
    }
});
</script>

</html>