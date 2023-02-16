package kr.co.folder.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/board")
@Controller
public class BoardController {

	@RequestMapping("/write")
	public String write() {
		return "/board/write";
	}
	
	@RequestMapping("/list")
	public String list() {
		return "/board/list";
	}
	
	@RequestMapping("/content")
	public String content() {
		return "/board/content";
	}
}
