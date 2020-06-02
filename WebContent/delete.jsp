<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<%
	String idx = request.getParameter("idx");

	try {
		String driverName = "oracle.jdbc.driver.OracleDriver";

		String url = "jdbc:oracle:thin:@localhost:1521:XE";

		String ID = "BOARD";

		String PS = "123";

		Connection conn = null;

		Statement stmt = null;

		Class.forName(driverName);

		conn = DriverManager.getConnection(url, ID, PS);

		out.println("Oracle DB 연결 성공");

		stmt = conn.createStatement();

		String sql = "delete from board where idx = " + idx; // 삭제 쿼리입니다.

		stmt.executeQuery(sql);

		stmt.close();
		conn.close();
	} catch (Exception e) {

		out.println("Oracle Database Connection Something Problem. <hr>");

		out.println(e.getMessage());

		e.printStackTrace();

	}
%>

<script>
	alert("게시글 삭제 완료");
	location.href = "redirect.jsp";
</script>
<body>
</body>
</html>