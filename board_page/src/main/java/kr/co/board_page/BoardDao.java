package kr.co.board_page;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public class BoardDao {
  
	Connection conn;
	public BoardDao() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
	    String db="jdbc:mysql://localhost:3306/first";
	    conn=DriverManager.getConnection(db,"root","1234");
	}
	
	public void write_ok(BoardDto bdto) throws Exception {
		String sql="insert into board(title,content,name,pwd,writeday) values(?,?,?,?,now())";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, bdto.getTitle());
		pstmt.setString(2, bdto.getContent());
		pstmt.setString(3, bdto.getName());
		pstmt.setString(4, bdto.getPwd());
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
	public int getPage(HttpServletRequest request) {
		int page;
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		return page;
	}
	
	public int getRnum(HttpServletRequest request) {
		int rnum;
		if(request.getParameter("rnum")==null)
			rnum=20;
		else
			rnum=Integer.parseInt(request.getParameter("rnum"));
		
		return rnum;
	}

	public int getIndex(int page, int rnum) {
		int index=(page-1)*rnum;
		
		return index;
	}

	public int getChong(HttpServletRequest request) throws Exception {
		int rnum=getRnum(request);
		String field=getField(request);
		String keyword=getKeyword(request);
		
		String sql="select ceil(count(*)/"+rnum+") as chong from board where "+field+" like '%"+keyword+"%'";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		rs.next();
		int chong=rs.getInt("chong");
		
		return chong;
	}
	
	public int getPstart(HttpServletRequest request) {
		int page=getPage(request);
		int pstart;
		pstart=page/10;
		if(page%10==0)
			pstart--;
		pstart=(pstart*10)+1;
		
		return pstart;
	}
	
	public int getPend(HttpServletRequest request) throws Exception {
		int pend;
		int pstart=getPstart(request);
		int chong=getChong(request);
		pend=pstart+9;
		if(pend>chong)
			pend=chong;
		
		return pend;
	}
	
	public String getField(HttpServletRequest request) {
		String field;
		if(request.getParameter("field")==null)
			field="title";
		else
			field=request.getParameter("field");
		
		return field;
	}
	
	public String getKeyword(HttpServletRequest request) {
		String keyword;
		if(request.getParameter("keyword")==null)
			keyword="";
		else
			keyword=request.getParameter("keyword");
		
		return keyword;
	}
	public void list(HttpServletRequest request, Model model) throws Exception {
		int page=getPage(request);
		int rnum=getRnum(request);
		int index=getIndex(page, rnum);
		int pstart=getPstart(request);
		int pend=getPend(request);
		int chong=getChong(request);
		String field=getField(request);
		String keyword=getKeyword(request);
		
		model.addAttribute("page", page);
		model.addAttribute("rnum", rnum);
		model.addAttribute("index", index);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		
		String sql="select * from board where "+field+" like '%"+keyword+"%' order by id desc limit "+index+","+rnum;
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		
		ResultSet rs=pstmt.executeQuery();
		
		ArrayList<BoardDto> blist=new ArrayList<BoardDto>();
		while(rs.next()) {
            BoardDto bdto=new BoardDto();
            bdto.setId(rs.getInt("id"));
            bdto.setTitle(rs.getString("title"));
            bdto.setName(rs.getString("name"));
            bdto.setReadnum(rs.getInt("readnum"));
            bdto.setWriteday(rs.getString("writeday"));
            
            blist.add(bdto);
		}
		model.addAttribute("blist", blist);
	}
		
	public void readnum(BoardDto bdto) throws Exception {
		String sql="update board set readnum=readnum+1 where id=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, bdto.getId());
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
	public void conetent(BoardDto bdto, Model model) throws Exception {
		String sql="select * from board where id=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, bdto.getId());
		
		ResultSet rs=pstmt.executeQuery();
		rs.next();

		model.addAttribute("id", rs.getInt("id"));
		model.addAttribute("title", rs.getString("title"));
		model.addAttribute("content", rs.getString("content"));
		model.addAttribute("name", rs.getString("name"));
		model.addAttribute("pwd", rs.getString("pwd"));
		model.addAttribute("readnum", rs.getInt("readnum"));
		model.addAttribute("writeday", rs.getString("writeday"));
	}
	
	public boolean isPwdCheck(BoardDto bdto) throws Exception {
		String sql="select * from board where id=? and pwd=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, bdto.getId());
		pstmt.setString(2, bdto.getPwd());
		
		ResultSet rs=pstmt.executeQuery();
		if(rs.next())
			return true;
		else
			return false;
	}
	
	public void update(BoardDto bdto, Model model) throws Exception {
		String sql="select * from board where id=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, bdto.getId());
		
		ResultSet rs=pstmt.executeQuery();
		rs.next();
		
		model.addAttribute("id", rs.getInt("id"));
		model.addAttribute("title", rs.getString("title"));
		model.addAttribute("content", rs.getString("content"));
		model.addAttribute("name", rs.getString("name"));
	}
	
	public void update_ok(BoardDto bdto) throws Exception {
		String sql="update board set title=?,content=?,name=? where id=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, bdto.getTitle());
		pstmt.setString(2, bdto.getContent());
		pstmt.setString(3, bdto.getName());
		pstmt.setInt(4, bdto.getId());
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	
	public void delete(BoardDto bdto) throws Exception {
		String sql="delete from board where id=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, bdto.getId());
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
}