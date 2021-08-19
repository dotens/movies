package lhj.shop.controller;

import static lhj.shop.domain.FindPwdConst.YES_ID_EMAIL;
import static lhj.shop.domain.MemberConst.YES_ID_PWD;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lhj.shop.domain.Member;
import lhj.shop.domain.WishList;
import lhj.shop.service.MemberService;
import lhj.shop.service.WishListService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("member")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private WishListService w_service;
	
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
		return "redirect:../";
	}
	@GetMapping("info")
	public ModelAndView info(String id) {
		Member member = service.getMemberS(id);
		ModelAndView mv = new ModelAndView("member/info", "member", member);
		
		return mv;
	}
	@GetMapping("update")
	public ModelAndView update(String id) {
		Member member = service.getMemberS(id);
		ModelAndView mv = new ModelAndView("member/update", "member", member);
		
		return mv;
	}
	@PostMapping("update")
	public String update(Member member) {
		service.updateS(member);
		return "member/info";
	}
	@GetMapping("delete")
	public String delete(String id, HttpServletRequest request, HttpSession session) {
		service.deleteS(id);
		session = request.getSession();
		session.invalidate();
		
		return "redirect:../";
	}
	//wishList
	@ResponseBody
	@PostMapping("insertWish")
	public void insertWish(WishList wishList, HttpServletResponse response) {
		w_service.insertWishS(wishList);
	}
	@ResponseBody
	@GetMapping("deleteWish")
	public void deleteWish(WishList wishList, HttpServletResponse response) {
		w_service.deleteWishS(wishList);
	}
	@GetMapping("selectWish")
	public ModelAndView selectWish(String id) {
		List<WishList> wlist = w_service.selectWishS(id);
		ModelAndView mv = new ModelAndView("member/wishList", "wishList", wlist);
		log.info("mv: "+mv);
		return mv;
	}
	@PostMapping("deleteWish2")
	public String deleteWish2(HttpServletRequest request) {
		String id = request.getParameter("id");
		String mname = request.getParameter("mname");
		WishList wishList = new WishList(id, mname);
		w_service.deleteWishS(wishList);
		return "redirect:selectWish?id="+id;
	}
}




