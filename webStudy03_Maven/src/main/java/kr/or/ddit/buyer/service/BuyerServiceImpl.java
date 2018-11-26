package kr.or.ddit.buyer.service;

import java.util.List;

import kr.or.ddit.buyer.dao.BuyerDAOImpl;
import kr.or.ddit.buyer.dao.IBuyerDAO;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.PagingInfoVO;

public class BuyerServiceImpl implements IBuyerService{
	//dao에 접근하기 위한 객체 생성해주는 부분
	IBuyerDAO dao = new BuyerDAOImpl();

	@Override
	public List<BuyerVO> retrieveBuyerList(PagingInfoVO pagingVO) {
		return dao.selectBuyerList(pagingVO);
	}

	@Override
	public long selectTotalRecord() {
		return dao.selectTotalRecord();
	}

	@Override
	public BuyerVO retrieveBuyer(String buyer_id) {
		return dao.selectBuyer(buyer_id);
	}

}
