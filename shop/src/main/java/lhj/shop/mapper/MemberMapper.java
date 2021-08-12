package lhj.shop.mapper;

import org.apache.ibatis.annotations.Param;

import lhj.shop.domain.Member;

public interface MemberMapper {
	void signUp(Member member);
	Member getMember(String id);
	void setPwd(@Param("pwd") String pwd, @Param("id") String id);
}
