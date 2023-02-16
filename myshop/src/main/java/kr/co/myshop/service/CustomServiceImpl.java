package kr.co.myshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.myshop.mapper.CustomMapper;
import kr.co.myshop.vo.MtmVo;

@Service
@Qualifier("cs")
public class CustomServiceImpl implements CustomService {

	@Autowired
	private CustomMapper mapper;
	
	@Override
	public String mtm_ok(MtmVo mvo) {
		mapper.mtm_ok(mvo);
		return "/custom/mtm_ok";
	}
}
