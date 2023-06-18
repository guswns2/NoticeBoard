package com.arian.noticeboard.DAO;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.arian.noticeboard.DTO.MemberDto;

@Repository
public class MemberDaoImp implements MemberDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public String selID (MemberDto dto) throws Exception {
		return sqlSession.selectOne("logsql.selID", dto); 
	}
}
