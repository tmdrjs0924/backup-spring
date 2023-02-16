package kr.co.service.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import kr.co.service.vo.BoardVo;

public interface BoardService {

	public String list(Model model, HttpServletRequest request);
	public String readnum(HttpServletRequest request);
	public String content(HttpServletRequest request, Model model);
	public String update(Model model, BoardVo bvo);
	public String update_ok(BoardVo bvo);
	public String delete(BoardVo bvo);
}
