package kr.co.member.dao;

import kr.co.member.dto.MemberDto;

public interface MemberDao {

	public void member_input_ok();
	public boolean userid_check(MemberDto mdto);
	public MemberDto login_ok(MemberDto mdto);
	public void logout();
	public MemberDto usearch(MemberDto mdto);
	public MemberDto psearch(MemberDto mdto);
}
