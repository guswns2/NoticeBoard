package com.arian.noticeboard.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arian.noticeboard.DAO.CommentDaoImp;
import com.arian.noticeboard.DTO.CommentDto;

@Service
public class CommentServiceImp implements CommentService{
	@Autowired
	private CommentDaoImp dao;
	
	@Override
	public List cmtList(int pstNum) throws Exception{
		return dao.cmtList(pstNum);
	}
	
	@Override
	public void insCmt(CommentDto dto) throws Exception {
		dao.insCmt(dto);
	}
	
	@Override
	public void delCmt(int cmtNum) throws Exception {
		dao.delCmt(cmtNum);
	}
	
	@Override
	public void updCmt(CommentDto dto) throws Exception {
		dao.updCmt(dto);
	}
	
	@Override
	public void insCCmt(CommentDto dto) throws Exception {
		dao.insCCmt(dto);
	}
}
