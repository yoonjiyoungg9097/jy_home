package kr.or.ddit.buyer.service;

import java.util.List;

import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.PagingInfoVO;

public interface IBuyerService {
	public List<BuyerVO> retrieveBuyerList(PagingInfoVO pagingVO);
	
	public long selectTotalRecord();
	
	public BuyerVO retrieveBuyer(String buyer_id);
}
