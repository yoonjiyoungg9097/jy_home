package kr.or.ddit.buyer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.buyer.service.BuyerServiceImpl;
import kr.or.ddit.buyer.service.IBuyerService;
import kr.or.ddit.mvc.ICommandHandler;
import kr.or.ddit.vo.BuyerVO;

public class BuyerUpdateController implements ICommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		//모든정보를 받아와요
		//B.L.L과의 의존관계 형성
		BuyerVO buyer = new BuyerVO();
		IBuyerService service = new BuyerServiceImpl();
		//그 받은 정보를 service로 보내준다
		service.modifyBuyer(buyer);
		//그 serviceresult값에 따라 이동방식과 보여줄 페이지를 보내준다
		return null;
	}

}
