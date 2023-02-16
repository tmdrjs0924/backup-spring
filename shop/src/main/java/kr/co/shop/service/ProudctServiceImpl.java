package kr.co.shop.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.shop.mapper.ProductMapper;
import kr.co.shop.vo.ProductVo;


@Service
@Qualifier("ps")
public class ProudctServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper mapper;
	
	@Override
	public String plist(Model model) {
		ArrayList<ProductVo> plist = mapper.plist();
		model.addAttribute("plist", plist);
		return "/product/plist";
	}
}
