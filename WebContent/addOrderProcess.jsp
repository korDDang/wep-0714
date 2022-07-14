<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
String productId=request.getParameter("productId");
String orderDate=request.getParameter("orderDate");
String orderName=request.getParameter("orderName");
String unitprice=request.getParameter("unitprice");
String orderQty=request.getParameter("orderQty");
String orderAddress=request.getParameter("orderAddress");
try{
	String sql="insert into Order0714 values(?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, orderDate);
	pstmt.setString(2, orderName);
	pstmt.setString(3, productId);
	pstmt.setString(4, unitprice);
	pstmt.setString(5, orderQty);
	pstmt.setString(6, orderAddress );
	pstmt.executeUpdate();
	sql="select unitsInstock from product0714 where productId=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs=pstmt.executeQuery();
	rs.next(); 
	int unitsInstock=rs.getInt(1);
	int qty=Integer.parseInt(orderQty);
	sql="update product0714 set unitsInstock=? where productId=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1, unitsInstock-qty);
	pstmt.setString(2, productId);
	pstmt.executeUpdate();
	%>
	<script>
	alert("완료되었습니다.");
	location.href="selectOrder.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록 실패");
}

%>
</body>
</html>