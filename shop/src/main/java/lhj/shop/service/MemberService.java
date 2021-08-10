package lhj.shop.service;

import lhj.shop.domain.Member;

public interface MemberService {
	void signUpS(Member member);
	Member getMemberS(String id);
}
