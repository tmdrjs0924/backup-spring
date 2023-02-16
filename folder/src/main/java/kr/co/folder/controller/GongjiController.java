package kr.co.folder.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/gongji")
@Controller
public class GongjiController {

	@RequestMapping("/write")
	public String write() {
		return "/gongji/write";
	}
	
	@RequestMapping("/list")
	public String list() {
		return "/gongji/list";
	}
	
	@RequestMapping("/content")
	public String content() {
		return "/gongji/content";
	}
}
