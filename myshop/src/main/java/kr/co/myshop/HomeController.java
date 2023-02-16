package kr.co.myshop;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
	 
		
		return "redirect:/main/main";
	}
	
	@RequestMapping("/main/main")
	public String main()
	{
		return "/main/main";
	}
	
	@RequestMapping("/select_add")
	public String select_add() {
		return "select_add";
	}
	
	@RequestMapping("/trtd")
	public String trtd(Model model) {
		ArrayList<String> list=new ArrayList<String>();
		for(int i=0;i<24;i++) {
			list.add(i+"");
		}
		model.addAttribute("list", list);
		
		return "/trtd";
	}
}