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
#chat {
	width: 100%;
	height: 350px;
}
#contentWrap {
	display: none;
}
#chatWrap {
	border: 1px #000 solid;
}
.error {
	color: red;
}
.whisper {
	color: gray;
	font-style: italic;
}
</style>
</head>
<body>

	<div data-role="page" id="pageone">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<div class="ui-field-contain">
		
		<div id="nickWrap">
			<p id="nickError"></p>
			<form id="setNick">
				<label for="nickLabel">Enter a username:</label>
				<input  id="nickname" /> 
				<label for="roomLabel">Enter a Roomname:</label>
				<input  id="roomname" /> 
				<input type="submit" data-inline="true" value="입장" >
			</form>
		</div>

		<div id="contentWrap">
			<div id="chatWrap">
				<div id="chat"></div>
				<form id="send-message">
					<input id="message" /> 
					<input type="submit" data-inline="true" value="전송" >
				</form>
			</div>
			
		</div>

		</div>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
	
	<script src="http://localhost:3000/socket.io/socket.io.js"></script>
	<script>
		$(function(){
			var socket = io.connect('http://localhost:3000');
			var $nickForm = $('#setNick');
			var $nickError = $('#nickError')
			var $nickBox = $('#nickname');
			var $roomBox = $('#roomname');
			var $users = $('#users');
			var $messageForm = $('#send-message');
			var $messageBox = $('#message');
			var $chat = $('#chat');

			$nickForm.submit(function(e) {
				e.preventDefault();
				socket.emit('new user', {nick:$nickBox.val(), room:$roomBox.val()}, function(data){
					if(data){
						$('#nickWrap').hide();
						$('#contentWrap').show();
					} else {
						$nickError.html('That username is already taken! Try again!')
					}
				});
				$nickBox.val('');
			});

			socket.on('usernames', function(data){
				var html = '';
				for(i=0; i<data.length; i++){
					html += data[i] + '<br/>'
				}
				$users.html(html);
			})

			$messageForm.submit(function(e) {
				e.preventDefault();
				socket.emit('send message', $messageBox.val(), function(data){
					$chat.append('<span class="error">' + data + "</span><br/>");
				});
				$messageBox.val('');
			});

			socket.on('new message', function(data) {
				$chat.append('<span class="msg"><b>' + data.nick + ':</b>' +data.msg + "</span><br/>");
			});

			socket.on('whisper', function(data){
				$chat.append('<span class="whisper"><b>' + data.nick + ':</b>' +data.msg + "</span><br/>");
			});
			
			if('${param.key}'!==''){
				console.log('${key}');
				socket.emit('new user', {nick:'server', room:'${param.key}'}, function(data){
					if(data){
						$('#nickWrap').hide();
						$('#contentWrap').show();
					} else {
						$nickError.html('That username is already taken! Try again!')
					}
				});
			}

		})
	</script>
<!-- 
	<c:if test="${param.key=='fail' }">
		<script>
			console.log('${key}');
			socket.emit('new user', {nick:'server', room:'${key}'}, function(data){
				if(data){
					$('#nickWrap').hide();
					$('#contentWrap').show();
				} else {
					$nickError.html('That username is already taken! Try again!')
				}
			});
		</script>
	</c:if>
 -->	
</body>
</html>