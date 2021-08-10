package lhj.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lhj.shop.domain.Member;
import lhj.shop.service.MemberService;

@Controller("member")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@PostMapping("signUp")
	public void signUp(Member member) {
		service.signUpS(member);
	}
	
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
}
