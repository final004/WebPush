<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://localhost/socket.io/socket.io.js"></script>  
<script>  
// localhost로 연결한다.
var socket =  
  io.connect('http://localhost');

// 서버에서 news 이벤트가 일어날 때 데이터를 받는다.
socket.on('news',  
  function (data) {
    console.log(data);
  //서버에 my other event 이벤트를 보낸다.
    socket.emit('my other event', 
      { my: 'data' });
});
</script>
<style type="text/css">
#quickLink { position:fixed; _position:absolute; left:800px; top:200px; width:100px; height:300px; background:#CCC;}
</style>
</head>
<body>

<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<p>-</p>
<div id="quickLink">Fixed Quick Link</div>

</body>
</html>