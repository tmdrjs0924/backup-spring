package kr.co.shop.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.shop.mapper.AdminMapper;
import kr.co.shop.mapper.ProductMapper;
import kr.co.shop.vo.Cate1Vo;
import kr.co.shop.vo.Cate2Vo;
import kr.co.shop.vo.Cate3Vo;
import kr.co.shop.vo.CategoryVo;
import kr.co.shop.vo.ProductVo;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper mapper;
	
	@Override
	public String category(Model model) {
		ArrayList<Cate1Vo> cate1 = mapper.getCate1();
		model.addAttribute("cate1", cate1);
		return "/admin/category";
	}
	
	@Override
	public String product(Model model) {
		ArrayList<Cate1Vo> cate1 = mapper.getCate1();
		model.addAttribute("cate1", cate1);
		return "/admin/product";
	}
	
	//카테고리 관련
	@Override
	public void getCate2(HttpServletRequest request, PrintWriter out) {
		String cate1Code = request.getParameter("cate1Code");
		ArrayList<Cate2Vo> cate2 = mapper.getCate2(cate1Code);
		
		String str="<option> "+URLEncoder.encode("중분류")+"</option>";
		for(int i=0;i<cate2.size();i++)
		{
			str=str+"<option value='"+cate2.get(i).getCate2Id()+"'> "+URLEncoder.encode(cate2.get(i).getCate2Name()) +" ("+cate2.get(i).getCate2Id()+")"+" </option>";
		}
		out.print(str);
	}
	@Override
	public void getCate3(HttpServletRequest request, PrintWriter out) {
		String cate2Code = request.getParameter("cate2Code");
		ArrayList<Cate3Vo> cate3 = mapper.getCate3(cate2Code);
		
		String str="<option> "+URLEncoder.encode("소분류")+"</option>";
		for(int i=0;i<cate3.size();i++)
		{
			str=str+"<option value='"+cate3.get(i).getCate3Id()+"'> "+URLEncoder.encode(cate3.get(i).getCate3Name())+" ("+cate3.get(i).getCate3Id()+")"+" </option>";
		}
		out.print(str);
	}
	
	@Override
	public String cate1_insert(Cate1Vo c1vo) {
		mapper.cate1_insert(c1vo);
		return "redirect:/admin/category";
	}
	@Override
	public String cate2_insert(Cate2Vo c2vo) {
		mapper.cate2_insert(c2vo);
		return "redirect:/admin/category";
	}
	@Override
	public String cate3_insert(Cate3Vo c3vo) {
		mapper.cate3_insert(c3vo);
		return "redirect:/admin/category";
	}
	
	//상품코드 가져오기
	@Override
	public void getPcode(HttpServletRequest request, PrintWriter out) {
		String imsi = request.getParameter("imsi");
		out.print(mapper.getPcode("p"+imsi));
	}
	
	//상품등록
	@Override
	public String productInsert(HttpServletRequest request) throws Exception {
		String path=request.getRealPath("resources/pro");
		int size = 1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
		
		String pCode = multi.getParameter("pCode");
		String pName = multi.getParameter("pName");
		String pSize= multi.getParameter("pSize");
		
		int pPrice = Integer.parseInt(multi.getParameter("pPrice"));
		int pState = Integer.parseInt(multi.getParameter("pState"));
		int pDc = Integer.parseInt(multi.getParameter("pDc"));
		int pMile = Integer.parseInt(multi.getParameter("pMile"));
		int pInven = Integer.parseInt(multi.getParameter("pInven"));
		
		String pImg1 = multi.getFilesystemName("pImg1");
		String pImg2 = multi.getFilesystemName("pImg2");
		String pImg3 = multi.getFilesystemName("pImg3");
		
		ProductVo pvo = new ProductVo();
		pvo.setpCode(pCode);
		pvo.setpName(pName);
		pvo.setpSize(pSize);
		pvo.setpImg1(pImg1);
		pvo.setpImg2(pImg2);
		pvo.setpImg3(pImg3);
		pvo.setpPrice(pPrice);
		pvo.setpState(pState);
		pvo.setpDc(pDc);
		pvo.setpMile(pMile);
		pvo.setpInven(pInven);
		
		mapper.productInsert(pvo);
		return "redirect:/admin/product";
	}
}