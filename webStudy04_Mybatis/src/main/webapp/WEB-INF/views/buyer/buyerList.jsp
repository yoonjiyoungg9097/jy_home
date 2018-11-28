<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="kr.or.ddit.vo.PagingInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PagingInfoVO pagingVO=(PagingInfoVO) request.getAttribute("pagingVO");
	
	List<BuyerVO>buyerList = (List<BuyerVO>)request.getAttribute("buyerList");//db에서 가져온 10명의 정보들
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buyer/buyerList.jsp</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script type="text/javascript" 
	src="<%=request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>
<body>
<h4>buyer 목록</h4>
<input type="button" class="button" value="신규등록"
	onclick="location.href='<%=request.getContextPath()%>/buyer/buyerInsert.do';"	
/>
<table class="table">
	<thead class="thead-dark">
		<tr>
			<th>판매처아이디</th>
			<th>판매처명</th>
			<th>주소</th>
			<th>전화번호</th>
			<th>이메일</th>
		</tr>
	</thead>
	
	<tbody>
		<%
		String pattern = "<tr class='info'><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></td>";
        if(buyerList.size()!=0){
           for(BuyerVO buyer:buyerList){
        	   out.print(String.format(pattern, buyer.getBuyer_id(),"<a href="+request.getContextPath()+"/buyer/buyerView.do?who="+buyer.getBuyer_id()+">"+buyer.getBuyer_name()+"</a>",buyer.getBuyer_add1()+buyer.getBuyer_add2(),buyer.getBuyer_comtel(), buyer.getBuyer_mail()));
           }
        }else{
           out.print("판매처 목록 0");
        }
		%>
	</tbody>
	<tfoot>
		<tr>
             <td colspan='5'>
                <nav aria-label="Page navigation example">
                   <%= pagingVO.getPagingHTML() %>
               </nav>
             </td>
          </tr>
	</tfoot>
</table>
</body>
</html>