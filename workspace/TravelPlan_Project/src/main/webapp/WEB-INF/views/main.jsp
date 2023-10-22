<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
<head>
<meta charset="UTF-8">
<title>여행을 담다, 여담</title>
</head>
<body>
<!-- header -->
<jsp:include page="common/top.jsp" flush="true" />

<!-- content -->
<div id='wrapper'>
  <div>
    <jsp:include page="common/main.jsp" flush="ture"/>
  </div>
</div>

<!-- footer -->
<footer>
<jsp:include page="common/footer.jsp" flush="ture"/>
</footer>

</body>
</html>