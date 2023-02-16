package kr.co.model;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyController {
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	// 브라우저로 전달할 뷰에 date를 전달하는 방법
	// request, Model, ModelAndView
	@RequestMapping("/request")
	public String req(HttpServletRequest request) {
		int kor=90;
		int eng=95;
		int mat=85;
		int tot=kor+eng+mat;
		
		request.setAttribute("tot", tot);
		
		return "/request";
	}

	@RequestMapping("/model")
	public String model(Model model) {
		int kor=90;
		int eng=95;
		int mat=85;
		int tot=kor+eng+mat;
		
		model.addAttribute("tot", tot);
		
		return "/model";
	}
	
	@RequestMapping("/modelandview")
	public ModelAndView modelandview() {
		int kor=90;
		int eng=95;
		int mat=85;
		int tot=kor+eng+mat;
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/modelandview");
		mav.addObject("tot",tot);
		
		return mav;
	}
}
