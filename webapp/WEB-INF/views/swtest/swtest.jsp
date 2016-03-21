<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/assets/css/jquery.mobile-1.4.5.min.css">
<link href="${pageContext.request.contextPath}/assets/css/chat.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/assets/js/jquery-1.12.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.mobile-1.4.5.min.js"></script>
<script>
navigator.serviceWorker.register('/worker.js').then(function(reg) {
	  console.log('◕‿◕', reg);
	}, function(err) {
	  console.log('ಠ_ಠ', err);
});
</script>
</head>
<body>

</body>
</html>