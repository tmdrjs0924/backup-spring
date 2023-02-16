package kr.co.mapper_test1.gongji.dao;

import java.util.ArrayList;

import kr.co.mapper_test1.gongji.dto.GongjiDto;

public interface GongjiDao {

	public ArrayList<GongjiDto> list();
	public void write_ok(GongjiDto gdto);
}
