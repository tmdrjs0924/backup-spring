package kr.co.sungjuk.mapper;

import java.util.ArrayList;

import kr.co.sungjuk.vo.SungVo;

public interface SungMapper {

	public void write_ok(SungVo svo);
	public ArrayList<SungVo> list();
	public void delete(SungVo svo);
	public SungVo update(SungVo svo);
	public void update_ok(SungVo svo);
}