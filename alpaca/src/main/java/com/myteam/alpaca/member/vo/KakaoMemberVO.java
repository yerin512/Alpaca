package com.myteam.alpaca.member.vo;



import org.springframework.stereotype.Component;

@Component("kakaoMemberVO")
public class KakaoMemberVO {
	private String id;
	private String nickname;
    private String profileImage;
	
	public KakaoMemberVO() {
		
	}

	public KakaoMemberVO(String id, String nickname, String profileImage) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.profileImage = profileImage;
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

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImageURL(String profileImage) {
		this.profileImage = profileImage;
	}

}