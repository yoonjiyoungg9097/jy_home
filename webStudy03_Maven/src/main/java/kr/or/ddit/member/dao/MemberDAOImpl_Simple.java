package kr.or.ddit.member.dao;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.db.ConnectionFactory;
import kr.or.ddit.db.ibatis.SampleDataMapper;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingInfoVO;

public class MemberDAOImpl_Simple implements IMemberDAO {

	@Override
	public MemberVO selectMember(String mem_id) {
		MemberVO member = null;
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT                                     ");
	    sql.append("MEM_ID, MEM_PASS, MEM_NAME, MEM_REGNO1,    ");
	    sql.append("MEM_REGNO2, TO_CHAR(MEM_BIR,'YYYY-MM-DD')MEM_BIR, MEM_ZIP, MEM_ADD1,    ");
	    sql.append("MEM_ADD2, MEM_HOMETEL, MEM_COMTEL, MEM_HP, ");
	    sql.append("MEM_MAIL, MEM_JOB, MEM_LIKE, MEM_MEMORIAL, ");
	    sql.append("TO_CHAR(MEM_MEMORIALDAY,'YYYY-MM-DD')MEM_MEMORIALDAY, MEM_MILEAGE, MEM_DELETE   ");
		sql.append("FROM MEMBER                                ");
		sql.append("WHERE MEM_ID = ?                           ");
		try (Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, mem_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 조회된 결과(ResultSet)를 Java Object로 변환
//				member.setMem_pass(rs.getString("MEM_PASS"));
//				member.setMem_name(rs.getString("MEM_NAME"));
//				member.setMem_regno1(rs.getString("MEM_REGNO1"));
//				member.setMem_regno2(rs.getString("MEM_REGNO2"));
//				member.setMem_bir(rs.getString("MEM_BIR"));
//				member.setMem_zip(rs.getString("MEM_ZIP"));
//				member.setMem_add1(rs.getString("MEM_ADD1"));
//				member.setMem_add2(rs.getString("MEM_ADD2"));
//				member.setMem_hometel(rs.getString("MEM_HOMETEL"));
//				member.setMem_comtel(rs.getString("MEM_COMTEL"));
//				member.setMem_hp(rs.getString("MEM_HP"));
//				member.setMem_mail(rs.getString("MEM_MAIL"));
//				member.setMem_job(rs.getString("MEM_JOB"));
//				member.setMem_like(rs.getString("MEM_LIKE"));
//				member.setMem_memorial(rs.getString("MEM_MEMORIAL"));
//				member.setMem_memorialday(rs.getString("MEM_MEMORIALDAY"));
//				member.setMem_mileage(rs.getLong("MEM_MILEAGE"));
//				member.setMem_delete(rs.getString("MEM_DELETE"));
//				member.setMem_id(rs.getString("MEM_ID"));
//				ResultSetMetaData rsmd = rs.getMetaData();
//				if(rs.next()) {
//					member = MemberVO.class.newInstance();
//				}
//				for(int cnt=1; cnt<=rsmd.getColumnCount(); cnt++) {
//					String colName = rsmd.getColumnName(cnt);
//					
//					try {
//						PropertyDescriptor pd = new PropertyDescriptor(colName.toLowerCase(), MemberVO.class);
//						Method setter = pd.getWriteMethod();
//						Object setterValue = rs.getObject(colName);
//						
//						if(setterValue instanceof CharSequence) {
//							
//						}else if(setterValue instanceof BigDecimal) {
//							setterValue = ((BigDecimal)setterValue).intValue();
//						}else {
//							
//						}
//						setter.invoke(member, setterValue);
//					} catch (IntrospectionException | IllegalArgumentException | InvocationTargetException e) {
//						continue;
//					}
//				}
				member = (MemberVO)SampleDataMapper.resultSetToJavaObject(rs, MemberVO.class);
			}
			return member;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int insertMember(MemberVO member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MemberVO> selectMemberList(PagingInfoVO pagingVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateMember(MemberVO member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String mem_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public long selectTotalRecord(PagingInfoVO pagingVO) {
		// TODO Auto-generated method stub
		return 0;
	}

}
