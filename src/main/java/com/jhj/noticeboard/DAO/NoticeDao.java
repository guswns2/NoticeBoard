package com.jhj.noticeboard.DAO;

import java.util.List;

import com.jhj.noticeboard.DTO.NoticeDto;


public interface NoticeDao {
	public List sel() throws Exception;
	
	public void ins(NoticeDto dto) throws Exception;
	
	public NoticeDto view(int pstNum) throws Exception;
	
	public void upd(NoticeDto dto) throws Exception;

	public void del(int pstNum) throws Exception;
}
