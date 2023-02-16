package kr.co.shop.service;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.shop.mapper.MemberMapper;
import kr.co.shop.vo.MemberVo;

@Service
@Qualifier("ms")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
    private BCryptPasswordEncoder pwEncoder;
	
	@Override
	public String join() {
		return "/member/join";
	}
	@Override
	public String join_ok(MemberVo mvo) {
		String rawPw = "";            // 인코딩 전 비밀번호
        String encodePw = "";        // 인코딩 후 비밀번호
        
        rawPw = mvo.getMemberPw();            // 비밀번호 데이터 얻음
        encodePw = pwEncoder.encode(rawPw);        // 비밀번호 인코딩
        mvo.setMemberPw(encodePw);            // 인코딩된 비밀번호 member객체에 다시 저장
        
        /* 회원가입 쿼리 실행 */
		mapper.join_ok(mvo);
		return "redirect:/main/main";
	}
	
	@Override
	public String login(HttpServletRequest request, Model model) {
		String chk = request.getParameter("chk");
		model.addAttribute("chk", chk);
		return "/member/login";
	}
	
	@Override
	public String login_ok(MemberVo mvo, HttpSession session) {
		String rawPw="";
		String encodePw="";
		
		MemberVo mvo2 = mapper.login_ok(mvo);
		
		if(mvo2==null) {
			return "redirect:/member/login?chk=1";
		} else {
			rawPw = mvo.getMemberPw();	//사용자가 제출한 비밀번호
			encodePw = mvo2.getMemberPw();	//데이터베이스에서 가져온 비밀번호
			if(true == pwEncoder.matches(rawPw, encodePw)) {
				mvo.setMemberPw("");	//인코딩된 비밀번호 지우기
				session.setAttribute("memberId", mvo2.getMemberId());
				session.setAttribute("memberName", mvo2.getMemberName());
				return "redirect:/main/main";	
			} else {
				return "redirect:/member/login?chk=1";
			}
			
		}
	}
	
	@Override
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/main";
	}
	
	@Override
	public String idCheck(String memberId) {
		int result = mapper.idCheck(memberId);
		if(result != 0) {
			return "fail";	// 중복 아이디가 존재
		} else {
			return "success";	// 중복 아이디 x
		}
	}
	
	@Override
	public String mailCheck(String email) {
    	/* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        
        /* 이메일 보내기 */
        String setFrom = "thesanus@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        } 
        String num = Integer.toString(checkNum);
        return num;
	}
	
	
}
