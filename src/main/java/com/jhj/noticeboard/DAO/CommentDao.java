package com.jhj.noticeboard.DAO;

import java.util.List;

import com.jhj.noticeboard.DTO.CommentDto;

public interface CommentDao {
	public List cmtList(int pstNum) throws Exception;
	
	public void insCmt(CommentDto dto) throws Exception;
	
	public void delCmt(int cmtNum) throws Exception;
	
	public void updCmt(CommentDto dto) throws Exception;
	
	public void insCCmt(CommentDto dto) throws Exception;
}
