package kr.co.data;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/data1")
	public String data1(HttpServletRequest request, Model model) throws Exception {
		// 데이터 받기 -> request
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
		String juso=request.getParameter("juso");
		String phone=request.getParameter("phone");
		// 데이터 전달 -> Model
		model.addAttribute("name", name);
		model.addAttribute("juso", juso);
		model.addAttribute("phone", phone);
		
		return "/data1";
	}
	
	@RequestMapping("/data2")
	public String data2(@RequestParam("name") String name, @RequestParam("juso") String juso, Model model) {
		model.addAttribute("name", name);
		model.addAttribute("juso", juso);
		
		return "/data2";
	}
	
	@RequestMapping("/data3")
	public String data3(String name, String juso, Model model) {
		model.addAttribute("name", name);
		model.addAttribute("juso", juso);
		
		return "/data3";
	}
	
	@RequestMapping("/data4")
	public String data4(MemberDto mdto, Model model) {
		/*
		MemberDto mdto=new MemberDto();
		mdto.setName(request.getParameter("name"));
		*/
		model.addAttribute("name", mdto.getName());
		model.addAttribute("juso", mdto.getJuso());
		model.addAttribute("phone", mdto.getPhone());
		model.addAttribute("age", mdto.getAge());
		
		return "/data4";
	}
	
	@RequestMapping("/data5/{name}/{age}/{juso}")
	public String data5(@PathVariable String name,@PathVariable String age,@PathVariable String juso,Model model) {
		model.addAttribute("name",name);
		model.addAttribute("age",age);
		model.addAttribute("juso",juso);
		
		return "/data5";
	}
}