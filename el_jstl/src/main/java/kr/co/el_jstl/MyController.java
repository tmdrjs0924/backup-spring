package kr.co.el_jstl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {

	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/el")
	public String el() {
		return "/el";
	}
	
	@RequestMapping("/set")
	public String set() {
		return "/set";
	}
	
	@RequestMapping("/if1")
	public String if1() {
		return "/if1";
	}
	
	@RequestMapping("/foreach")
	public String foreach() {
		return "/foreach";
	}

	@RequestMapping("/foreach2")
	public String foreach2() {
		return "/foreach2";
	}
	
	@RequestMapping("/foreach3")
	public String foreach3() {
		return "/foreach3";
	}
	
	@RequestMapping("/choose")
	public String choose() {
		return "/choose";
	}
}
