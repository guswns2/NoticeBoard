package com.jhj.noticeboard.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhj.noticeboard.DAO.MemberDaoImp;
import com.jhj.noticeboard.DTO.MemberDto;

@Service
public class MemberServiceImp implements MemberService{
	
	@Autowired
	private MemberDaoImp dao;
	
	@Override
	public String selID(MemberDto dto) throws Exception {
		return dao.selID(dto);
	}

}
