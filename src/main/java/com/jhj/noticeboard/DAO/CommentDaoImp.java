package com.jhj.noticeboard.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhj.noticeboard.DTO.CommentDto;

@Repository
public class CommentDaoImp implements CommentDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List cmtList(int pstNum) throws Exception{
		return sqlSession.selectList("cmtsql.selCmt", pstNum);
	};
	
	@Override 
	public void insCmt(CommentDto dto) throws Exception {
		sqlSession.insert("cmtsql.insCmt", dto);
	}
	
	@Override
	public void delCmt(int cmtNum) throws Exception {
		sqlSession.delete("cmtsql.delCmt", cmtNum);
	}
	
	@Override
	public void updCmt(CommentDto dto) throws Exception {
		sqlSession.update("cmtsql.updCmt", dto);
	}
	
	@Override 
	public void insCCmt(CommentDto dto) throws Exception {
		sqlSession.insert("cmtsql.insCCmt", dto);
	}
}
