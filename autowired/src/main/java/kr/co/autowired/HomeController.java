package kr.co.autowired;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@Autowired
	private Student student1, student2;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		System.out.println(student1.getName()+" "+student1.getKor()+" "+student1.getEng()+" "+student1.getMat());
		System.out.println(student2.getName()+" "+student2.getKor()+" "+student2.getEng()+" "+student2.getMat());
		
		model.addAttribute("student1", student1);
		model.addAttribute("student2", student2);
		return "home";
	}
}
