package kr.co.tour.dao;

import java.util.ArrayList;

import kr.co.tour.dto.TourDto;

public interface TourDao {

	public void write_ok(String title, String content, String fname);
	public void write_ok2(TourDto tdto);
	public ArrayList<TourDto> list();
	public TourDto content();
}
