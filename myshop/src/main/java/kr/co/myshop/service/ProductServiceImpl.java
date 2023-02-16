package kr.co.myshop.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.myshop.mapper.ProductMapper;
import kr.co.myshop.vo.BaesongVo;
import kr.co.myshop.vo.GumaeVo;
import kr.co.myshop.vo.JungVo;
import kr.co.myshop.vo.MemberVo;
import kr.co.myshop.vo.ProductVo;
import kr.co.myshop.vo.SoVo;

@Service
@Qualifier("qs")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper mapper;
	
	@Override
	public String product(Model model) {
		model.addAttribute("dae", mapper.getDae());
		return "/product/product";
	}
	
	@Override
	public void getJung(HttpServletRequest request, PrintWriter out) {
		String daecode=request.getParameter("daecode");
		ArrayList<JungVo> jung=mapper.getJung(daecode);
		String str="<option> "+URLEncoder.encode("중분류")+ "</option>";
		for(int i=0;i<jung.size();i++) {
		  str=str+"<option value='"+jung.get(i).getCode()+"'> "+URLEncoder.encode(jung.get(i).getName())+" </option>";
		}
		//URLEncoder.encode(s) URLDecoder.decode(s)
		out.print(str);
	}
	
	@Override
	public void getSo(HttpServletRequest request, PrintWriter out) {
		String daejung=request.getParameter("daejung");
		ArrayList<SoVo> so=mapper.getSo(daejung);
		String str="<option> "+URLEncoder.encode("소분류")+ "</option>";
		for(int i=0;i<so.size();i++){
		  str=str+"<option value='"+so.get(i).getCode()+"'> "+URLEncoder.encode(so.get(i).getName())+" </option>";
		}
		//URLEncoder.encode(s) URLDecoder.decode(s)
		out.print(str);
	}
	
	@Override
	public void getCode(HttpServletRequest request, PrintWriter out) {
		String pcode=request.getParameter("pcode");
		out.print(mapper.getCode(pcode));
	}
	
	@Override
	public String product_ok(HttpServletRequest request, ProductVo pvo) throws Exception {
		String path=request.getRealPath("/resources/pro");
		int size=1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
		
		String pcode=multi.getParameter("pcode");
		String pimg=multi.getFilesystemName("pimg");
		String cimg=multi.getFilesystemName("cimg");
		String title=multi.getParameter("title");
		int price=Integer.parseInt(multi.getParameter("price"));
		String made=multi.getParameter("made");
		int halin=Integer.parseInt(multi.getParameter("halin"));
		int juk=Integer.parseInt(multi.getParameter("juk"));
		int su=Integer.parseInt(multi.getParameter("su"));
		int baesong=Integer.parseInt(multi.getParameter("baesong"));
		int baeday=Integer.parseInt(multi.getParameter("baeday"));
		
		pvo.setPcode(pcode);
		pvo.setPimg(pimg);
		pvo.setCimg(cimg);
		pvo.setTitle(title);
		pvo.setPrice(price);
		pvo.setMade(made);
		pvo.setHalin(halin);
		pvo.setJuk(juk);
		pvo.setSu(su);
		pvo.setBaesong(baesong);
		pvo.setBaeday(baeday);
		
		mapper.product_ok(pvo);
		return "redirect:/product/product";
	}
	
	@Override
	public String plist(HttpServletRequest request, Model model) {
		String pcode=request.getParameter("pcode");
		int page, index, rnum, pstart, pend, chong;
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		if(request.getParameter("rnum")==null)
			rnum=24;
		else
			rnum=Integer.parseInt(request.getParameter("rnum"));
		index=(page-1)*rnum;
		pstart=page/5;
		if(page%5==0)
			pstart--;
		pstart=pstart*5+1;
		pend=pstart+4;
		chong=mapper.getChong(rnum, pcode);
		if(pend>chong)
			pend=chong;
		
		model.addAttribute("page", page);
		model.addAttribute("rnum", rnum);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		model.addAttribute("pcode", pcode);
		model.addAttribute("plist", mapper.plist(pcode, index, rnum));
		return "/product/plist";
	}
	
	@Override
	public String pcontent(HttpServletRequest request, Model model, HttpSession session) {
		String pcode=request.getParameter("pcode");
		model.addAttribute("pvo", mapper.pcontent(pcode));
		if(session.getAttribute("userid")!=null) {
			String userid=session.getAttribute("userid").toString();
			boolean wcnt=mapper.wish_search(pcode, userid);
			model.addAttribute("wcnt", wcnt);
		}
		return "/product/pcontent";
	}
	
	@Override
	public void wish_add(HttpSession session, HttpServletRequest request, PrintWriter out) {
		String pcode=request.getParameter("pcode");
		String userid=session.getAttribute("userid").toString();
		
		try {
			mapper.wish_add(pcode, userid);
			out.print("0");
		}
		catch(Exception e) {
			out.print("1");
		}
	}
	
	@Override
	public void wish_del(HttpSession session, HttpServletRequest request, PrintWriter out) {
		String pcode=request.getParameter("pcode");
		String userid=session.getAttribute("userid").toString();
		
		try {
			mapper.wish_del(pcode, userid);
			out.print("0");
		}
		catch(Exception e) {
			out.print("1");
		}
	}
	
	@Override
	public void cart_add(HttpServletRequest request, HttpSession session, PrintWriter out) {
		String pcode=request.getParameter("pcode");
		if(session.getAttribute("userid")!=null) {
			String userid=session.getAttribute("userid").toString();
			String su=request.getParameter("su");
			int cnt=mapper.cart_check(pcode, userid);
			if(cnt==1)
				mapper.cart_up(su, pcode, userid);
			else
				mapper.cart_add(pcode, userid, su);
			out.print("0");
		}
		else
			out.print("1");
	}
	
	@Override
	public String gumae(HttpServletRequest request, HttpSession session, Model model) {
		// 구매자 정보
		String userid=session.getAttribute("userid").toString();
		MemberVo mvo=mapper.getMember(userid);
		model.addAttribute("mvo", mvo);
		
		// 배송 정보 : baesong 테이블에서 gibon필드가 1
		BaesongVo bvo=mapper.getJuso(userid);
		if(bvo==null) {
			BaesongVo bvo2=new BaesongVo();
			bvo2.setName(mvo.getName());
			bvo2.setPhone(mvo.getPhone());
			bvo2.setZip(mvo.getZip());
			bvo2.setJuso(mvo.getJuso());
			bvo2.setJuso_etc(mvo.getJuso_etc());
			bvo2.setUserid(mvo.getUserid());
			mapper.setBaesong(bvo2);
			model.addAttribute("bvo", bvo2);
		}
		else {
			model.addAttribute("bvo", bvo);
		}
		
		// 결제 정보
		String pcode=request.getParameter("pcode");
		int su=Integer.parseInt(request.getParameter("su"));
		ProductVo pvo=mapper.pcontent(pcode);
		pvo.setSu(su);
		model.addAttribute("pvo", pvo);
		
		LocalDateTime today=LocalDateTime.now();
		LocalDateTime xday=today.plusDays(7);
		int yy=xday.getYear();
		int mm=xday.getMonthValue();
		int dd=xday.getDayOfMonth();
		int h=xday.getHour();
		int m=xday.getMinute();
		int s=xday.getSecond();
		String gihan=yy+"년"+mm+"월"+dd+"일"+h+"시"+m+"분"+m+"초";
		model.addAttribute("gihan", gihan);
		
		return "/product/gumae";
	}
	
	@Override
	public void member_phone(HttpServletRequest request, PrintWriter out, HttpSession session) {
		try {
			String phone=request.getParameter("phone");
			String userid=session.getAttribute("userid").toString();
			
			mapper.member_phone(phone,userid);
			out.print("1");
		}
		catch(Exception e){
			out.print("0");
		}
	}
	
	@Override
	public String baeview(HttpSession session, Model model) {
		String userid=session.getAttribute("userid").toString();
		model.addAttribute("blist" , mapper.baeview(userid));
		
		return "/product/baeview";
	}
	
	@Override
	public String jusoadd() {
		return "/product/jusoadd";
	}
	
	@Override
	public String jusoadd_ok (BaesongVo bvo, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		bvo.setUserid(userid);
		if(bvo.getGibon()==1)
			mapper.gibonup(userid);
		
		mapper.jusoadd_ok(bvo);
		return "redirect:/product/baeview";
	}
	
	@Override
	public String baeup(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		model.addAttribute("bvo", mapper.baeup(id));
		return "/product/baeup";
	}
	
	@Override
	public String baeup_ok(BaesongVo bvo, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		if(bvo.getGibon()==1)
			mapper.gibonup(userid);
		mapper.baeup_ok(bvo);
		return "redirect:/product/baeview";
	}
	
	@Override
	public String baedel(HttpServletRequest request, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		String id=request.getParameter("id");
		int chk=Integer.parseInt(request.getParameter("chk"));
		if(chk==1) {
			mapper.baedel_gibonup(userid);
		}
		mapper.baedel(id);
		return "redirect:/product/baeview";
	}
	
	@Override
	public String chgcla(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		int cla=Integer.parseInt(request.getParameter("cla"));
		model.addAttribute("id", id);
		model.addAttribute("cla", cla);
		return "/product/chgcla";
	}
	
	@Override
	public void chg_ok(HttpServletRequest request, PrintWriter out) {
		String cla=request.getParameter("cla");
		String id=request.getParameter("id");
		
		try {
			mapper.chg_ok(cla, id);
			out.print("0");
		}
		catch(Exception e) {
			out.print("1");
		}
	}
	
	@Override
	public String gumae_ok(int id, GumaeVo gvo, HttpSession session) {
		gvo.setBae_id(id);
		
		//주문코드생성
		LocalDate today=LocalDate.now();
		int y=today.getYear();
		int m=today.getMonthValue();
		String mm=m+"";
		if(mm.length()==1)
			mm="0"+mm;
		int d=today.getDayOfMonth();
		String dd=d+"";
		if(dd.length()==1)
			dd="0"+dd;
		String jumuncode="j"+y+mm+dd;
        int num=mapper.getJcode(jumuncode);
        String code=String.format("%04d", num);
        jumuncode=jumuncode+code;
		gvo.setJumuncode(jumuncode);
		
		String userid=session.getAttribute("userid").toString();
		gvo.setUserid(userid);
		
		mapper.gumae_ok(gvo);
		return "redirect:/product/jumun?jumuncode="+jumuncode;
	}
	
	@Override
	public String jumun(HttpServletRequest request, Model model) {
		// gumae테이블 읽기
		String jumuncode=request.getParameter("jumuncode");
		
		GumaeVo gvo=mapper.getGumae(jumuncode);
		// product테이블 읽기
		ProductVo pvo=mapper.getProduct(gvo.getPcode());
		// baesong테이블 읽기
		BaesongVo bvo=mapper.getBaesong(gvo.getBae_id());
		
		model.addAttribute("gvo",gvo);
		model.addAttribute("pvo",pvo);
		model.addAttribute("bvo",bvo);
		return "/product/jumun";
	}
	
	@Override
	public String jumun2(HttpServletRequest request, Model model) {
		String jumuncode=request.getParameter("jumuncode");
		HashMap<String,String> map=mapper.getTotal(jumuncode);
		model.addAttribute("map", map);
		return "/product/jumun";
	}
}
