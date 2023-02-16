package kr.co.board_old;

import java.io.UnsupportedEncodingException;
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
	
/*
	public void write_ok(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		String sql="insert into board(title,content,name,pwd,writeday) values(?,?,?,?,now())";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, name);
		pstmt.setString(4, pwd);
		pstmt.executeUpdate();

		pstmt.close();
		conn.close();
	}

*/	
	public void write_ok(BoardDto bdto) throws Exception { // input요소의 name값은 자동으로 BoardDto 변수에 저장됨
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
	
/*	
	public void list(Model model) throws Exception {
		String sql="select * from board order by id desc";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		
		ArrayList<BoardDto> blist=new ArrayList<BoardDto>();
		while(rs.next()) {
			BoardDto bdto=new BoardDto();
			bdto.setId(rs.getInt("id"));
			bdto.setTitle(rs.getString("title"));
			bdto.setContent(rs.getString("content"));
			bdto.setName(rs.getString("name"));
			bdto.setWriteday(rs.getString("writeday"));
			
			blist.add(bdto);
		}
		model.addAttribute("blist", blist);
	}
*/
	public void list(Model model) throws Exception {
		String sql="select * from board order by id desc";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		
		ArrayList<BoardDto> blist=new ArrayList<BoardDto>();
		while(rs.next()) {
			BoardDto bdto=new BoardDto();
			bdto.setId(rs.getInt("id"));
			bdto.setTitle(rs.getString("title"));
			bdto.setContent(rs.getString("content"));
			bdto.setName(rs.getString("name"));
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
	
	public void content(BoardDto bdto, Model model) throws Exception {
		String sql="select * from board where id=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, bdto.getId());
		
		ResultSet rs=pstmt.executeQuery();
		rs.next();
		
		bdto.setTitle(rs.getString("title"));
		bdto.setContent(rs.getString("content"));
		bdto.setName(rs.getString("name"));
		bdto.setWriteday(rs.getString("writeday"));
		
		model.addAttribute("bdto", bdto);
	}
	
	public void update(BoardDto bdto, Model model) throws Exception {
		String sql="select * from board where id=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, bdto.getId());
		
		ResultSet rs=pstmt.executeQuery();
		rs.next();
		
		bdto.setTitle(rs.getString("title"));
		bdto.setContent(rs.getString("content"));
		bdto.setName(rs.getString("name"));
		
		model.addAttribute("bdto", bdto);
	}
	
	public void update_ok(BoardDto bdto) throws Exception {
		String sql="update board set title=?,content=? where id=?";
		System.out.println(bdto.getTitle()+" "+bdto.getContent()+" "+bdto.getId());
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, bdto.getTitle());
		pstmt.setString(2, bdto.getContent());
		pstmt.setInt(3, bdto.getId());
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
}
