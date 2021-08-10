package lhj.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lhj.shop.domain.Member;
import lhj.shop.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public void signUpS(Member member) {
		mapper.signUp(member);
	}

	@Override
	public Member getMemberS(String id) {
		Member member = mapper.getMember(id);
		return member;
	}
}
