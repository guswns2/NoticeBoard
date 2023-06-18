package com.arian.noticeboard.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import com.arian.noticeboard.DTO.MemberDto;
import com.arian.noticeboard.Service.MemberServiceImp;

@Controller
public class MemberController {
	@Autowired
	private MemberServiceImp service;
	
	// 로그인
	@RequestMapping(value = "/Login")
	public void Login() throws Exception {
		
	}
	
	// 로그인 시도
	@ResponseBody
	@RequestMapping(value="/LoginTry", method = RequestMethod.POST)
	public String Login(MemberDto dto, Model model, HttpSession session) throws Exception{
		String logID = service.selID(dto);
		
		if(logID != null) {
			session.setAttribute("logID", logID);
			return logID;
		}
		else {
			return "0";
		}
	}
	
	// 로그아웃		
	@RequestMapping(value="/Logout", method = RequestMethod.GET)
	public String Logout(HttpSession session) throws Exception{
		session.invalidate();
		
		return "redirect:/";
	}

}
