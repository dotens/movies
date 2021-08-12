package lhj.shop.controller;

import static lhj.shop.domain.MemberConst.*;
import static lhj.shop.domain.FindPwdConst.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lhj.shop.domain.Member;
import lhj.shop.service.MemberService;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("member")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@ResponseBody
	@PostMapping(value="overlap", produces={MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public boolean overlap(String id) {
		boolean flag = service.overlapS(id);
		
		return flag;
	}
	@GetMapping("signUp")
	public String signUp() {
		return "member/signUp";
	}
	@PostMapping("signUp")
	public String signUp(Member member) {
		service.signUpS(member);
		
		return "member/login";
	}
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	@PostMapping("check")
	public String check(HttpServletRequest request, HttpSession session) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		int result = service.checkS(id, pwd);
		if(result == YES_ID_PWD) {
			Member member = service.getMemberS(id);
			session = request.getSession();
			session.setAttribute("member", member);
			log.info(member.toString());
		}
		request.setAttribute("result", result);
		
		return "member/msg";
	}
	@GetMapping("findPwd")
	public String findPwd() {
		return "member/findPwd";
	}
	@PostMapping("findPwdCheck")
	public String findPwdCheck(HttpServletRequest request, HttpSession session) {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		
		int result = service.findPwdCheckS(id, email);
		if(result == YES_ID_EMAIL) {
			Member member = service.getMemberS(id);
			session = request.getSession();
			session.setAttribute("id", member.getId());
		}
		request.setAttribute("result", result);
		
		return "member/findPwdMsg";
	}
	@GetMapping("setPwd")
	public String setPwd() {
		return "member/setPwd";
	}
	@PostMapping("setPwd")
	public String setPwd(HttpServletRequest request, HttpSession session) {
		String id = (String)session.getAttribute("id");
		String pwd = request.getParameter("pwd");
		service.setPwdS(pwd, id);
		session.invalidate();
		return "member/login";
	}
	@GetMapping("logout")
	public String logout(HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		session.invalidate();
		return "redirect:../movie/list";
	}
}
