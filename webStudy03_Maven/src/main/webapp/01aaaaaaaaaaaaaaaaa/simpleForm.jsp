<%@page import="java.util.LinkedHashMap"%>
<%@page import="kr.or.ddit.vo.AlbasengVO"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
<%-- <%@page import="kr.or.ddit.web.SimpleFormProcessServlet"%> --%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 	Map<String, String> gradeMap = (Map<String, String>)application.getAttribute("gradeMap");
// 	Map<String, String> licenseMap = (Map<String, String>)application.getAttribute("licenseMap");
// 	AlbasengVO albaVO = (AlbasengVO)request.getAttribute("albaVO");
// 	Map<String,String>errors =  (Map<String,String>)request.getAttribute("errors");
// 	if(albaVO==null) albaVO = new AlbasengVO();
// 	if(errors==null) errors = new LinkedHashMap<>();
	
// 	String name = request.getParameter("name");
// 	String age = request.getParameter("age");
// 	String tel = request.getParameter("tel");
// 	String addr = request.getParameter("address");
// 	String gender = request.getParameter("gender");
// 	String grade = request.getParameter("grade");
// 	String career = request.getParameter("career");
// 	String[] license = request.getParameterValues("license");
%>
<jsp:useBean id="gradeMap" class="java.util.HashMap" scope="application"></jsp:useBean>
<<jsp:useBean id="licenseMap" class="java.util.LinkedHashMap" scope="application"></jsp:useBean>
<jsp:useBean id="albaVO" class="kr.or.ddit.vo.AlbasengVO" scope="request"></jsp:useBean>
<jsp:useBean id="errors" class="java.util.LinkedHashMap" scope="request"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.error{/* span에 class로 error를 지정해주고 거기에 style을 준다 */
		color: red;
	}
</style>
</head>
<body>
<!-- 알바몬에서 알바생의 프로필을 입력받으려고 함. -->
<!-- 이름, 나이, 주소, 전번, 성별,  -->
<!-- 경력, 학력, 자기소개서, 자격증 -->
<form action="<%=request.getContextPath()%>/albamon" method="post">
<table>
	<tr>
		<th>이름</th>
		<td>
			<input type="text" name="name" value="<%=Objects.toString(albaVO.getName(), "") %>" <%-- required="required" --%>/>
			<span class="error">
				<%=Objects.toString(errors.get("name"),"") %>
			</span>
		</td>
	</tr>
	
	<tr>
		<th>나이</th>
		<td>
			<input type="number" name="age" min="15" max="40"
				value="<%=Objects.toString(albaVO.getAge(), "") %>"/> <%-- 입력한 값이 올바르지 않을때 그 값을 유지하는데 만약 뒤에 ""가 없다면 null이 뜨게 된다 우리는 ""지정했기 때문에 칸이 비워진다 --%>
		</td>
	</tr>
	
	<tr>
		<th>전번</th>
		<td>
			<input type="text" name="tel" placeholder="000-0000-0000"
				pattern="\d{3}-\d{3,4}-\d{4}" value="<%=Objects.toString(albaVO.getTel(),"") %>" required="required"/>
			<span class="error">
				<%=Objects.toString(errors.get("tel"),"") %>
			</span>
		</td>
	</tr>
	
	<tr>
		<th>주소</th>
		<td>
			<input type="text" name="address"  value="<%=Objects.toString(albaVO.getAddress(),"") %>" required="required"/>
			<span class="error">
				<%=Objects.toString(errors.get("address"),"") %>
			</span>
		</td>
	</tr>
	
	<tr>
		<th>성별</th>
		<td>
			<label><input type="radio" name="gender" value="M"
						<%-- checked="checked" --%><%="M".equals(albaVO.getGender())?"checked":"" %> />남</label>
			<label><input type="radio" name="gender" value="F" checked="checked"
						<%="F".equals(albaVO.getGender())?"checked":"" %>/>여</label>
		</td>
	</tr>
	
	<tr>
		<th>학력</th>
		<td>
			<select name="grade">
				<option value="">학력</option>
				<%
					String pattern = "<option value='%s' %s> %s </option>";
// 							for(Entry<String,String> entry : gradeMap.entrySet()){
							for(Object obj : gradeMap.entrySet()){
								Entry entry = (Entry)obj;
								String selected = "";
								if(entry.getKey().equals(albaVO.getGrade())){//내가 이전에 입력했었던 학력?
									selected = "selected";
								}
								out.println(String.format(pattern,entry.getKey(), selected,entry.getValue()));
							}
				%>
			</select>
		</td>
	</tr>	
	
	<tr>
		<th>경력</th>
		<td>
			<textarea rows="3" cols="100" name="career"><%=Objects.toString(albaVO.getCareer(),"") %></textarea>
		</td>
	</tr>
	
	<tr>
		<th>자격증</th>
		<td>
			<select name="license" multiple="multiple" size="10">
				<option value="">자격증 </option>
				<%
					if(albaVO.getLicense()!=null){
						Arrays.sort(albaVO.getLicense());
					}
					for(Object obj : licenseMap.entrySet()){
						Entry entry = (Entry)obj;
						String selected = "";
						if(albaVO.getLicense()!=null &&  Arrays.binarySearch(albaVO.getLicense(), entry.getKey())>-1){//찾았을때
							selected = "selected";
						}
								out.println(String.format(pattern,entry.getKey(),selected,entry.getValue()));
							}
				%>
			</select>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<input type="submit" value="등록">
			<input type="reset" value="취소">
			<input type="button" value="버튼아닌버튼">
		</td>
	</tr>
	
	
</table>
</form>
</body>
</html>