package kr.or.ddit.buyer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.mvc.ICommandHandler;

public class BuyerUpdateController implements ICommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		//수정할때 입력한 값을 담아준 MemberVO를 가져온다
		//B.L.L과의 의존관계 형성
		//그 vo를 서비스로 보내준다
		//serviceresult값에 따라 보여주는 페이지와 방식을 지정해준다
		return null;
	}

}
