package kr.co.sungjuk.service;

import org.springframework.ui.Model;

import kr.co.sungjuk.vo.SungVo;

public interface SungService {
	
	public String write_ok(SungVo svo);
	public String list(Model model);
	public String delete(SungVo svo);
	public String update(SungVo svo, Model model);
	public String update_ok(SungVo svo);
}