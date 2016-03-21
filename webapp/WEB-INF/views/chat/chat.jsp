<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/assets/css/jquery.mobile-1.4.5.min.css">
<link href="${pageContext.request.contextPath}/assets/css/chat.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/assets/js/jquery-1.12.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>

	<div data-role="page" id="pageone">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		
		<div data-role="main" class="ui-content">
		
			<ul id="chat-box"></ul>

		</div>
		
		<div data-role="footer"  id="footer">
			<div data-role="navbar">
				<form id="send-message">
					<input id="message"  type="text" /> 
					<input id="submitbtn" type="submit" data-inline="true"  value="전송" />
				</form>
			</div>
		</div>
		
	</div>
	
	<script src="https://${ip }:3000/socket.io/socket.io.js"></script>
	<script>
		$(function(){
			var socket = io.connect('https://${ip }:3000');
			var name = '${name }';
			var serverkey = '${serverkey }';
			var clientkey = '${clientkey }';
			var $messageForm = $('#send-message');
			var $messageBox = $('#message');
			var $chat = $('#chat-box');
			
			if(clientkey.length!=0){
				socket.emit('new user', {nick:name, room: clientkey }, function(data){
				});
			} else if (serverkey.length!=0){
				socket.emit('new user', {nick:name, room: serverkey}, function(data){
				});
			}

			$messageForm.submit(function(e) {
				e.preventDefault();
				socket.emit('send message', $messageBox.val(), function(data){
					$chat.append('<span class="error">' + data + "</span><br/>");
				});
				$messageBox.val('');
			});
			
			socket.on('new message', function(data) {
				if(data.nick === name){
					$chat.append('<li class="mine">' +data.msg + "</li>");
				}else{
					$chat.append('<li class="yours"><span>' + data.nick + ':</span>' +data.msg + "</li>");
				}
				$("#chat-box").scrollTop($("#chat-box")[0].scrollHeight);
			});
			
			$("#chat-box").css("height",$(window).height()-150);
			
		});
	</script>

</body>
</html>