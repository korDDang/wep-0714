<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp"%>
<%@ include file="nav.jsp"%>
<%@ include file="DBConn.jsp"%>
<%
int cnt=0;
try{
	String sql="select count(*) from product0714";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<section id="sec1">
<h2>상품 목록</h2>
<div style="margin: 0 10%">총 <%=cnt %>개의 상품이 있습니다.</div>
<hr>
<table border="1" id="tab1">
<tr>
<th class="th1">no</th>
<th class="th1">제품코드</th>
<th class="th1">제품명</th>
<th class="th1">단가</th>
<th class="th1">상세정보</th>
<th class="th1">제조사</th>
<th class="th1">분류</th>
<th class="th1">재고수</th>
<th class="th1">상태</th>
</tr>
<% 
int no=0;
try{
	String sql="select * from product0714";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String productId=rs.getString(1);
		String name=rs.getString(2);
		String unitprice=rs.getString(3);
		String description=rs.getString(4);
		String category =rs.getString(5);
		String manufacturer=rs.getString(6);
		String unitsInstock=rs.getString(7);
		String condition=rs.getString(8);
		no++;
	
%>
<tr>
<td class="td1"><%=no%></td>
<td class="td1"><%=productId %></td>
<td class="td1"><%=name %></td>
<td class="td1"><%=unitprice %></td>
<td class="td1"><%=description %></td>
<td class="td1"><%=manufacturer %></td>
<td class="td1"><%=category  %></td>
<td class="td1"><%=unitsInstock %></td>
<td class="td1"><%=condition %></td>
</tr>
<%
	}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</table>
<br>
<div class="td1"><input type="button" value="작성" onclick="location.href='addProduct.jsp'" class="bt2"></div>
</section>
<%@ include file="footer.jsp"%>
</body>
</html>