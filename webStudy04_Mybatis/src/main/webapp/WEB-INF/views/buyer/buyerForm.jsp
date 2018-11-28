<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	BuyerVO buyer = new BuyerVO();
	Map<String,String>errors = new HashMap();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> k rel="stylesheet"
href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://jqueryui.com/resources/demos/style.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
</head>
<body>
	<table>
		<tr>
			<th>활동여부</th>
			<td><input type="text" name="buyer_delete"
				value="<%=buyer.getBuyer_delete()%>" /><span class="error"><%=errors.get("buyer_delete")%></span></td>
		</tr>
		<tr>
			<th>판매자아이디</th>
			<td><input type="text" name="buyer_id"
				value="<%=buyer.getBuyer_id()%>" /><span class="error"><%=errors.get("buyer_id")%></span></td>
		</tr>
		<tr>
			<th>판매처명</th>
			<td><input type="text" name="buyer_name"
				value="<%=buyer.getBuyer_name()%>" /><span class="error"><%=errors.get("buyer_name")%></span></td>
		</tr>
		<tr>
			<th>엘지유</th>
			<td><input type="text" name="buyer_lgu"
				value="<%=buyer.getBuyer_lgu()%>" /><span class="error"><%=errors.get("buyer_lgu")%></span></td>
		</tr>
		<tr>
			<th>은행</th>
			<td><input type="text" name="buyer_bank"
				value="<%=buyer.getBuyer_bank()%>" /><span class="error"><%=errors.get("buyer_bank")%></span></td>
		</tr>
		<tr>
			<th>계좌번호</th>
			<td><input type="text" name="buyer_bankno"
				value="<%=buyer.getBuyer_bankno()%>" /><span class="error"><%=errors.get("buyer_bankno")%></span></td>
		</tr>
		<tr>
			<th>판매자명</th>
			<td><input type="text" name="buyer_bankname"
				value="<%=buyer.getBuyer_bankname()%>" /><span class="error"><%=errors.get("buyer_bankname")%></span></td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td><input type="text" name="buyer_zip"
				value="<%=buyer.getBuyer_zip()%>" /><span class="error"><%=errors.get("buyer_zip")%></span></td>
		</tr>
		<tr>
			<th>주소1</th>
			<td><input type="text" name="buyer_add1"
				value="<%=buyer.getBuyer_add1()%>" /><span class="error"><%=errors.get("buyer_add1")%></span></td>
		</tr>
		<tr>
			<th>주소2</th>
			<td><input type="text" name="buyer_add2"
				value="<%=buyer.getBuyer_add2()%>" /><span class="error"><%=errors.get("buyer_add2")%></span></td>
		</tr>
		<tr>
			<th>전번</th>
			<td><input type="text" name="buyer_comtel"
				value="<%=buyer.getBuyer_comtel()%>" /><span class="error"><%=errors.get("buyer_comtel")%></span></td>
		</tr>
		<tr>
			<th>팩스</th>
			<td><input type="text" name="buyer_fax"
				value="<%=buyer.getBuyer_fax()%>" /><span class="error"><%=errors.get("buyer_fax")%></span></td>
		</tr>
		<tr>
			<th>이멜</th>
			<td><input type="text" name="buyer_mail"
				value="<%=buyer.getBuyer_mail()%>" /><span class="error"><%=errors.get("buyer_mail")%></span></td>
		</tr>
		<tr>
			<th>뭔구</th>
			<td><input type="text" name="buyer_charger"
				value="<%=buyer.getBuyer_charger()%>" /><span class="error"><%=errors.get("buyer_charger")%></span></td>
		</tr>
	</table>
</body>
</html>