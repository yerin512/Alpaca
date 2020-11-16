package com.myteam.trip.member.vo;


import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("kakaoMemberVO")
public class KakaoMemberVO {
	private String id;
	private String nickname;
    private String profileImageURL;
	
	public KakaoMemberVO() {
		
	}

	public KakaoMemberVO(String id, String nickname, String profileImageURL) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.profileImageURL = profileImageURL;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfileImageURL() {
		return profileImageURL;
	}

	public void setProfileImageURL(String profileImageURL) {
		this.profileImageURL = profileImageURL;
	}

}