<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>


<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>

<body>
	<form action="insert.jsp" id="firstform" method="post" onsubmit="return formCheck();">
		제목 : <input type="text" name="title"><br /> 작성자 : <input type="text" name="writer"><br /> 날짜 : <input type="text" name="regdate"><br /> 내용 :
		<textarea rows="10" cols="20" name="content"></textarea>
		<br /> <input type="submit">
	</form>

	<script>
		var mainForm = document.getElementById("firstform");

		function formCheck() {

			var writer = mainForm.writer.value;
			var content = mainForm.content.value;
			var title = mainForm.title.value;
			var regdate = mainForm.regdate.value;

			if (title == null || title == "") {
				alert("제목을 입력하세요");
				mainForm.title.focus();
				return false;
			}
			if (writer == null || writer == "") {
				alert("작성자를 입력하세요");
				mainForm.writer.focus();
				return false;
			} else if (writer.match(/^(\w+)@(\w+)[.](\w+)$/ig) == null) {
				alert('이메일 형식으로 입력하세요');
				mainForm.writer.focus();
				return false;
			}

			if (regdate == null || regdate == "") {
				alert("날짜를 입력하세요");
				mainForm.regdate.focus();
				return false;
			} 
		/* 	else if (regdate.match(/^\d\d\d\d\d\d+$/ig) == null) {
				alert('숫자 형식(6자리)으로 입력하세요');
				mainForm.regdate.focus();
				return false;
			} */
			
			if (content == null || content == "") {
				alert("내용을 입력하세요");
				mainForm.content.focus();
				return false;
			}


			/* 			var length = mainForm.length - 1;

			 for (var i = 0; i < length; i++) {
			 if (mainForm[i].value == null || mainForm[i].value == "") {
			 alert(mainForm[i].name + "을/를 입력하세요");
			 mainForm[i].focus();
			 return false;
			 }
			 } */
		}
	</script>

</body>
</html>