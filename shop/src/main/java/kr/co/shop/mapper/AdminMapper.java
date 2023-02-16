package kr.co.shop.mapper;

import java.util.ArrayList;

import kr.co.shop.vo.Cate1Vo;
import kr.co.shop.vo.Cate2Vo;
import kr.co.shop.vo.Cate3Vo;
import kr.co.shop.vo.ProductVo;

public interface AdminMapper {
	//카테고리 불러오기
	public ArrayList<Cate1Vo> getCate1();
	public ArrayList<Cate2Vo> getCate2(String cate1Code);
	public ArrayList<Cate3Vo> getCate3(String cate2Code);

	//카테고리 등록
	public void cate1_insert(Cate1Vo c1vo);
	public void cate2_insert(Cate2Vo c2vo);
	public void cate3_insert(Cate3Vo c3vo);
	
	//상품코드
	public int getPcode(String imsi);
	
	//상품등록
	public void productInsert(ProductVo pvo);
}
