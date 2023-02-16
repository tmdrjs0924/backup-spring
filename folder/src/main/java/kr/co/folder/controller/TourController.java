package kr.co.folder.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/tour")
@Controller
public class TourController {

	@RequestMapping("/write")
	public String write() {
		return "/tour/write";
	}
	
	@RequestMapping("/list")
	public String list() {
		return "/tour/list";
	}
	
	@RequestMapping("/content")
	public String content() {
		return "/tour/content";
	}
}
