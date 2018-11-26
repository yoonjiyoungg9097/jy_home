package kr.or.ddit.buyer.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.buyer.service.BuyerServiceImpl;
import kr.or.ddit.buyer.service.IBuyerService;
import kr.or.ddit.mvc.ICommandHandler;
import kr.or.ddit.vo.BuyerVO;

public class BuyerDeleteController implements ICommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		//아이디를 요청받아온다
		String buyer_id = req.getParameter("who");
		Map<String, String> message = new LinkedHashMap<>();
		//아이디 null검증
		if(StringUtils.isBlank(buyer_id)) {
			message.put("", "");
		}
		//B.L.L 과의 의존관계 형성
		IBuyerService service = new BuyerServiceImpl();
		//service를 통해 받아오는 ServiceResult값을 가져온다
		ServiceResult result = service.removeBuyer(buyer_id);
		if(result.equals("PKNOTFOUND")) {
			message = "존재하지 않는 아이디 입니다ㅜㅠ";
		}else if(result.equals("OK")) {
			//OK일때 delete성공 메세지 dispatcher방식(돌려줄 값이 없기 때문에)
			message = "삭제성공이다!!";
		}else if(result.equals("FAILED")) {
			//FAILED일때 서버 오류 메세지 이때 request스코프 영역에 삭제에 실패한 아이디를 담아준다 redirect방식
			message = "서버 오류로 인해 삭제 실패되었으니 다시 시도해주세요 ㅜㅠ";
		}
		
		return null;
	}

}
