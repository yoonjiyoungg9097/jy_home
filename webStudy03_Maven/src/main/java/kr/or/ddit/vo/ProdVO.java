package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;


/**
 * 상품관리를 위한 Domain Layer
 * 
 * ** iBatis 나  MyBatis를 이용해 여러 테이블로부터 데이터를 조회하는 방법,
 * 1. 메인데이터를 중심으로 테이블간의 관계 파악
 * 	ex) 상품정보 상세조회 (조회할 상품의 구매자 목록을 함께 조회)
 * 		상품(1) : 구매자(N)
 * 2. 각 테이블로부터 데이터 조회시 사용할 VO를 구현
 * 	    각 VO 간의 관계성을 설정
 *    상품(1):거래처(1) -> ProdVO has a BuyerVO
 *    상품(1):구매자들(N) -> ProdVO has many MemberVO
 * 3. 테이블을 직접 조인한 쿼리 작성 (resultMap으로 결과 바인딩)
 * 4. Nested Map 방식 : resultMap 을 구현시,
 * 		outerVO(ProdVO) 와 innerVO(BuyerVO, MemeberVO) 역할의 resultMap 들이 중첩되도록 설정  Nested Select
 * 5. 가져와서 잘 사용하기
 * 주의!!!!!	1:N 관계 조인시, 여러건의 레코드에서 중복을 제거해야 한다(groupBy)	
 */

@Data
@EqualsAndHashCode(of= {"prod_id", "prod_name"})
public class ProdVO implements Serializable{
	private long rnum;
	private String prod_id;
	private String prod_name;
	private String prod_lgu;
	private String lprod_nm;
	private String prod_buyer;
	private String buyer_name;
	private Long prod_cost;
	private Long prod_price;
	private Long prod_sale;
	private String prod_outline;
	private String prod_detail;
	private String prod_img;
	private Long prod_totalstock;
	private String prod_insdate;
	private Long prod_properstock;
	private String prod_size;
	private String prod_color;
	private String prod_delivery;
	private String prod_unit;
	private Long prod_qtyin;
	private Long prod_qtysale;
	private Long prod_mileage;
	
	private BuyerVO buyer; //has a 관계?
	
	private List<MemberVO> customers; //has many 관계
}
