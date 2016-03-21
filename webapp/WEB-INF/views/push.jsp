<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<link href="${pageContext.request.contextPath}/assets/css/main.css"	rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<link rel="manifest" href="${pageContext.request.contextPath}/assets/manifest.json">
</head>
<body>
	<button onclick="notifyMe()">Notify me!</button>

<script type="text/javascript">    
document.addEventListener('DOMContentLoaded', function () {
	  if (Notification.permission !== "granted")
	    Notification.requestPermission();
	});

	function notifyMe() {
	  if (!Notification) {
	    alert('Desktop notifications not available in your browser. Try Chromium.'); 
	    return;
	  }

	  if (Notification.permission !== "granted")
	    Notification.requestPermission();
	  else {
	    var notification = new Notification('Roxy', {
	      icon: 'http://cdn.sstatic.net/stackexchange/img/logos/so/so-icon.png',
	      body: "Hey there! I'm Roxy",
	    });

	    notification.onclick = function () {
	      window.open("http://www.naver.com");      
	    };

	  }

	}
</script>	
</body>
</html>