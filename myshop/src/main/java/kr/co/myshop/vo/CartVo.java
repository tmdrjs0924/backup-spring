package kr.co.myshop.vo;

public class CartVo {

	private int id, su;
	private String pcode, userid, writeday;
	private int price, halin, baesong;
	private String pimg, title;

	public int getBaesong() {
		return baesong;
	}
	public void setBaesong(int baesong) {
		this.baesong = baesong;
	}
	public int getHalin() {
		return halin;
	}
	public void setHalin(int halin) {
		this.halin = halin;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSu() {
		return su;
	}
	public void setSu(int su) {
		this.su = su;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPimg() {
		return pimg;
	}
	public void setPimg(String pimg) {
		this.pimg = pimg;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
}
