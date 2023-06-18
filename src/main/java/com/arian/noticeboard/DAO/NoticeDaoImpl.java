package com.arian.noticeboard.DAO;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.arian.noticeboard.DTO.NoticeDto;


@Repository
public class NoticeDaoImpl implements NoticeDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List sel(){
		return sqlSession.selectList("pstsql.sel");
	}
	
	@Override
	public void ins(NoticeDto dto){
		sqlSession.insert("pstsql.ins", dto);
	}
	
	@Override
	public NoticeDto view(int pstNum){
		sqlSession.update("pstsql.upView", pstNum);
		
		return sqlSession.selectOne("pstsql.view", pstNum);
	}
	
	@Override
	public void upd(NoticeDto dto){
		sqlSession.update("pstsql.upd", dto);
	}
	
	@Override
	public void del(int pstNum){
		sqlSession.delete("pstsql.del", pstNum);
	}
}
