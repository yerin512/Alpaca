package com.myteam.trip.board.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("articleVO")
public class ArticleVO {
	private String id;
	private int a_no;
	private String a_title;
	private String a_content;
	private int a_price;
	private String imageFileName;
	private Date a_date;
	private String location;
	private int loc_x;
	private int loc_y;
	private String genre;
	private String way;
	private String condition;
	
	
	public ArticleVO() {
		
	}

	public ArticleVO(String id, int a_no, String a_title, String a_content, int a_price, String imageFileName,
			Date a_date, String location, int loc_x, int loc_y, String genre, String way, String condition) {
		super();
		this.id = id;
		this.a_no = a_no;
		this.a_title = a_title;
		this.a_content = a_content;
		this.a_price = a_price;
		this.imageFileName = imageFileName;
		this.a_date = a_date;
		this.location = location;
		this.loc_x = loc_x;
		this.loc_y = loc_y;
		this.genre = genre;
		this.way = way;
		this.condition = condition;
	}





	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getA_no() {
		return a_no;
	}


	public void setA_no(int a_no) {
		this.a_no = a_no;
	}


	public String getA_title() {
		return a_title;
	}


	public void setA_title(String a_title) {
		this.a_title = a_title;
	}


	public String getA_content() {
		return a_content;
	}


	public void setA_content(String a_content) {
		this.a_content = a_content;
	}


	public int getA_price() {
		return a_price;
	}


	public void setA_price(int a_price) {
		this.a_price = a_price;
	}


	public String getImgFileName() {
		return imageFileName;
	}


	public void setImgFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}


	public Date getA_date() {
		return a_date;
	}


	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public int getLoc_x() {
		return loc_x;
	}


	public void setLoc_x(int loc_x) {
		this.loc_x = loc_x;
	}


	public int getLoc_y() {
		return loc_y;
	}


	public void setLoc_y(int loc_y) {
		this.loc_y = loc_y;
	}


	public String getGenre() {
		return genre;
	}


	public void setGenre(String genre) {
		this.genre = genre;
	}


	public String getWay() {
		return way;
	}


	public void setWay(String way) {
		this.way = way;
	}


	public String getCondition() {
		return condition;
	}


	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	
	
}