<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jik Job</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
  
</style>

</head>

<body>

   <%@include file="/WEB-INF/views/include/pheader.jsp" %>
            
   <main>
                  
	  <h1>Success</h1>
      <p>입사지원에 성공하였습니다.</p>
      
      <div><a href="/Post/Success?user_id=${ sessionScope.plogin.user_id }">목록으로</a></div>
	 
   </main>

   <%@include file="/WEB-INF/views/include/footer.jsp" %>
   
   <script>
   
   
   
   </script>
  

</body>
</html>