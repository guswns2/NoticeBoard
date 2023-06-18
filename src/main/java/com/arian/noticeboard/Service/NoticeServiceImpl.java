package com.arian.noticeboard.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arian.noticeboard.DAO.NoticeDaoImpl;
import com.arian.noticeboard.DTO.NoticeDto;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDaoImpl dao;
	
	@Override
	public List sel() throws Exception {
		return dao.sel();
	}
	
	@Override
	public void ins(NoticeDto dto) throws Exception {
		dao.ins(dto);
	}
	
	@Override
	public NoticeDto view(int pstNum) throws Exception {
		return dao.view(pstNum);
	}
	
	@Override
	public void upd(NoticeDto dto) throws Exception {
		dao.upd(dto);
	}
	
	@Override
	public void del(int pstNum) throws Exception {
		dao.del(pstNum);
	}
}
