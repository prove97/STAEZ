package com.spring.staez.mypage.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.staez.common.model.vo.PageInfo;
import com.spring.staez.community.model.dto.BoardListDto;
import com.spring.staez.concert.model.vo.Concert;
import com.spring.staez.mypage.model.dao.MypageDao;
import com.spring.staez.user.model.dto.PaymentsInfoDto;
import com.spring.staez.user.model.vo.ProfileImg;
import com.spring.staez.user.model.vo.User;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired
	public SqlSessionTemplate sqlSession;
	
	@Autowired
	public MypageDao mpd;
	
	@Override
	public int duplicateCheck(String nickname) {
		return mpd.duplicateCheck(sqlSession, nickname);
	}

	@Override
	public int passwordCheck(String inputPwd) {
		return mpd.passwordCheck(sqlSession, inputPwd);

	}

	@Override
	public int updatePassword(User user) {
		return mpd.updatePassword(sqlSession, user);
	}

	@Override
	public int updateUserInfo(User user) {
		return mpd.updateUserInfo(sqlSession, user);
	}

	@Override
	public ProfileImg loadProfileImg(int userNo) {
		return mpd.loadProfileImg(sqlSession, userNo);
	}
	
	@Override
	public int updateProfileImg(ProfileImg profileImg) {
		return mpd.updateProfileImg(sqlSession, profileImg);
	}

	@Override
	public int insertProfileImg(ProfileImg profileImg) {
		return mpd.insertProfileImg(sqlSession, profileImg);
	}

	@Override
	public int withdrawalUser(User user) {
		return mpd.withdrawalUser(sqlSession, user);
	}

	@Override
	public int selectMyBoardListCount(int userNo) {
		return mpd.selectMyBoardListCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<BoardListDto> selectMyBoardList(int userNo, PageInfo pi) {
		return mpd.selectMyBoardList(sqlSession, userNo, pi);
	}

	@Override
	public int selectLikeBoardListCount(int userNo) {
		return mpd.selectLikeBoardListCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<BoardListDto> selectLikeBoardList(int userNo, PageInfo pi) {
		return mpd.selectLikeBoardList(sqlSession, userNo, pi);
	}

	@Override
	public int selectPaymentsCount(int userNo) {
		return mpd.selectPaymentsCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<PaymentsInfoDto> selectPaymentsList(int userNo, PageInfo pi) {
		return mpd.selectPaymentsList(sqlSession, userNo, pi);
	}

	@Override
	public int selectScrapCount(int userNo) {
		return mpd.selectScrapCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<Concert> selectScrapList(int userNo, PageInfo pi) {
		return mpd.selectScrapList(sqlSession, userNo, pi);
	}

	@Override
	public int selectReviewCount(int userNo) {
		return mpd.selectReviewCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<Concert> selectReviewList(int userNo, PageInfo pi) {
		return mpd.selectReviewList(sqlSession, userNo, pi);
	}

	@Override
	public int deleteMyScrapAjax(Map<String, Integer> params) {
		return mpd.deleteMyScrapAjax(sqlSession, params);
	}


	
}
