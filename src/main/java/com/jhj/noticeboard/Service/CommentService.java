package com.jhj.noticeboard.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhj.noticeboard.DAO.CommentDaoImp;
import com.jhj.noticeboard.DTO.CommentDto;

public interface CommentService {
	public List cmtList(int pstNum) throws Exception;
	
	public void insCmt(CommentDto dto) throws Exception;
	
	public void delCmt(int cmtNum) throws Exception;
	
	public void updCmt(CommentDto dto) throws Exception;
	
	public void insCCmt(CommentDto dto) throws Exception;
}
 