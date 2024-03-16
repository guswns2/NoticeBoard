package com.jhj.noticeboard.Controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhj.noticeboard.DTO.CommentDto;
import com.jhj.noticeboard.Service.CommentServiceImp;

@Controller
public class CommentController {
	@Autowired
	private CommentServiceImp service;
	Date date;
	
	
	// 댓글 등록
	@ResponseBody
	@RequestMapping(value="/PostCmt", method = RequestMethod.POST)
	public void PostCmt(CommentDto dto) throws Exception {
		date = new Date(System.currentTimeMillis());
		dto.setCmtTime(date);
		
		service.insCmt(dto);
	}
	
	//댓글 삭제
	@ResponseBody
	@RequestMapping(value="/DeleteCmt", method = RequestMethod.POST)
	public void DeleteCmt(int cmtNum) throws Exception {
		service.delCmt(cmtNum);
	}
	
	//댓글 수정
	@ResponseBody
	@RequestMapping(value="/UpdateCmt", method=RequestMethod.POST)
	public void UpdateCmt(CommentDto dto) throws Exception {
		service.updCmt(dto);
	}
	
	//답글 등록
	@ResponseBody
	@RequestMapping(value="/PostCCmt", method = RequestMethod.POST)
	public void PostCCmt(CommentDto dto) throws Exception {
		date = new Date(System.currentTimeMillis());
		dto.setCmtTime(date);
		
		service.insCCmt(dto);
	}
}
