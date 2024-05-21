<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
  <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

   <table id="menu">
	  <c:forEach var="post" items="${ postList }">
	    <td>
	      <a href="/BoardPaging/List?user_id=${sessionScope.plogin.user_id  }&nowpage=${nowpage}">
	       ${ post.po_num }
	      </a> 
	     </td>
	  </c:forEach>
   </table>	  
   
   
   
   