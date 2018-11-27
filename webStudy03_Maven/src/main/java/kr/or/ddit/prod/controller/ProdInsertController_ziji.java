package kr.or.ddit.prod.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mvc.ICommandHandler;
import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.vo.ProdVO;

public class ProdInsertController_ziji implements ICommandHandler {
	String view = null;
	Map<String, String> message = new HashMap<>();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String method = req.getMethod();
		if("get".equalsIgnoreCase(method)) {//처음에 실행될때 get메서드가 실행되어서 이곳으로 오기때문에 prodForm으로 이동한다
			return "prod/prodForm";
		}else if("post".equalsIgnoreCase(method)) {//이동한
			String post = doPost(req,resp);
			
			return post;
		}else {
			resp.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String doPost(HttpServletRequest req, HttpServletResponse resp) {
		//값을 꺼내온다
		String prod_name = req.getParameter("prod_name");
		String prod_lgu = req.getParameter("prod_lgu");
		String prod_buyer = req.getParameter("prod_buyer");
		String prod_cost = req.getParameter("prod_cost");
		String prod_price = req.getParameter("prod_price");
		String prod_sale = req.getParameter("prod_sale");
		String prod_outline = req.getParameter("prod_outline");
		String prod_detail = req.getParameter("prod_detail");
		String prod_img = req.getParameter("prod_img");
		String prod_totalstock = req.getParameter("prod_totalstock");
		String prod_insdate = req.getParameter("prod_insdate");
		String prod_properstock = req.getParameter("prod_properstock");
		String prod_size = req.getParameter("prod_size");
		String prod_color = req.getParameter("prod_color");
		String prod_delivery = req.getParameter("prod_delivery");
		String prod_unit = req.getParameter("prod_unit");
		String prod_qtyin = req.getParameter("prod_qtyin");
		String prod_qtysale = req.getParameter("prod_qtysale");
		String prod_mileage = req.getParameter("prod_mileage");
		
		//값을 입력받았는지 안받았는지 검증
		
		
		
		
		ProdVO prod = new ProdVO();
		prod.setProd_name(prod_name);
		prod.setProd_lgu(prod_lgu);
		prod.setProd_buyer(prod_buyer);
		prod.setProd_cost(Long.parseLong(prod_cost));
		prod.setProd_price(Long.parseLong(prod_price));
		prod.setProd_sale(Long.parseLong(prod_sale));
		prod.setProd_outline(prod_outline);
		prod.setProd_detail(prod_detail);
		prod.setProd_img(prod_img);
		prod.setProd_totalstock(Long.parseLong(prod_totalstock));
		prod.setProd_insdate(prod_insdate);
		prod.setProd_properstock(Long.parseLong(prod_properstock));
		prod.setProd_size(prod_size);
		prod.setProd_color(prod_color);
		prod.setProd_delivery(prod_delivery);
		prod.setProd_unit(prod_unit);
		
		
		//service로 보내준다
		IProdService service = new ProdServiceImpl();
		ServiceResult result = service.createProd(prod);
		//결과값을 ok(list로),failed(다시 form으로)
		if(result.equals(ServiceResult.OK)) {
			view = "redirect:/prod/prodList.do";
		}else if(result.equals(ServiceResult.FAILED)) {
			view = "prod/prodForm";
		}
		return view;
	}
	
	private boolean validate(ProdVO prod) {
		if(StringUtils.isBlank(prod.getProd_name())) {
			message.put("prod_name", "상품명 누락");
			view = "prod/prodForm";
		}
		if(StringUtils.isBlank(prod_lgu)) {
			message.put("prod_lgu", "품번 누락");
			view = "prod/prodForm";
		}
		if(StringUtils.isBlank(prod_buyer)) {
			message.put("prod_buyer", "판매자 누락");
			view = "prod/prodForm";
		}
		if(StringUtils.isBlank(prod_cost)) {
			message.put("prod_buyer", "매입가 누락");
			view = "prod/prodForm";
		}
		if(StringUtils.isBlank(prod_price)) {
			message.put("prod_buyer", "판매가 누락");
			view = "prod/prodForm";
		}
		if(StringUtils.isBlank(prod_sale)) {
			message.put("prod_buyer", "특가 누락");
			view = "prod/prodForm";
		}
		if(StringUtils.isBlank(prod_outline)) {
			message.put("prod_buyer", "상품정보 누락");
			view = "prod/prodForm";
		}
		if(StringUtils.isBlank(prod_detail)) {
			message.put("prod_buyer", "상세정보 누락");
			view = "prod/prodForm";
		}
		if(StringUtils.isBlank(prod_img)) {
			message.put("prod_buyer", "이미지 누락");
			view = "prod/prodForm";
		}
		if(StringUtils.isBlank(prod_totalstock)) {
			message.put("prod_buyer", "totalstock 누락");
			view = "prod/prodForm";
		}
		if(StringUtils.isBlank(prod_insdate)) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				try {
					format.parse(prod_insdate);
				} catch (ParseException e) {
					message.put("prod_insdate", "날짜 형식에 맞지않아요");
					e.printStackTrace();
				} 
				view = "prod/prodForm";
			
		}
		if(StringUtils.isBlank(prod_properstock)) {
			message.put("prod_buyer", "properstock 누락");
			view = "prod/prodForm";
		}
		if(StringUtils.isBlank(prod_size)) {
			view = "prod/prodForm";
		}
		if(StringUtils.isBlank(prod_color)) {
			view = "prod/prodForm";
		}
		if(StringUtils.isBlank(prod_delivery)) {
			view = "prod/prodForm";
		}
		if(StringUtils.isBlank(prod_unit)) {
			view = "prod/prodForm";
		}
		if(StringUtils.isBlank(prod_qtyin)) {
			view = "prod/prodForm";
		}
		if(StringUtils.isBlank(prod_qtysale)) {
			view = "prod/prodForm";
		}
		if(StringUtils.isBlank(prod_mileage)) {
			view = "prod/prodForm";
		}
		return false;
		
	}
	

}
