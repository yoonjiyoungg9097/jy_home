<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.LprodVO"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>>lprodList	 = (List)request.getAttribute("lprodList");
%>
<jsp:useBean id="prod" class="kr.or.ddit.vo.ProdVO" scope="request"></jsp:useBean>
<jsp:useBean id="errors" class="java.util.HashMap" scope="request"></jsp:useBean>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">
<script type="text/javascript" 
	src="<%=request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function(){
	<%
		String message = (String)request.getAttribute("message");
		if(StringUtils.isNotBlank(message)){
			%>
			alert("<%=message%>");
			<%
		}
	%>
	$("[name$='date']").datepicker({
		dateFormat:"yy-mm-dd"
	});
	var pattern ="<option value='%V'>%T</option>";
	var prod_buyerTag = $("[name='prod_buyer']"); //prod_buyer라는 이름을 가진곳으로 html코드를 보내준다
	var prod_lguTag = $("[name='prod_lgu']");
	
	prod_lguTag.on("change", function(){
		var prod_lgu = $(this).val();
		$.ajax({
			url : "<%=request.getContextPath()%>/prod/getBuyerList.do",
			data : {
				prod_lgu:prod_lgu //파라미터명:값
			},
			dataType : "json", //Accept, Content-Type 응답헤더
			success : function(resp) {
				var options = "";
				$.each(resp,function(idx, buyer){//resp는 배열, 우리가 받아온 json객체 idx는 index
					options += pattern.replace("%V", buyer.buyer_id)
									 .replace("%T", buyer.buyer_name);
				});
				prod_buyerTag.html(options);
				prod_buyerTag.val("<%=prod.getProd_buyer()%>");
			},
			error : function(resp) {

			}
		});
		});
	
	prod_lguTag.val("<%=prod.getProd_lgu()%>"); /* 초기값 설정 */
	prod_lguTag.trigger("change");//이벤트 강제로 발생
	
	});
	
</script>
</head>
<body>
	
	<form method="post">
	<input type="hidden" name="prod_id" value="<%=prod.getProd_id()%>"/>
	<table>
		<!-- 		<tr> -->
		<!-- 			<th>상품아이디</th> -->
		<!-- 			<td> -->
		<%-- 				<input type="text" name="prod_id" value="<%= prod.getProd_id()%>"/> --%>
		<%-- 				<span class="error"><%= %></span> --%>
		<!-- 			</td> -->
		<!-- 		</tr> -->
<!-- 		<tr> 직접입력금지--> 
<!-- 			<th>상품코드</th> -->
<!-- 			<td><input type="text" name="prod_id" -->
<%-- 				value="<%=prod.getProd_id()%>" /><span class="error"><%=errors.get("prod_id")%></span></td> --%>
<!-- 		</tr> -->
		<tr>
			<th>상품명</th>
			<td><input type="text" name="prod_name"
				value="<%=prod.getProd_name()%>" /><span class="error"><%=errors.get("prod_name")%></span></td>
		</tr>
		<tr>
			<th>분류코드</th>
			<td>
				<div class="input-group">
					<select name="prod_lgu">
						<option value="">분류선택</option>
						<%
							for(Map<String,Object> lprod : lprodList){
								%>
								<option value='<%= lprod.get("LPROD_GU") %>'> <%= lprod.get("lprod_nm") %></option>
								<%
							}
						%>
					</select>
				</div>
			</td>
		</tr>
		<tr>
			<th>판매자</th>
			<td>
			<select name="prod_buyer">
			</select>
			</td>
		</tr>
		<tr>
			<th>매입가</th>
			<td><input type="text" name="prod_cost"
				value="<%=prod.getProd_cost()%>" /><span class="error"><%=errors.get("prod_cost")%></span></td>
		</tr>
		<tr>
			<th>판매가</th>
			<td><input type="text" name="prod_price"
				value="<%=prod.getProd_price()%>" /><span class="error"><%=errors.get("prod_price")%></span></td>
		</tr>
		<tr>
			<th>특가</th>
			<td><input type="text" name="prod_sale"
				value="<%=prod.getProd_sale()%>" /><span class="error"><%=errors.get("prod_sale")%></span></td>
		</tr>
		<tr>
			<th>상품정보</th>
			<td><input type="text" name="prod_outline"
				value="<%=prod.getProd_outline()%>" /><span class="error"><%=errors.get("prod_outline")%></span></td>
		</tr>
		<tr>
			<th>디테일</th>
			<td><input type="text" name="prod_detail"
				value="<%=prod.getProd_detail()%>" /><span class="error"><%=errors.get("prod_detail")%></span></td>
		</tr>
		<tr>
			<th>이미지</th>
			<td><input type="text" name="prod_img"
				value="<%=prod.getProd_img()%>" /><span class="error"><%=errors.get("prod_img")%></span></td>
		</tr>
		<tr>
			<th>토탈스톡</th>
			<td><input type="text" name="prod_totalstock"
				value="<%=prod.getProd_totalstock()%>" /><span class="error"><%=errors.get("prod_totalstock")%></span></td>
		</tr>
		<tr>
			<th>입고날자</th>
			<td><input type="text" name="prod_insdate"
				value="<%=prod.getProd_insdate()%>" /><span class="error"><%=errors.get("prod_insdate")%></span></td>
		</tr>
		<tr>
			<th>프롭스톡</th>
			<td><input type="text" name="prod_properstock"
				value="<%=prod.getProd_properstock()%>" /><span class="error"><%=errors.get("prod_properstock")%></span></td>
		</tr>
		<tr>
			<th>사잊브</th>
			<td><input type="text" name="prod_size"
				value="<%=prod.getProd_size()%>" /><span class="error"><%=errors.get("prod_size")%></span></td>
		</tr>
		<tr>
			<th>색</th>
			<td><input type="text" name="prod_color"
				value="<%=prod.getProd_color()%>" /><span class="error"><%=errors.get("prod_color")%></span></td>
		</tr>
		<tr>
			<th>배달</th>
			<td><input type="text" name="prod_delivery"
				value="<%=prod.getProd_delivery()%>" /><span class="error"><%=errors.get("prod_delivery")%></span></td>
		</tr>
		<tr>
			<th>유닛</th>
			<td><input type="text" name="prod_unit"
				value="<%=prod.getProd_unit()%>" /><span class="error"><%=errors.get("prod_unit")%></span></td>
		</tr>
		<tr>
			<th>슈령</th>
			<td><input type="text" name="prod_qtyin"
				value="<%=prod.getProd_qtyin()%>" /><span class="error"><%=errors.get("prod_qtyin")%></span></td>
		</tr>
		<tr>
			<th>스타일</th>
			<td><input type="text" name="prod_qtysale"
				value="<%=prod.getProd_qtysale()%>" /><span class="error"><%=errors.get("prod_qtysale")%></span></td>
		</tr>
		<tr>
			<th>마일리지</th>
			<td><input type="text" name="prod_mileage"
				value="<%=prod.getProd_mileage()%>" /><span class="error"><%=errors.get("prod_mileage")%></span></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="전송"/>
				<input type="reset" value="취소"/>
				<input type="button" value="목록으로"
					onclick="location.href='<%=request.getContextPath()%>/prod/prodList.do';"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>