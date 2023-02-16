package kr.co.service.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.service.mapper.BoardMapper;
import kr.co.service.vo.BoardVo;

@Service
@Qualifier("bs")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;

	@Override
	public String list(Model model, HttpServletRequest request) {
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
		pstart=pstart*10+1;
		int pend=pstart+9;
		int chong=mapper.getChong(rnum);
		if(pend>chong)
			pend=chong;
		model.addAttribute("page", page);
		model.addAttribute("index", index);
		model.addAttribute("rnum", rnum);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		
		ArrayList<BoardVo> list=mapper.list(index, rnum);
		String str="";
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getTitle().length()<31)
				str=list.get(i).getTitle();
			else
				str=list.get(i).getTitle().substring(0,30)+"...";
			list.get(i).setTitle(str);
		}
		model.addAttribute("list", list);
		return "/list";
	}
	
	@Override
	public String readnum(HttpServletRequest request) {
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		String rnum=request.getParameter("rnum");
		mapper.readnum(id);
		return "redirect:/content?id="+id+"&page="+page+"&rnum="+rnum;
	}
	
	@Override
	public String content(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		String rnum=request.getParameter("rnum");
		model.addAttribute("page", page);
		model.addAttribute("rnum", rnum);
		model.addAttribute("bvo", mapper.content(id));
		return "/content";
	}
	
	@Override
	public String delete(BoardVo bvo) {
		int chk=mapper.pwdCheck(bvo);
		if(chk==1) {
			mapper.delete(bvo.getId());
			return "redirect:/list?rnum="+bvo.getRnum()+"&page="+bvo.getPage();
		}
		else {
			return "redirect:/content?rnum="+bvo.getRnum()+"&page="+bvo.getPage()+"&id="+bvo.getId();
		}
	}
	
	@Override
	public String update(Model model, BoardVo bvo) {
		BoardVo bvo2=mapper.update(bvo);
		bvo2.setPage(bvo.getPage());
		bvo2.setRnum(bvo.getRnum());
		model.addAttribute("bvo", bvo2);
		return "/update";
	}
	
	@Override
	public String update_ok(BoardVo bvo) {
		int chk=mapper.pwdCheck(bvo);
		if(chk==1) {
			mapper.update_ok(bvo);
			return "redirect:/content?rnum="+bvo.getRnum()+"&page="+bvo.getPage()+"&id="+bvo.getId();
		}
		else
			return "redirect:/update?rnum="+bvo.getRnum()+"&page="+bvo.getPage()+"&id="+bvo.getId();
	}
}
