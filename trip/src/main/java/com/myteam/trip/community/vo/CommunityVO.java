package com.myteam.trip.community.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;


@Component("communityVO")
public class CommunityVO {
	
	private int c_no;
	private String c_title;
	private String c_content;
	private String c_imageFileName;
	private String id;
	private Date c_date;
	
	

	public  CommunityVO() {}

	public CommunityVO(int c_no, String c_title, String c_content, String c_imageFileName, String id, Date c_date) {
		super();
		this.c_no = c_no;
		this.c_title = c_title;
		this.c_content = c_content;
		this.c_imageFileName = c_imageFileName;
		this.id = id;
		this.c_date = c_date;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getC_title() {
		return c_title;
	}

	public void setC_title(String c_title) {
		this.c_title = c_title;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public String getC_imageFileName() {
		return c_imageFileName;
	}

	public void setC_imageFileName(String c_imageFileName) {
		this.c_imageFileName = c_imageFileName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getC_date() {
		return c_date;
	}

	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	

}

