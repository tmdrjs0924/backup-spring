package kr.co.second;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller	// 이 클래스의 사용자 요청에 따른 문서의 이름을 매핑하는 클래스
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);	// 프로그램 동작 시 필요한 정보를 출력하기 위한 클래스
	
	@RequestMapping(value = "/", method = RequestMethod.GET)	// 사용자의 요청과 일치하는 value라면 아래의 메소드를 실행
	public String home(Locale locale, Model model) {	// method명은 마음대로 해도 되지만 일반적으로 요청과 동일한 이름으로 만듦
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate);  // request.setAttribute("serverTime", formattedDate);
		
		return "home";	// home.jsp 문서를 브라우저에 전달
	}
	
	// 새로운 문서를 추가했을 경우, 매핑도 추가
	@RequestMapping(value="/my", method=RequestMethod.POST)
	public String my(Model model) {
		//작업
		int kor=90;
		int eng=80;
		int tot=kor+eng;
		
		model.addAttribute("tot", tot);
		
		return "/my";
	}
	
	// mapping 4.x 버전에 GetMapping(), PostMapping()
	@GetMapping("/test1")
	public String test() {
		return "/test1";
	}
	@PostMapping("/test2")
	public String test2() {
		return "/test2";
	}
	// RequestMapping도 간편하게 사용가능
	@RequestMapping("/your") // get, post 둘 다 가능
	public String your() {
		return "/your";
	}
}
