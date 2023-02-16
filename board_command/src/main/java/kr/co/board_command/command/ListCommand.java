package kr.co.board_command.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import kr.co.board_command.board.dao.BoardDao;
import kr.co.board_command.board.dto.BoardDto;

public class ListCommand {

	public void list(Model model, HttpServletRequest request, BoardDao bdao) {
		int page;
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		int index=(page-1)*10;
		int pstart=page/10;
		if(page%10==0)
			pstart--;
		pstart=pstart*10+1;
		int pend=pstart+9;
		int chong=bdao.getChong();
		if(pend>chong)
			pend=chong;
		
		ArrayList<BoardDto> list=bdao.list(index);
		String str="";
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getTitle().length()<26)
				str=list.get(i).getTitle();
			else
				str=list.get(i).getTitle().substring(0,25)+"...";
			list.get(i).setTitle(str);
		}
		model.addAttribute("list", list);
	}
}
