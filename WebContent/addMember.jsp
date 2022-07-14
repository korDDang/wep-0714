<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function mailch(){
	var doc=document.form;
	if(doc.mail2.options[doc.mail2.selectedIndex].value=="0"){
		doc.mail1.disabled=true;
		doc.mail1.value="";
	}else if(doc.mail2.options[doc.mail2.selectedIndex].value=="9"){
		doc.mail1.disabled=false;
		doc.mail1.value="";
	}else{
		doc.mail1.disabled=true;
		doc.mail1.value=doc.mail2.options[doc.mail2.selectedIndex].value;
	}
}
function check() {
	var doc=document.form;
	if(doc.name.value==""){
		alert("이름을 입력하세요");
		doc.name.focus();
		return false;
	}if(doc.password.value==""){
		alert("비밀번호를 입력하세요");
		doc.password.focus();
		return false;
	}if(doc.passchk.value==""){
		alert("확인비밀번호을 입력하세요");
		doc.passchk.focus();
		return false;
	}if(doc.password.value!=doc.passchk.value){
		alert("비밀번호를 동일하게 입력하세요");
		doc.password.focus();
		return false;
	}else{
		doc.mail1.disabled=false;
		doc.submit();
	}
}

</script>
</head>
<body>
<%@ include file="header.jsp"%>
<%@ include file="nav.jsp"%>
<%@ include file="DBConn.jsp"%>
<%
int ma=0;
try{
	String sql="select max(id) from member0714";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		ma=rs.getInt(1)+1;
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<section id="sec1">
<h2>회원 가입 등록화면</h2>
<hr>
<form name="form" method="post" action="addMemberProcess.jsp">
<table border="1" id="tab1">
<tr>
	<th class="th1">아이디</th>
		<td> <input type="text" name="id" value="<%=ma %>"></td>
		</tr>
<tr>
	<th class="th1">성 명</th>
		<td> <input type="text" name="name" ></td>
		</tr>
<tr>
	<th class="th1">비밀번호</th>
		<td> <input type="text" name="password" ></td>
		</tr>
<tr>
	<th class="th1">비밀번호 확인</th>
		<td> <input type="text" name="passchk" ></td>
		</tr>
<tr>
	<th class="th1">성 별</th>
		<td> <input type="radio" name="gender" value="남성" checked>남성
			<input type="radio" name="gender" value="여성">여성
		</td>
		</tr>
<tr>
	<th class="th1">생 일</th>
		<td> <input type="text" name="birth" >
<select name="birth1">
<option value="01">1월</option>
<option value="02">2월</option>
<option value="03">3월</option>
<option value="04">4월</option>
<option value="05">5월</option>
<option value="06">6월</option>
<option value="07">7월</option>
<option value="08">8월</option>
<option value="09">9월</option>
<option value="10">10월</option>
<option value="11">11월</option>
</select>월
<select name="birth2" >
<option value="01">1일</option>
<option value="02">2일</option>
<option value="03">3일</option>
<option value="04">4일</option>
<option value="05">5일</option>
<option value="06">6일</option>
<option value="07">7일</option>
<option value="08">8일</option>
<option value="09">9일</option>
<option value="10">10일</option>
<option value="11">11일</option>
<option value="12">12일</option>
<option value="13">13일</option>
<option value="14">14일</option>
<option value="15">15일</option>
<option value="16">16일</option>
<option value="17">17일</option>
<option value="18">18일</option>
<option value="19">19일</option>
<option value="20">20일</option>
<option value="21">21일</option>
<option value="22">22일</option>
<option value="23">23일</option>
<option value="24">24일</option>
<option value="25">25일</option>
<option value="26">26일</option>
<option value="27">27일</option>
<option value="28">28일</option>
<option value="29">29일</option>
<option value="30">30일</option>
<option value="31">31일</option>
</select>일
 </td>
</tr>		
<tr>
<th class="th1">이메일</th>
<td> 
<input type="text" name="mail">@
<input type="text" name="mail1" value="" disabled>
<select name="mail2" onchange="mailch()">
<option value="0">선택하세요</option>
<option value="9">직접입력</option>
<option value="hanmail.net">hanmail.net</option>
<option value="naver.com">naver.com</option>
<option value="daum.net">daum.net</option>
</select>
</td>
</tr>
<tr>
	<th class="th1">연락처</th>
		<td> <input type="text" name="phone" ></td>
		</tr>
<tr>
	<th class="th1">주소</th>
		<td> <input type="text" name="address" ></td>
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