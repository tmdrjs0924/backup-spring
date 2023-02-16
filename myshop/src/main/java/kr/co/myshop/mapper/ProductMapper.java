package kr.co.myshop.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.myshop.vo.BaesongVo;
import kr.co.myshop.vo.DaeVo;
import kr.co.myshop.vo.GumaeVo;
import kr.co.myshop.vo.JungVo;
import kr.co.myshop.vo.MemberVo;
import kr.co.myshop.vo.ProductVo;
import kr.co.myshop.vo.SoVo;

public interface ProductMapper {

	public void product_ok(ProductVo pvo);
	public ArrayList<JungVo> getJung(String daecode);
	public ArrayList<DaeVo> getDae();
	public ArrayList<SoVo> getSo(String daejung);
	public int getCode(String pcode);
	public ArrayList<ProductVo> plist(String pcode, int index, int rnum);
	public int getChong(int rnum, String pcode);
	public ProductVo pcontent(String pcode);
	public void wish_add(String pcode, String userid);
	public void wish_del(String pcode, String userid);
	public boolean wish_search(String pcode, String userid);
	public void cart_add(String pcode, String userid, String su);
	public int cart_check(String pcode, String userid);
	public void cart_up(String su, String pcode, String userid);
	public MemberVo getMember(String userid);
	public BaesongVo getJuso(String userid);
	public void setBaesong(BaesongVo bvo); 
	public void member_phone(String phone, String userid);
	public ArrayList<BaesongVo> baeview(String userid);
	public void jusoadd_ok(BaesongVo bvo);
	public BaesongVo baeup(String id);
	public void baeup_ok(BaesongVo bvo);
	public void gibonup(String userid);
	public void baedel(String id);
	public void baedel_gibonup(String userid);
	public void chg_ok(String cla, String id);
	public void gumae_ok(GumaeVo gvo);
	public int getJcode(String jumuncode);
	public GumaeVo getGumae(String jumuncode);
	public ProductVo getProduct(String pcode);
	public BaesongVo getBaesong(int id);
	public HashMap<String, String> getTotal(String jumuncode);
}
