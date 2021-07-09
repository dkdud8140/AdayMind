package com.callor.mind.service;

import java.util.List;

import com.callor.mind.model.UserVO;

public interface UserService {
	
	// 관리자용 리스트출력 
	public List<UserVO> selectAll();
	
	public UserVO findById(String u_id);
	public UserVO login(UserVO userVO);
	
	public UserVO join(UserVO userVO);	// 회원가입 
	public int update(UserVO userVO); // 회원정보 수정 
	public int expire(Long seq); // 회원탈퇴 
	
	// 유저경고 업데이트 횟수 
	public int updateWarning(UserVO userVO);
	
	
	//일단 보류
	// 정보는 그대로 두고 접근제한만. 
	// 워닝 테이블에서 유저ID 셀렉트 카운트수가 20이상이면 자동 밴
	// if 문 넣기
//	public int ban(String seq);
	
}