package kr.co.first;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	// 여러가지 정보를 콘솔창에 출력하는 클래스
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	// Mvc에서는 value="/"를 꼭 넣는다 
	// Run on server 무조건 "/"요청을 한다.
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request,Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		System.out.println("Welcome home!");
        logger.info(logger.getName());
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("name","superman" );
		// request.setAttribute랑 동일하다.
		request.setAttribute("age", "44");
		return "home";
	}
	
	@RequestMapping(value="/my", method=RequestMethod.GET)
	public String my()
	{
		return "/my";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list()
	{
		// 처리 되는 내용이 실행
		return "/list";
	}
	
	@RequestMapping(value="/test", method=RequestMethod.POST)
	public String test1()
	{
		return "/test1";
	}
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public String test2()
	{
		return "/test2";
	}
	// 동일한 요청시 method가 틀리면 사용 가능
	
	// 동일한 요청시 method가 같은 매핑이 2개 존재한다면 => error
    @RequestMapping(value="/write",method=RequestMethod.GET)
    public String write1()
    {
    	return "/write1";
    }
   /* @RequestMapping(value="/write",method=RequestMethod.GET)
    public String write2()
    {
    	return "/write2";
    	
    }*/
    
    // post, get둘다 받아준다
    @RequestMapping("/first")
    public String first()
    {
    	return "/first";
    }
    
    @GetMapping("/aaa")  // get만 가능
    public String aaa()
    {
    	return "/aaa";
    }
    @PostMapping("/bbb") // post만 가능
    public String bbb()
    {
    	return "/bbb";
    }
}











