package com.myteam.trip.member.vo;

import org.springframework.stereotype.Component;

@Component("profileVO")
public class ProfileVO {
	private String id;
	private String profileImage;
	private String jagisogae; //렛미인트로듀스 마셆
	
	
	public ProfileVO() {
		
	}
	


	public ProfileVO(String id, String profileImage, String jagisogae) {
		super();
		this.id = id;
		this.profileImage = profileImage;
		this.jagisogae = jagisogae;
	}





	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getProfileImage() {
		return profileImage;
	}


	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}


	public String getJagisogae() {
		return jagisogae;
	}


	public void setJagisogae(String jagisogae) {
		this.jagisogae = jagisogae;
	}
	
	
	
}