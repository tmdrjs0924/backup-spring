package kr.co.folder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping("/home")
	public String home2() {
		return "/home";
	}
	
	@RequestMapping("/pkc")
	public String pkc() {
		return "/pkc";
	}
	
	@RequestMapping("/test")
	public String test() {
		return "/test";
	}
}
