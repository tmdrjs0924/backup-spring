package kr.co.myshop.service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.myshop.mapper.MypageMapper;
import kr.co.myshop.vo.CartVo;

@Service
@Qualifier("ms")
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageMapper mapper;
	
	@Override
	public String wishview(HttpSession session, Model model) {
		if(session.getAttribute("userid")!=null) {
			String userid=session.getAttribute("userid").toString();
			model.addAttribute("wlist", mapper.wishview(userid));
			return null;
		}
		else
			return "redirect:/login/login";
	}
	
	@Override
	public String wishdel(HttpServletRequest request) {
		String[] id=request.getParameter("id").split(",");
		for(int i=0;i<id.length;i++)
			mapper.wishdel(id[i]);
		
		return "redirect:/mypage/wishview";
	}
	
	@Override
	public String cart_add(HttpServletRequest request, HttpSession session) {
		String pcode=request.getParameter("pcode");
		String userid=session.getAttribute("userid").toString();
		//cart테이블의 pcode 존재여부
		int cnt=mapper.cart_check(pcode, userid);
		if(cnt==1)
			mapper.cart_up(pcode, userid);
		else
			mapper.cart_add(pcode, userid);
		
		return "redirect:/mypage/wishview";
	}
	
	@Override
	public String cartview(HttpSession session, Model model) {
		if(session.getAttribute("userid")==null)
			return "redirect:/login/login";
		else {
			String userid=session.getAttribute("userid").toString();
			ArrayList<CartVo> clist=mapper.cartview(userid);
			model.addAttribute("clist", clist);
			
			// 상품가격, 할인율, 배송비 => ?, ?, ?
			String proprice="";
			String prohalin="";
			String probaesong="";
			for(int i=0;i<clist.size();i++) {
				proprice=proprice+clist.get(i).getPrice()+",";
				int imsi=clist.get(i).getPrice()*clist.get(i).getHalin()/100;
				prohalin=prohalin+imsi+",";
				probaesong=probaesong+clist.get(i).getBaesong()+",";
			}
			model.addAttribute("proprice", proprice);
			model.addAttribute("prohalin", prohalin);
			model.addAttribute("probaesong", probaesong);
			return "/mypage/cartview";
		}
	}
	
	@Override
	public String cartdel(HttpServletRequest request) {
		String[] id=request.getParameter("id").split(",");
		for(int i=0;i<id.length;i++)
			mapper.cartdel(id[i]);
		
		return "redirect:/mypage/cartview";
	}
	
	@Override
	public void cart_up2(HttpServletRequest request, HttpSession session, PrintWriter out) {
		try {
			String userid=session.getAttribute("userid").toString();
			String pcode=request.getParameter("pcode");
			String su=request.getParameter("su");
			mapper.cart_up2(su, pcode, userid);
			out.print("0");
		}
		catch(Exception e) {
			out.print("1");
		}
	}
}
