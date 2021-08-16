package lhj.shop.service;

import static lhj.shop.domain.MemberConst.NO_ID;
import static lhj.shop.domain.MemberConst.NO_PWD;
import static lhj.shop.domain.MemberConst.YES_ID_PWD;
import static lhj.shop.domain.FindPwdConst.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import lhj.shop.domain.Member;
import lhj.shop.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public boolean overlapS(String id) {
		boolean flag = true;
		Member member = mapper.getMember(id);
		if(member != null ) {
			flag = false;
		} else {
			flag = true;
		}
		return flag;
	}

	@Override
	public void signUpS(Member member) {
		mapper.signUp(member);
	}
	@Override
	public Member getMemberS(String id) {
		Member member = mapper.getMember(id);
		member.setPwd("");
		
		return member;
	}
	@Override
	public int checkS(String id, String pwd) {
		Member member = mapper.getMember(id);
		
		if(member == null) {
			return NO_ID;
		} else {
			String dbPwd = member.getPwd();
			dbPwd = dbPwd.trim();
			if(!dbPwd.equals(pwd)) {
				return NO_PWD;
			} else {
				return YES_ID_PWD;
			}
		}
	}
	@Override
	public int findPwdCheckS(@RequestParam("id") String id, @RequestParam("email") String email) {
		Member member = mapper.getMember(id);
		
		if(member == null) {
			return NO_ID2;
		} else {
			String dbEmail = member.getEmail();
			dbEmail = dbEmail.trim();
			if(!dbEmail.equals(email)) {
				return NO_EMAIL;
			} else {
				return YES_ID_EMAIL;
			}
		}
	}
	@Override
	public void setPwdS(String pwd, String id) {
		mapper.setPwd(pwd, id);
	}
	@Override
	public void updateS(Member member) {
		mapper.update(member);
	}
	@Override
	public void deleteS(String id) {
		mapper.delete(id);
	}
}



















