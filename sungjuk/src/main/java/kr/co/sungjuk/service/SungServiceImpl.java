package kr.co.sungjuk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.sungjuk.mapper.SungMapper;
import kr.co.sungjuk.vo.SungVo;

@Service
@Qualifier("ss")
public class SungServiceImpl implements SungService {

	@Autowired
	private SungMapper mapper;
	
	@Override
	public String write_ok(SungVo svo) {
		int tot=svo.getKor()+svo.getEng()+svo.getMat();
		int avg=tot/3;
		svo.setTot(tot);
		svo.setAvg(avg);
		mapper.write_ok(svo);
		return "redirect:/list";
	}
	
	@Override
	public String list(Model model) {
		model.addAttribute("list", mapper.list());
		return "/list";
	}
	
	@Override
	public String delete(SungVo svo) {
		mapper.delete(svo);
		return "redirect:/list";
	}
	
	@Override
	public String update(SungVo svo, Model model) {
		model.addAttribute(mapper.update(svo));
		return "/update";
	}
	
	@Override
	public String update_ok(SungVo svo) {
		int tot=svo.getKor()+svo.getEng()+svo.getMat();
		int avg=tot/3;
		svo.setTot(tot);
		svo.setAvg(avg);
		mapper.update_ok(svo);
		return "redirect:/list";
	}
}