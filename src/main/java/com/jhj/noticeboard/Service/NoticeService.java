package com.arian.noticeboard.Service;

import java.util.List;

import com.arian.noticeboard.DTO.NoticeDto;

public interface NoticeService {
	public List sel() throws Exception;
	
	public void ins(NoticeDto dto) throws Exception;
	
	public NoticeDto view(int pstNum) throws Exception;
	
	public void upd(NoticeDto dto) throws Exception;
	
	public void del(int pstNum) throws Exception;
}
