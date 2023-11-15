<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여담: 아이디 찾기</title>
</head>
<body>
<!-- header -->
<jsp:include page="common/top.jsp" flush="true" />

<!-- content -->
<div id='wrapper'>
  <div>
    <jsp:include page="member/findIdForm.jsp" flush="true" />
  </div>
</div>
</body>
</html>