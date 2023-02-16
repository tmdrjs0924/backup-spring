package kr.co.multi_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller	// 현재 클래스도 컨트롤러 역할을 함
public class MyController {

	@RequestMapping("/my")
	public String my() {
		return "/my";
	}
}