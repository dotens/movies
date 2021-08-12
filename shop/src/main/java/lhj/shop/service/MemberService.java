package lhj.shop.service;

import org.apache.ibatis.annotations.Param;

import lhj.shop.domain.Member;

public interface MemberService {
	boolean overlapS(String id);
	void signUpS(Member member);
	Member getMemberS(String id);
	int checkS(String id, String pwd);
	int findPwdCheckS(@Param("id") String id, @Param("email") String email);
	void setPwdS(@Param("pwd") String pwd, @Param("id") String id);
}
