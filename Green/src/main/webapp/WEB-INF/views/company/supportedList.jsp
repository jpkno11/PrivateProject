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

   <%@include file="/WEB-INF/views/include/cheader.jsp"%>

   <!-- 사이드 바 -->
    <div class="container d-flex">
		<div class="list-group mx-2">
		<a href="/Company/Info?com_id=${ sessionScope.clogin.com_id }" class="list-group-item   shadow" style="width: 150px;">회사정보</a>
		<a href="/Company/PostForm?com_id=${ sessionScope.clogin.com_id }" class="list-group-item hs_list_effect shadow">공고관리 관리</a>
		<a href="/Company/SupportedList?com_id=${ sessionScope.clogin.com_id }" class="list-group-item shadow">받은 이력서 관리</a>
		<a href="#" class="list-group-item shadow">스크랩</a>
	</div>
</div>
	<!-- 페이지 내용 -->
  <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <div class="col-sm-9 page">
     	<section class="content inner">
     		<div class="list">
     			<div class="tab-content">
     				<h4>저희 회사에 지원한 이력서 목록입니다</h4>
     				<ul class="job-list">
     					<li>
     						<table>
     							<thead>
     								<tr>
     									<th>공고번호</th>
     									<th>제목</th>
                      <th>이력서제목</th>
                      <th>유저아이디</th>
                      
                      <th>지원일자</th>
                      
                      <th>결과</th>
     								</tr>
     							</thead>
     							<tbody>
     								<c:forEach var="item" items="${applyedList}">
     									<tr>
     										<td>${item.po_num }</td>
     										<td><a href="#">${item.po_title }</a></td>
     										<td><a href="#">${item.re_title }</a></td>
     										<td>${item.user_id }</td>
     										
     										<td>${item.ap_date }</td>
     										
     										<td>
     										   <c:choose>
                              <c:when test="${item.result == 0}">
                                 <button type="button" class="btn btn-danger">대기</button>
                              </c:when>
                              <c:when test="${item.result == 1}">
                                 <button type="button" class="btn btn-danger">불합격</button>
                              </c:when>
                              <c:when test="${item.result == 2}">
                                 <button type="button" class="btn btn-info">합격</button>
                              </c:when>
                           </c:choose>
                         </td>
     									</tr>
     								</c:forEach>
     							</tbody>
     						</table>
     					</li>
     				</ul>
     			</div>
     		</div>
     	</section>
    </div>
    <!-- 내용 추가 -->
    </main>
</body>
</html>