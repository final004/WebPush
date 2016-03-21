<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://localhost:3000/socket.io/socket.io.js"></script>
</head>
<body>
	<div id = "log">
		<span>ID : <input type="text" id="userid"/></span>
		<span>ROOM : <input type="text" id="roomname"/></span>
		<span><input type="button" id="enter" value="ENTER" /></span>
	</div>
	<div id="chat" style="display:none;">
		<div style="width: 300px; height:300px; border: solid 1px;" id="txtarea">
			<dl id ="txtappend">
			</dl>
		</div>
		<br/>
		<input type="text" style="width:255px;" id="txt" /> <input type="button" value="Enter" id ="btn" />
	</div>
	
	<script>
		$(function(){
			var socket = io.connect('http://localhost:3000');
			
			$('#enter').click(function(){
				var userid = document.getElementById('userid');
				var roomname = document.getElementById('roomname');
				
				socket.emit('join', {'userid':userid.value, 'roomname':roomname.value});
				document.getElementById('log').style.display='none';
				document.getElementById('chat').style.display='block';
			});
			
			socket.on('join', function(data){
				alert(data);
				$('#txtappend').append('<dd style="margin:0px">'+data+'님이 접속 하셨습니다.</dd>');
			});
			
			$('#btn').click(function(){
				var message = $('#txt').val();
				socket.emit('message', message);
			});
			
			socket.on('message', function(data){
				$('#txtappend').append('<dd style="margin:0px">'+data+'</dd>');
				$('#txt').val('');
			});
		});
	</script>
</body>
</html>