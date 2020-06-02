<%@page import="java.sql.*"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
table, td, th {
	border: 1px solid green;
	text-align: center;
}

th {
	background-color: green;
	color: white;
}
</style>
<title>상세 조회 페이지</title>
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

		ResultSet rs = null;

		Class.forName(driverName);

		conn = DriverManager.getConnection(url, ID, PS);

		out.println("Oracle DB 연결 성공");

		stmt = conn.createStatement();

		String sql = "SELECT * FROM BOARD WHERE IDX=" + idx;

		rs = stmt.executeQuery(sql);

		while (rs.next()) {
%>

<body>
	<h1>게시글 조회</h1>
	<table>
		<tr>
			<th>글번호</th>
			<td><%=rs.getString("idx")%></td>
			<th>작성자</th>
			<td><%=rs.getString("writer")%></td>
			<th>날짜</th>
			<td><%=rs.getString("regdate")%></td>
			<th>조회수</th>
			<td><%=rs.getString("count")%></td>
		</tr>
		<tr>
			<th colspan="2">제목</th>
			<td colspan="6"><%=rs.getString("title")%></td>
		</tr>
		<tr height=100>
			<th colspan="2">내용</th>
			<td colspan="6"><%=rs.getString("content")%></td>
		</tr>



	</table>
	<a href="index.jsp">목록으로</a>
	<a href="delete.jsp?idx=<%=rs.getString("idx")%>">삭제하기</a>
	<%
		}
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {

			out.println("Oracle Database Connection Something Problem. <hr>");

			out.println(e.getMessage());

			e.printStackTrace();

		}
	%>

</body>
</html>