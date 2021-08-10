package lhj.shop.mapper;

import lhj.shop.domain.Member;

public interface MemberMapper {
	void signUp(Member member);
	Member getMember(String id);
}
