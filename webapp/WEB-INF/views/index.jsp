<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/assets/css/jquery.mobile-1.4.5.min.css">
<link href="${pageContext.request.contextPath}/assets/css/index.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/assets/js/jquery-1.12.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.mobile-1.4.5.min.js"></script>
<link rel="manifest" href="manifest.json">

</head>
<body>
<!-- 
<script src="${pageContext.request.contextPath }/assets/js/require.js"></script>
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
	    -->
	<script src="${pageContext.request.contextPath }/assets/js/main.js"></script>
	
	<div data-role="page" id="pageone">
		<c:import url="/WEB-INF/views/includes/header.jsp" />

		<div data-role="main" class="ui-content">
			<img src="${pageContext.request.contextPath}/assets/img/indeximg.PNG"/>
			<a href="#bank" class="ui-btn">Bank</a>
			<a href="#card" class="ui-btn">Card</a>
			<a href="#capital" class="ui-btn">Capital</a>
			<a href="#ins" class="ui-btn">Ins</a>
		</div>
		
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
	
	
	<div data-role="page" id="bank">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
	   <div data-role="main" class="ui-content">
			<div data-role="controlgroup" data-type="horizontal" class="selectedBtn">
			     <a href="#" class="ui-btn">Bank 1</a>
			     <a href="#" class="ui-btn">Bank 2</a>
			     <a href="#" class="ui-btn">Bank 3</a>
		    </div>
		    <div data-role="controlgroup" data-type="horizontal" class="selectedBtn">
			     <a href="#" class="ui-btn">Bank 4</a>
			     <a href="#" class="ui-btn">Bank 5</a>
			     <a href="#" class="ui-btn">Bank 6</a>
		    </div>
		    <div data-role="controlgroup" data-type="horizontal" class="selectedBtn">
			     <a href="#" class="ui-btn">Bank 7</a>
			     <a href="#" class="ui-btn">Bank 8</a>
			     <a href="#" class="ui-btn">Bank 9</a>
		    </div>
		    <div data-role="controlgroup" data-type="horizontal" class="selectedBtn">
			     <a href="#" class="ui-btn">Bank 7</a>
			     <a href="#" class="ui-btn">Bank 8</a>
			     <a href="#" class="ui-btn">Bank 9</a>
		    </div>
		</div>
		
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div> 
	
	<div data-role="page" id="card">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
	   
	   <div data-role="main" class="ui-content">
			<div data-role="controlgroup" data-type="horizontal" class="selectedBtn">
			     <a href="#" class="ui-btn">Card 1</a>
			     <a href="#" class="ui-btn">Card 2</a>
			     <a href="#" class="ui-btn">Card 3</a>
		    </div>
		    <div data-role="controlgroup" data-type="horizontal" class="selectedBtn">
			     <a href="#" class="ui-btn">Card 4</a>
			     <a href="#" class="ui-btn">Card 5</a>
			     <a href="#" class="ui-btn">Card 6</a>
		    </div>
		    <div data-role="controlgroup" data-type="horizontal" class="selectedBtn">
			     <a href="#" class="ui-btn">Card 7</a>
			     <a href="#" class="ui-btn">Card 8</a>
			     <a href="#" class="ui-btn">Card 9</a>
		    </div>
		    <div data-role="controlgroup" data-type="horizontal" class="selectedBtn">
			     <a href="#" class="ui-btn">Card 7</a>
			     <a href="#" class="ui-btn">Card 8</a>
			     <a href="#" class="ui-btn">Card 9</a>
		    </div>
		</div>
		
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div> 
	
	
	<div data-role="page" id="capital">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
	   
	   <div data-role="main" class="ui-content">
			<div data-role="controlgroup" data-type="horizontal" class="selectedBtn">
			     <a href="#" class="ui-btn">Capital 1</a>
			     <a href="#" class="ui-btn">Capital 2</a>
			     <a href="#" class="ui-btn">Capital 3</a>
		    </div>
		    <div data-role="controlgroup" data-type="horizontal" class="selectedBtn">
			     <a href="#" class="ui-btn">Capital 4</a>
			     <a href="#" class="ui-btn">Capital 5</a>
			     <a href="#" class="ui-btn">Capital 6</a>
		    </div>
		    <div data-role="controlgroup" data-type="horizontal" class="selectedBtn">
			     <a href="#" class="ui-btn">Capital 7</a>
			     <a href="#" class="ui-btn">Capital 8</a>
			     <a href="#" class="ui-btn">Capital 9</a>
		    </div>
		    <div data-role="controlgroup" data-type="horizontal" class="selectedBtn">
			     <a href="#" class="ui-btn">Capital 7</a>
			     <a href="#" class="ui-btn">Capital 8</a>
			     <a href="#" class="ui-btn">Capital 9</a>
		    </div>
		</div>
		
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div> 
	
	
	<div data-role="page" id="ins">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
	   
	   <div data-role="main" class="ui-content">
			<div data-role="controlgroup" data-type="horizontal" class="selectedBtn">
			     <a href="#" class="ui-btn">Ins 1</a>
			     <a href="#" class="ui-btn">Ins 2</a>
			     <a href="#" class="ui-btn">Ins 3</a>
		    </div>
		    <div data-role="controlgroup" data-type="horizontal" class="selectedBtn">
			     <a href="#" class="ui-btn">Ins 4</a>
			     <a href="#" class="ui-btn">Ins 5</a>
			     <a href="#" class="ui-btn">Ins 6</a>
		    </div>
		    <div data-role="controlgroup" data-type="horizontal" class="selectedBtn">
			     <a href="#" class="ui-btn">Ins 7</a>
			     <a href="#" class="ui-btn">Ins 8</a>
			     <a href="#" class="ui-btn">Ins 9</a>
		    </div>
		    <div data-role="controlgroup" data-type="horizontal" class="selectedBtn">
			     <a href="#" class="ui-btn">Ins 7</a>
			     <a href="#" class="ui-btn">Ins 8</a>
			     <a href="#" class="ui-btn">Ins 9</a>
		    </div>
		</div>
		
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div> 
	
	<script>
		$('.selectedBtn a').on("click", function(e){
			var url ="${pageContext.request.contextPath}/chat/waiting/?name=client&clientkey="+e.target.innerText;
			$(location).attr('href',url);
		});
	</script>
	
</body>
</html>
