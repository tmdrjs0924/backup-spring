package kr.co.sungjuk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sungjuk.service.SungService;
import kr.co.sungjuk.vo.SungVo;

@Controller
public class SungController {

	@Autowired
	@Qualifier("ss")
	private SungService service;
	
	@RequestMapping("/write")
	public String write() {
		return "/write";
	}
	
	@RequestMapping("/write_ok")
	public String write_ok(SungVo svo, Model model) {
		return service.write_ok(svo);
	}
	
	@RequestMapping("/list")
	public String list(SungVo svo, Model model) {
		return service.list(model);
	}
	
	@RequestMapping("/delete")
	public String delete(SungVo svo) {
		return service.delete(svo);
	}
	
	@RequestMapping("/update")
	public String update(SungVo svo, Model model) {
		return service.update(svo, model);
	}
	
	@RequestMapping("/update_ok")
	public String update_ok(SungVo svo) {
		return service.update_ok(svo);
	}
	
}
