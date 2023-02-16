package kr.co.batis_page.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.type.IntegerTypeHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.batis_page.dao.BoardDao;
import kr.co.batis_page.dto.BoardDto;

@Controller
public class BoardController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/")
	public String home()
	{
		return "redirect:/list";
	}
	
	@RequestMapping("/write")
	public String write()
	{
		return "/write";
	}
	
	@RequestMapping("write_ok")
	public String write_ok(BoardDto bdto)
	{
		BoardDao bdao=sqlSession.getMapper(BoardDao.class);
		bdao.write_ok(bdto);
		
		return "redirect:/list";
	}
	
	@RequestMapping("/list")
	public String list(Model model, HttpServletRequest request)
	{
		BoardDao bdao=sqlSession.getMapper(BoardDao.class);

		String field, keyword;
		if(request.getParameter("field")==null)
			field="title";
		else
			field=request.getParameter("field");
		if(request.getParameter("keyword")==null)
			keyword="";
		else
			keyword=request.getParameter("keyword");
		int page;
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		int rnum;
		if(request.getParameter("rnum")==null)
			rnum=20;
		else
			rnum=Integer.parseInt(request.getParameter("rnum"));
		int index=(page-1)*rnum;
		int pstart=page/10;
		if(page%10==0)
			pstart--;
		pstart=(pstart*10)+1;
		int chong=bdao.getChong(rnum, field, keyword);
		int pend=pstart+9;
		if(pend>chong)
			pend=chong;
		
		model.addAttribute("page", page);
		model.addAttribute("rnum", rnum);
		model.addAttribute("index", index);
		model.addAttribute("pstart", pstart);
		model.addAttribute("chong", chong);
		model.addAttribute("pend", pend);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		
		ArrayList<BoardDto> list=bdao.list(page, rnum, index, pstart, pend, chong, field, keyword);
		String str="";
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getTitle().length()<31)
				str=list.get(i).getTitle();
			else
				str=list.get(i).getTitle().substring(0, 30)+"...";
			list.get(i).setTitle(str);
		}
		model.addAttribute("list", list);

		return "/list";
	}
	
	@RequestMapping("/readnum")
	public String readnum(BoardDto bdto, HttpServletRequest request)
	{
		BoardDao bdao=sqlSession.getMapper(BoardDao.class);
		bdao.readnum(bdto);
		
		return "redirect:/content?id="+bdto.getId()+"&page="+bdto.getPage()+"&rnum="+bdto.getRnum()+"&field="+bdto.getField()+"&keyword="+bdto.getKeyword();
	}
	
	@RequestMapping("/content")
	public String content(BoardDto bdto, Model model)
	{
		BoardDao bdao=sqlSession.getMapper(BoardDao.class);
		BoardDto bdto2=bdao.content(bdto);
		bdto2.setContent(bdto2.getContent().replace("\r\n", "<br>"));;
		
		bdto2.setPage(bdto.getPage());
		bdto2.setRnum(bdto.getRnum());
		bdto2.setField(bdto.getField());
		bdto2.setKeyword(bdto.getKeyword());
		
		model.addAttribute("bdto", bdto2);
		return "/content";
	}
	
	@RequestMapping("/update")
	public String update(BoardDto bdto, Model model)
	{
		BoardDao bdao=sqlSession.getMapper(BoardDao.class);
		BoardDto bdto2=bdao.update(bdto);
		
		bdto2.setPage(bdto.getPage());
		bdto2.setRnum(bdto.getRnum());
		bdto2.setField(bdto.getField());
		bdto2.setKeyword(bdto.getKeyword());
		
		model.addAttribute("bdto", bdto2);
		return "/update";
	}
	
	@RequestMapping("update_ok")
	public String update_ok(BoardDto bdto)
	{
		BoardDao bdao=sqlSession.getMapper(BoardDao.class);
		boolean chk=bdao.pwdCheck2(bdto);
		if(chk)
		{
			bdao.update_ok(bdto);
			
			return "redirect:/content?id="+bdto.getId()+"&page="+bdto.getPage()+"&rnum="+bdto.getRnum()+"&field="+bdto.getField()+"&keyword="+bdto.getKeyword();
		}
		else
			return "redirect:/update?id="+bdto.getId()+"&page="+bdto.getPage()+"&rnum="+bdto.getRnum()+"&field="+bdto.getField()+"&keyword="+bdto.getKeyword();
	}
	
	@RequestMapping("/delete")
	public String delete(BoardDto bdto)
	{
		BoardDao bdao=sqlSession.getMapper(BoardDao.class);
		int chk=bdao.pwdCheck(bdto);
		if(chk==1)
		{
			bdao.delete(bdto);

			return "redirect:/list";
		}
		else
			return "redirect:/content?id="+bdto.getId()+"&page="+bdto.getPage()+"&rnum="+bdto.getRnum()+"&field="+bdto.getField()+"&keyword="+bdto.getKeyword();

	}
}