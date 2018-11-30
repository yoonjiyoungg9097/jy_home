package kr.or.ddit.buyer.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


import kr.or.ddit.mybatis.CustomSqlSessionFactoryBuilder;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.PagingInfoVO;

public class BuyerDAOImpl implements IBuyerDAO{

	@Override
	public List<BuyerVO> selectBuyerList(PagingInfoVO pagingVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long selectTotalRecord() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BuyerVO selectBuyer(String buyer_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBuyer(BuyerVO buyer) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBuyer(String buyer_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBuyer(BuyerVO buyer) {
		// TODO Auto-generated method stub
		return 0;
	}
}
