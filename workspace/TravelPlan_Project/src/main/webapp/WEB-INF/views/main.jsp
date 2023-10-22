<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="common/top.jsp" flush="true" /><br>
<hr>
<div id='wrapper'>
  <div>
    <jsp:include page="common/main.jsp" flush="ture"/>
  </div>
</div>

<footer>
<jsp:include page="common/footer.jsp" flush="ture"/>
</footer>

</body>
</html>