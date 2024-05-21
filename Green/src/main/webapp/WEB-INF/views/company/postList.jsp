<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

.post-listings tr td:nth-child(3) {
	width: 400px;
}
  
</style>

</head>

<body>

   <%@include file="/WEB-INF/views/include/cheader.jsp" %>
            
   <main>
                  
	 <section>
	   <article>
	   <form action="/Post/CView?po_num=${ po_num }&com_id=${sessionScope.clogin.com_id}" method="post">
	   
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
	   
	     <h2 style="text-align:center; padding-top: 2%;">공고보기</h2>
		 <hr/>
			
		 <div class=" mx-2 pb-4 w-100">
			<div class=" border border-tertiary p-5 rounded shadow">
				<!-- <div class="col-sm-9 page"> -->
					<div class="d-flex justify-content-center">

						<div>
							<table class="post-listings">
								<thead>
									<tr>
										<th>No.</th>
										<th>기업명</th>
										<th>공고제목</th>
										<th>근무조건</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${response.list}" var="post">
										<tr>
											<td>${post.po_num}</td>
											<td>${post.com_name}</td>
											<td><a
												href="/Post/CView?po_num=${post.po_num}&com_id=${sessionScope.clogin.com_id}">
													${post.po_title} </a></td>
											<td>${post.po_qual}</td>
										</tr>
									</c:forEach>
									<%@include file="/WEB-INF/views/include/companypaging.jsp"%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			<!-- </div> -->
		</div>
		</form>
	   </article>
	 </section>
   </main>
   <script>
   
   </script>
</body>
</html>