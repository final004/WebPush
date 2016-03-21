<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/assets/css/jquery.mobile-1.4.5.min.css">
<link href="${pageContext.request.contextPath}/assets/css/index.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/assets/js/jquery-1.12.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.mobile-1.4.5.min.js"></script>
<style>
#rooms {
	width: 50%; 
	height: 500px; 
	margin: 0 auto;
	background-color: aqua;
}

#rooms span {
	font-size: large;
	text-align: center;
}
</style>
</head>
<body>

	<div id="rooms"></div>
	
	<script src="https://${ip }:3000/socket.io/socket.io.js"></script>
	<script>
		$(function(){
			var socket = io.connect('https://${ip }:3000');
			var $rooms = $('#rooms');
			
			socket.emit('get rooms',{},function(){});
			
			socket.on('rooms', function(data){
				console.log(data);
				var html = '';
				for(var room in data){
					html += '<span class="roomname">'+data[room]+"</span><br/>";
				}
				$rooms.html(html);
				
			});
			
			$(document).on("click", ".roomname",function(e){
				var url ="${pageContext.request.contextPath}/chat/?name=server&serverkey="+e.target.innerText;
				$(location).attr('href',url);
				socket.emit('get Client',{roomname : e.target.innerText}, function(){});
			});
			
			
	/*		
			$(document).on("click", ".roomname",function(e){
				console.log(e.target.innerText);
				var url ="${pageContext.request.contextPath}/chat/?name=server&serverkey="+e.target.innerText;
				$(location).attr('href',url);
			});
*/
		})
	</script>

</body>
</html>