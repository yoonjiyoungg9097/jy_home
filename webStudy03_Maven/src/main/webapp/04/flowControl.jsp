<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04/flowControl.jsp</title>
</head>
<body>
	<h4>흐름제어 (페이지 이동)</h4>
	<pre>
		1. Request Dispatch : 원본 요청에 대한 정보를 페이지를 이동하는 과정에서 전달해주는 방식.
			1) Forward : 페이지를 이동한 이후 최종 도착지에서 응답데이터가 전송
			<%
				//request가 클라이언트에서 실행되는지 서버에서 실행되는지에 따라 클라이언트 사이드 서버 사이드로 나뉨
// 				RequestDispatcher rd = request.getRequestDispatcher("/05/destination.jsp"); //도착지에 대한 정보를 파라미터로
// 				rd.forward(request, response);
			%>
			
			
			2) Include : 페이지를 이동한 후 도착지에서 생성된 결과데이터(버퍼의 내용)을 가지고,
						출발지(시작페이지)로 다시 돌아오는 구조.
						최종 응답데이터는 시작페이지에서 전송.
			<%
// 				rd.include(request, response);			
			%>		
			
				
		2. Redirect 
			1) 원본 요청이 시작페이지로 전송
			2) 해당 페이지에서 Body 가 없고, 
				상태코드(302/307), Location 헤더를 가지고 응답 전송
				Stateless 특성에 따라 서버에서는 최초의 요청 정보가 삭제.
			3) 클라이언트쪽에서 Location 방향으로 새로운 요청이 발생.
			4) 최종 응답데이터는 3) 번의 새로운 요청에 대한 응답으로 전송.
			<%
				//이 주소는 클라이언트로 전송되어 다시 브라우저가 요청보내니까(쓰니까) 클라이언트 사이드
				response.sendRedirect(request.getContextPath()+ "/05/destination.jsp"); 
			%>
	</pre>
</body>
</html>








