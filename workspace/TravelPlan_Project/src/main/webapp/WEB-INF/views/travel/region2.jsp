<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>travelRetrieve 지역 라벨 </title>

</head>
<script>

</script>
<body>
	<c:set var="region" value="${travelListDTO.areaCode}" />
	<c:if test="${travelListDTO.areaCode eq'1' }">
		<label class="region">서울</label>
	</c:if>
	<c:set var="region" value="${travelListDTO.areaCode }" />
	<c:if test="${travelListDTO.areaCode eq'2' }">
		<label class="region">인천</label>
	</c:if>
	<c:set var="region" value="${travelListDTO.areaCode}" />
	<c:if test="${travelListDTO.areaCode eq'3' }">
		<label class="region">대전</label>
	</c:if>
	<c:set var="region" value="${travelListDTO.areaCode }" />
	<c:if test="${travelListDTO.areaCode eq'4' }">
		<label class="region">대구</label>
	</c:if>
	<c:set var="region" value="${travelListDTO.areaCode }" />
	<c:if test="${travelListDTO.areaCode eq'5' }">
		<label class="region">광주</label>
	</c:if>
	<c:set var="region" value="${travelListDTO.areaCode }" />
	<c:if test="${travelListDTO.areaCode eq'6' }">
		<label class="region">부산</label>
	</c:if>
	<c:set var="region" value="${travelListDTO.areaCode }" />
	<c:if test="${travelListDTO.areaCode eq'7' }">
		<label class="region">울산</label>
	</c:if>
	<c:set var="region" value="${travelListDTO.areaCode }" />
	<c:if test="${travelListDTO.areaCode eq'32' }">
		<label class="region">강원</label>
	</c:if>
	<c:set var="region" value="${travelListDTO.areaCode }" />
	<c:if test="${travelListDTO.areaCode eq'39' }">
		<label class="region">제주</label>
	</c:if>

</body>
</html>