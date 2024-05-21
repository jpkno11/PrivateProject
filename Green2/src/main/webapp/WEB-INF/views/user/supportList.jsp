<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
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
.content {
   display: flex;
}

.content .left {
   flex: 1;
   padding: 20px;
   margin-top: 75px;
}

.content .left h2 {
   
}

.content .left .person_date {
   border: 1px solid #d9d9d9;
   text-align: center;
   display: flex;
   flex-direction: column;
   align-items: center;
   padding: 10px 0;
}

.content .left .person_date>a {
   display: inline-block;
   border: 1px solid #3f98f7;
   border-radius: 5px;
   padding: 2px 4px;
   color: #3f98f7;
   margin: 4px 0;
}

.content .left .profile_pic {
   width: 50%
}

.content .left .person_date a {
   width: 150px
}

.content .right {
   flex: 3;
   padding: 20px;
}

.content .tabs {
   display: flex;
}

.content .tab {
   background-color: #f7faf9;
   border: none;
   padding: 10px 20px;
   cursor: pointer;
}

.content .tab:hover {
   background-color: #ccc;
   font-weight: bold;
}

.content .tab.active {
   font-weight: bold;
}

.content .tab-panel {
   display: none;
}

.content .tab-panel.active {
   display: block;
   font-weight: bold;
}

table {
   border-collapse: collapse;
   width: 100%;
}

th, td {
   padding: 10px;
   border: 1px solid #ddd; /* 셀 테두리 스타일 지정 */
   text-align: center;
}

td {
   font-weight: normal;
}

.f-col {
   
}
.pagination{
   display: flex;
   justify-content: center;
   margin-top: 20px;
   
}

.pagination .page-link{
 color: black;
}

main h4 {   
   margin: 20px 0
}

main button {
   background-color: inherit;
   border: none;
   box-shadow: none;
   border-radius: 0;
   padding: 0;
}

main button.bookmark {
   background: url("/img/bookmark-check.svg");
   background-size: cover;
   display: inline-block;
   width: 30px;
   height: 30px;
   margin-top: 2px
}

main button.bookmark:hover {
   background: url("/img/bookmark-check-fill.svg");
   background-size: cover;
}

main button.bookmarkOn {
   background: url("/img/bookmark-check-fill.svg");
   background-size: cover;
}
</style>

</head>
<body>

  <%@include file="/WEB-INF/views/include/pheader.jsp" %>
  
   <!-- 사이드 바 -->
    <div class="container d-flex">
		<div class="list-group mx-2">
		<a href="/Users/Info?user_id=${ sessionScope.plogin.user_id }"
			class="list-group-item   shadow" style="width: 150px;">개인정보</a> <a
			href="#"
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
     	<section class="content inner">
     		<div class="list">
     			<div class="tab-content">
     				<h4>회원님이 지원하신 기업입니다</h4>
     				<ul class="job-list">
     					<li>
     						<table>
     							<thead>
     								<tr>
     									<th>기업명</th>
     									<th>공고제목</th>
                      <th>이력서</th>
                      <th>분야</th>
                      <th>지원일자</th>
                      
                      <th>결과</th>
     								</tr>
     							</thead>
     							<tbody>
     								<c:forEach var="item" items="${applyList}">
     									<tr>
     										<td>${item.com_name }</td>
     										<td><a href="#">${item.po_title }</a></td>
     										<td><a href="#">${item.re_title }</a></td>
     										<td>${item.career }</td>
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
