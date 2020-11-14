<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<meta charset="utf-8">
<title>회원가입하자</title>
</head>
<body>

	<div>
	
		<form method="post" enctype = "multipart/form-data">
		이메일 <input type="text" name="uid">
		비밀번호<input type="password" name="upw" minlength="6">
		닉네임 <input type="text" name="uname" id="uname">
		연락처 <input type="text" name="uphonenum" minlength = "9">
		사진 <input type="file" name="photo">
		
		<a onclick="unameValue();">눌러요</a>
		
		<div id="here"></div>
		
		<input type="submit" value="제출">
		</form>
	
	</div>

</body>
</html>

<script>

	
			
			function unameValue(){
		
			$('#here').html($('#uname').val());
		
			}





</script>
