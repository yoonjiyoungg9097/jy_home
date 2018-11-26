package kr.or.ddit.buyer.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
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

	@Override
	public ServiceResult registBuyer(BuyerVO buyer) {
		ServiceResult result = null;
		return null;
	}

	@Override
	public ServiceResult removeBuyer(String buyer_id) {
		//한명의 buyer만 가져와서 db에 있는 buyer라면 삭제를 해주지만
		//존재하지 않는 buyer라면 삭제를 해줄 수 없다
		BuyerVO buyer = dao.selectBuyer(buyer_id);
		ServiceResult result = null;
		if(buyer==null) {
			result = ServiceResult.PKNOTFOUND;
		}else {
			int delResult = dao.deleteBuyer(buyer_id);
			if(delResult>0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
		}
		return result;
	}
}
