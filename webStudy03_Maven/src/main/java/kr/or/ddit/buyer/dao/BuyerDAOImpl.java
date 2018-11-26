package kr.or.ddit.buyer.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.db.ibatis.CustomSqlMapClientBuilder;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.PagingInfoVO;

public class BuyerDAOImpl implements IBuyerDAO{
	//SqlMapConfig.xml을 불러와서 connection해주는 부분
	SqlMapClient sqlMapClient = CustomSqlMapClientBuilder.getSqlMapClient();
	@Override
	public List<BuyerVO> selectBuyerList(PagingInfoVO pagingVO) {
		try {
			return sqlMapClient.queryForList("Buyer.selectAllBuyer",pagingVO);
		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	@Override
	public long selectTotalRecord() {
		try {
				return (long) sqlMapClient.queryForObject("Buyer.selectTotalRecord");
			}catch (SQLException e) {
				throw new RuntimeException(e);
			}
	}
	@Override
	public BuyerVO selectBuyer(String buyer_id) {
		try {
				return (BuyerVO) sqlMapClient.queryForObject("Buyer.selectBuyer",buyer_id);
			}catch (SQLException e) {
				throw new RuntimeException(e);
			}
	}
	@Override
	public int insertBuyer(BuyerVO buyer) {
		try {
				return (int) sqlMapClient.queryForObject("Buyer.insertBuyer", buyer);
			}catch (SQLException e) {
				throw new RuntimeException(e);
			}
	}
	@Override
	public int deleteBuyer(String buyer_id) {
		try {
				return sqlMapClient.delete("Buyer.deleteBuyer", buyer_id);
			}catch (SQLException e) {
				throw new RuntimeException(e);
			}
	}
	
}
