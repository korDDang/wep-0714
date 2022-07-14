<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check() {
	var doc=document.form;
	if(doc.productId.value==""){
		alert("상품코드를 입력하세요");
		doc.productId.focus();
		return false;
	}if(doc.name.value==""){
		alert("상품명을 입력하세요");
		doc.name.focus();
		return false;
	}if(doc.name.value.length<4||doc.name.value.length>50){
		alert("상품명\n최소 4자에서 최대 50자까지 입력하세요");
		doc.name.focus();
		return false;
	}if(doc.unitprice.value==""){
		alert("가격을 입력하세요.");
		doc.unitprice.focus();
		return false;
	}if(doc.unitprice.value==0||isNaN(doc.unitprice.value)){
		alert("[가격]\n숫자만 입력하세요.");
		doc.unitprice.focus();
		return false;
	}if(doc.unitprice.value<0){
		alert("[가격]\n음수를 입력할 수없습니다.");
		doc.unitprice.focus();
		return false;
	}else{
		doc.submit();
	}
}

</script>
</head>
<body>
<%@ include file="header.jsp"%>
<%@ include file="nav.jsp"%>
<%@ include file="DBConn.jsp"%>
<section id="sec1">
<h2>상품 등록 화면</h2>
<hr>
<form name="form" method="post" action="addProductProcess.jsp">
<table border="1" id="tab1">
<tr>
	<th class="th1">상품코드</th>
		<td> <input type="text" name="productId" ></td>
		</tr>
<tr>
	<th class="th1">상품명</th>
		<td> <input type="text" name="name" ></td>
		</tr>
<tr>
	<th class="th1">가격</th>
		<td> <input type="text" name="unitprice" ></td>
		</tr>
<tr>
	<th class="th1">상세정보</th>
		<td> <input type="text" name="description" ></td>
		</tr>

<tr>
	<th class="th1">제조사</th>
		<td> <input type="text" name="manufacturer" ></td>
		</tr>
<tr>
	<th class="th1">분 류</th>
		<td> <input type="text" name="category" ></td>
		</tr>
<tr>
	<th class="th1">재고수</th>
		<td> <input type="text" name="unitsInstock" ></td>
		</tr>		
<tr>
	<th class="th1">상 태</th>
		<td> <input type="radio" name="condition" value="신규 제품" checked>신규 제품
			<input type="radio" name="condition" value="중고 제품">중고 제품
			<input type="radio" name="condition" value="재생 제품">재생 제품
		</td>
		</tr>		
<tr>
<td colspan="2" class="td1">
<input type="button" value="등록" onclick="check()" class="bt1"> 
<input type="button" value="취소" onclick="location.href='index.jsp'" class="bt1">
</td>
</tr>
</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp"%>
</body>
</html>