<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="kr.or.ddit.vo.LprodVO"%>
<%@page import="kr.or.ddit.vo.PagingInfoVO"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	PagingInfoVO<ProdVO> pagingVO = (PagingInfoVO)request.getAttribute("pagingVO");
	List<ProdVO> prodList = pagingVO.getDataList();
	
	List<Map<String, Object>>lprodList = (List)request.getAttribute("lprodList");
	List<BuyerVO>buyerList = (List)request.getAttribute("buyerList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script type="text/javascript" 
	src="<%=request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script type="text/javascript">
	function <%=pagingVO.getFuncName() %>(page) {
		$("[name='searchForm']").find("[name=page]").val(page);
// 		document.searchForm.page.value=page;
		$("[name='searchForm']").submit(); //이벤트 발샐??
// 		document.searchForm.submit(); 함수 하나만 호출하고 끝
	}
	
	$(function() {
<%-- 		$("[name='prod_lgu']").val("<%=pagingVO%>"); --%>
		var prod_lguTag = $("[name='prod_lgu']");
		var prod_buyerTag = $("[name='prod_buyer']");
		prod_lguTag.val("${pagingVO.searchVO.prod_lgu}");
		prod_buyerTag.val("${pagingVO.searchVO.prod_buyer}");
		prod_lguTag.on("change", function(){
			var lprod_gu = $(this).val();
			var buyerOptions = prod_buyerTag.find("option");
			$(buyerOptions).hide();
			if(lprod_gu){
				var buyerOptions2 = prod_buyerTag.find("option."+lprod_gu);
				$(buyerOptions2).show();
			}else{
				$(buyerOptions).show();
			}
			
		});
		var listBody = $("#listBody");
		listBody.on("click","tr", function(){
			var prod_id = $(this).find("td:first").text();//find()는 자식중에서 특정조건에 맞는 것을 찾아온다
			location.href = "<%= request.getContextPath()%>/prod/prodView.do?what="+prod_id; //클라이언트가 사용
		});
		
		var pattern = "";
		$("[name='searchForm']").on("submit", function(event){<!-- 	onsubmit="return false;" -->
			event.preventDefault();//form은 기본적으로 동기전송방식인데 그거 없애는거
			var data = $(this).serialize(); //queryString 생성
// 			{
// 				prod_lgu: dff
// 				prod_buyer: fdfsfd
				
// 			}
			$.ajax({
// 				url : "", //어디로 요청을 보내는지 생략가능한건 현재 브라우저의 주소 사용
// 				method : "", //디폴트는 get방식
				data:data,//어떤 데이터를 보내는지 위의 쿼리스트링을 넣어준다
				dataType : "json", //Accept/Content-type
				success : function(resp) {//응답데이터가 언마샬링 된거 resp는 pagingVO
					var prodList = resp.dataList;
					var html = "";
					if(prodList){
						$.each(prodList, function(idx, prod){
							html += "<tr>";
							html += "<td>"+prod.prod_id+"</td>";
							html += "<td>"+prod.prod_name+"</td>";
							html += "<td>"+prod.lprod_nm+"</td>";
							html += "<td>"+prod.buyer_name+"</td>";
							html += "<td>"+prod.prod_price+"</td>";
							html += "<td>"+prod.prod_outline+"</td>";
							html += "<td>"+prod.prod_mileage+"</td>";
							html += "</tr>";
						});
					}else{
						html += "<tr><td colspan='7'>상품이 없습니다 </td></tr>";
					}
					listBody.html(html);
					$("#pagingArea").html(resp.pagingHTML);
					$("[name='page']").val("");
				},
				error : function(resp) {

				}
			});
			return false;
		});
	});
</script>
</head>
<body>
	<!-- 스크린사이즈 7 -->
	<!-- 블럭사이즈 4 -->

	<form name="searchForm" >
	<input type="text" name="page"/>
	<select name="prod_lgu">
<!-- 		<option value="p101">전자제품</option> -->
		<option value="">분류선택</option>
		<%
			for(Map<String, Object> lprod : lprodList){
				%>
				<option value="<%=lprod.get("LPROD_GU")%>"><%=lprod.get("lprod_nm")%></option>
				<%
			}
		%>
	</select>
	<select name="prod_buyer">
<!-- 		<option value="p10101">삼성전자</option> -->
		<option value="">거래처선택</option>
		<%
			for(BuyerVO buyer : buyerList){
				%>
					<option value="<%=buyer.getBuyer_id()%>" class="<%=buyer.getBuyer_lgu()%>"><%=buyer.getBuyer_name() %></option>
				<% 
			}
		%>
	</select>
<%-- 	<input type="text" name="prod_name" value="<%= pagingVO.getSearchVO().getProd_name()%>"/> --%>
	<input type="text" name="prod_name" value="${pagingVO.searchVO.prod_name}"/>
	<input type="submit" value="검색"/>
	</form>
	<input type="button" class="btn btn-info" value="신규상품등록" 
		onclick="location.href='<%=request.getContextPath()%>/prod/prodInsert.do';"/>
	<table class="table">
		<thead>
			<tr>
				<th>상품코드</th>
				<th>상품명</th>
				<th>분류명</th>
				<th>거래처명</th>
				<th>판매가</th>
				<th>상품개요</th>
				<th>마일리지</th>
			</tr>
		</thead>

		<tbody id="listBody">
			<%
        		if(prodList.size()>0){
           			for(ProdVO prod:prodList){
           				%>
           				<tr>
           					<td><%=prod.getProd_id() %></td>   
               				<td><%=prod.getProd_name() %></td>   
               				<td><%=prod.getLprod_nm() %></td>   
               				<td><%=prod.getBuyer_name() %></td>   
               				<td><%=prod.getProd_price() %></td>   
              				<td><%=prod.getProd_outline() %></td>   
               				<td><%=prod.getProd_mileage() %></td>
           				</tr>
           				<% 
          			}
       			}else{
           			%>
           			<tr>
           				<td colspan="7"> 조건에 맞는 상품이 없습니다 ㅜㅠ</td>
           			</tr>
           			<% 
        		}
		%>
			
		</tbody>

		<tfoot>
			<tr>
				<td colspan="7">
				
				<nav aria-label="Page navigation example" id="pagingArea">
                   <%= pagingVO.getPagingHTML() %>
               </nav>
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>