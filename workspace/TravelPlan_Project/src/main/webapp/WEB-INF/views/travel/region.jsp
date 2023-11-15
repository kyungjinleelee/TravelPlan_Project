<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<script>

</script>
<body>
	<c:set var="region" value="${param.region }" />
	<c:if test="${region eq'seoul' }">
		<label class="region">서울</label>
	</c:if>
	<c:set var="region" value="${param.region }" />
	<c:if test="${region eq'incheon' }">
		<label class="region">인천</label>
	</c:if>
	<c:set var="region" value="${param.region }" />
	<c:if test="${region eq'daejeon' }">
		<label class="region">대전</label>
	</c:if>
	<c:set var="region" value="${param.region }" />
	<c:if test="${region eq'daegu' }">
		<label class="region">대구</label>
	</c:if>
	<c:set var="region" value="${param.region }" />
	<c:if test="${region eq'gwangju' }">
		<label class="region">광주</label>
	</c:if>
	<c:set var="region" value="${param.region }" />
	<c:if test="${region eq'busan' }">
		<label class="region">부산</label>
	</c:if>
	<c:set var="region" value="${param.region }" />
	<c:if test="${region eq'ulsan' }">
		<label class="region">울산</label>
	</c:if>
	<c:set var="region" value="${param.region }" />
	<c:if test="${region eq'gangwon' }">
		<label class="region">강원</label>
	</c:if>
	<c:set var="region" value="${param.region }" />
	<c:if test="${region eq'jeju' }">
		<label class="region">제주</label>
	</c:if>

</body>
</html>