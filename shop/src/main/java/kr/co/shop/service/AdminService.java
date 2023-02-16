package kr.co.shop.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import kr.co.shop.vo.Cate1Vo;
import kr.co.shop.vo.Cate2Vo;
import kr.co.shop.vo.Cate3Vo;
import kr.co.shop.vo.ProductVo;

public interface AdminService {
	public String category(Model model);
	public String product(Model model);
	
	//카테고리 관련
	public void getCate2(HttpServletRequest request, PrintWriter out);
	public void getCate3(HttpServletRequest request, PrintWriter out);
	public String cate1_insert(Cate1Vo c1vo);
	public String cate2_insert(Cate2Vo c2vo);
	public String cate3_insert(Cate3Vo c3vo);
	
	//상품코드 관련
	public void getPcode(HttpServletRequest request, PrintWriter out);
	
	//상품 등록
	public String productInsert(HttpServletRequest request)throws Exception;
}
