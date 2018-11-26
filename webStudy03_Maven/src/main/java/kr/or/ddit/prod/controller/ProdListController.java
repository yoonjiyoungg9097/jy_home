package kr.or.ddit.prod.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.mvc.ICommandHandler;
import kr.or.ddit.prod.dao.IOtherDAO;
import kr.or.ddit.prod.dao.OtherDAOImpl;
import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.PagingInfoVO;
import kr.or.ddit.vo.ProdVO;

public class ProdListController implements ICommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		//제일 먼저 시작하는 페이지는 1이므로 currentPage=1
		int currentPage = 1;
		//만약 선택한 페이지가 있을때는 그 선택한 페이지를 요청받는다
		ProdVO searchVO = new ProdVO();
		searchVO.setProd_lgu(req.getParameter("prod_lgu"));
		searchVO.setProd_buyer(req.getParameter("prod_buyer"));
		searchVO.setProd_name(req.getParameter("prod_name"));
		
		String page = req.getParameter("page");
		if(StringUtils.isNumeric(page)) {
			currentPage = Integer.parseInt(page);
		}
		//모든 record수를 계산해주는 totalRecord로 그 값을 받아와 전체 페이지수를 정해준다
		PagingInfoVO<ProdVO> pagingVO = new PagingInfoVO<>(7,4);
		pagingVO.setSearchVO(searchVO);
		//currentpage를 파라미터로 받는 paginvo에 그 값을 전달해준다
		pagingVO.setCurrentPage(currentPage);
		
		IProdService service = new ProdServiceImpl();
		IOtherDAO otherDAO = new OtherDAOImpl();
		Map<String, String>lprodList = otherDAO.selectLprodList();
		List<BuyerVO>buyerList = otherDAO.selectBuyerList(null);
		req.setAttribute("lprodList", lprodList);
		req.setAttribute("buyerList", buyerList);
		
		long totalRecord = service.retrieveProdCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		
		//서비스로 페이징vo를 보내주어 그 값을 List<prodVO>타입으로 받아온다
		List<ProdVO>prodList = service.retrieveProdList(pagingVO);
		
		
		//request 스코프 영역에 pagingVO로 담아준다
		req.setAttribute("prodList", prodList);
		req.setAttribute("pagingVO", pagingVO);
		
		
		
//		if(req.getParameter("page")!=null) {//null검증은 하지 않아도 isNumeric메서드 안에 값이 null일때 false
//			if(StringUtils.isNumeric(req.getParameter("page"))) {
//				currentPage = Integer.parseInt(req.getParameter("page"));
//			}
//		}
		return "prod/prodList";
	}
}
