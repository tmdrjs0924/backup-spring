package kr.co.myshop.mapper;

import java.util.ArrayList;

import kr.co.myshop.vo.CartVo;
import kr.co.myshop.vo.WishVo;

public interface MypageMapper {
	public ArrayList<WishVo> wishview(String userid);
	public void wishdel(String id);
	public void cart_add(String pcode, String userid);
	public ArrayList<CartVo> cartview(String userid);
	public void cartdel(String id);
	public int cart_check(String pcode, String userid);
	public void cart_up(String pcode, String userid);
	public void cart_up2(String su, String pcode, String userid);
}
