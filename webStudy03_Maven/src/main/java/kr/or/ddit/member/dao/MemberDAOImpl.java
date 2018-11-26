package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.db.ibatis.CustomSqlMapClientBuilder;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingInfoVO;

public class MemberDAOImpl implements IMemberDAO {

	SqlMapClient sqlMapClient = CustomSqlMapClientBuilder.getSqlMapClient(); //팩토리의 역할
	@Override
	public MemberVO selectMember(String mem_id) {
		try {
			MemberVO member = (MemberVO) sqlMapClient.queryForObject("Member.selectMember", mem_id);
			return member;
		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	@Override
	public int insertMember(MemberVO member) {
		try {	//insert이지만 update나 delete를 써도 상관없다 왜?
				return sqlMapClient.update("Member.insertMember", member);
			}catch (SQLException e) {
				throw new RuntimeException(e);
			}
	}
	
	@Override
	public List<MemberVO> selectMemberList(PagingInfoVO pagingVO) {
		try {
			return sqlMapClient.queryForList("Member.selectAllMember",pagingVO);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	@Override
	public int updateMember(MemberVO member) {
		try {
			return sqlMapClient.update("Member.updateMember",member);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	@Override
	public int deleteMember(String mem_id) {
		try {
			return sqlMapClient.delete("Member.deleteMember", mem_id);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	@Override
	public long selectTotalRecord(PagingInfoVO pagingVO) {
		try {
				return (Long)sqlMapClient.queryForObject("Member.selectTotalRecord",pagingVO);
			}catch (SQLException e) {
				throw new RuntimeException(e);
			}
	}

}
