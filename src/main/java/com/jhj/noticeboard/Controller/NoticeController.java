package com.jhj.noticeboard.Controller;


import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhj.noticeboard.DTO.CommentDto;
import com.jhj.noticeboard.DTO.NoticeDto;
import com.jhj.noticeboard.Service.CommentServiceImp;
import com.jhj.noticeboard.Service.NoticeServiceImpl;


/**
 * Handles requests for the application home page.
 */
@Controller
public class NoticeController {
	@Autowired
	private NoticeServiceImpl service;
	@Autowired
	private CommentServiceImp cmtService;
	private String logID;
	private NoticeDto dto;
	Date date;
	
	//  게시판 목록
	// http://localhost:9090/noticeboard/
	@RequestMapping(value = "/")
	public String NoticeBoard(Model model, HttpSession session) throws Exception {
		List<NoticeDto> list = service.sel();
		model.addAttribute("list", list);
		
		logID = (String) session.getAttribute("logID");
		if(logID != null) {
			model.addAttribute("logID", logID);
		}
		
		return "NoticeBoard";
	}
	
	// 게시글 작성
	@RequestMapping(value = "/PostWrite")
	private void PostWrite(Model model, HttpSession session) throws Exception {
		logID = (String) session.getAttribute("logID");
		model.addAttribute("logID", logID);
	}
	
	// 게시글 등록
	@ResponseBody
	@RequestMapping(value = "/WriteRegi", method = RequestMethod.POST)
	public void WriteRegi(Model model, NoticeDto dto, HttpSession session) throws Exception {
		date = new Date(System.currentTimeMillis());
		dto.setPstTime(date);
		
		service.ins(dto);
	}
	
	// 게시글 조회
	@RequestMapping(value = "/ViewWrite", method = RequestMethod.GET)
	private void ViewWrite(int pstNum,  Model model, HttpSession session) throws Exception {
		// 濡쒓렇�씤 �븘�씠�뵒濡� 議고쉶
		dto = service.view(pstNum);
		model.addAttribute("view", dto);
		
		logID = (String) session.getAttribute("logID");
		model.addAttribute("logID", logID);
		
		// �뙎湲� 議고쉶
		List<CommentDto> cmtList = cmtService.cmtList(pstNum);
		model.addAttribute("cmtList", cmtList);
		
	}
	
	// 게시글 수정 페이지
	@RequestMapping(value = "/UpdateWrite", method = RequestMethod.GET)
	private void UpdateWrite(int pstNum,  Model model) throws Exception {
		dto = service.view(pstNum);
		model.addAttribute("view", dto);
	}
	
	// 게시글 수정 등록
	@ResponseBody
	@RequestMapping(value = "/UpdateRegi", method = RequestMethod.POST)
	public void UpdateRegi(Model model, NoticeDto dto) throws Exception {
		service.upd(dto);
	}
	
	// 게시글 삭제
	@ResponseBody
	@RequestMapping(value = "/DeleteWrite", method = RequestMethod.POST)
	public void DeleteWrite(int pstNum, NoticeDto dto) throws Exception {
		service.del(pstNum);
	}
	
	
}
