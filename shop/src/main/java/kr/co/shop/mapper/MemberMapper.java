package kr.co.shop.mapper;

import kr.co.shop.vo.MemberVo;

public interface MemberMapper {
	public void join_ok(MemberVo mvo);
	public MemberVo login_ok(MemberVo mvo);
	public int idCheck(String memberId);
}
