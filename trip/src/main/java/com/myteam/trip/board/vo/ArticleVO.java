package com.myteam.trip.board.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("articleVO")
public class ArticleVO {
	private String id;
	private int articleNO;
	private String title;
	private String content;
	private int price;
	private String imageFileName;
	private Date writeDate;
	private String location;
	private double loc_x;
	private double loc_y;
	private String genre;
	private String way;
	private String condition;
	
	
	@Override
	public String toString() {
		return "ArticleVO [id=" + id + ", articleNO=" + articleNO + ", title=" + title + ", content=" + content
				+ ", price=" + price + ", imageFileName=" + imageFileName + ", writeDate=" + writeDate + ", location="
				+ location + ", loc_x=" + loc_x + ", loc_y=" + loc_y + ", genre=" + genre + ", way=" + way
				+ ", condition=" + condition + "]";
	}



	public ArticleVO() {
		
	}



	public ArticleVO(String id, int articleNO, String title, String content, int price, String imageFileName,
			Date writeDate, String location, double loc_x, double loc_y, String genre, String way, String condition) {
		super();
		this.id = id;
		this.articleNO = articleNO;
		this.title = title;
		this.content = content;
		this.price = price;
		this.imageFileName = imageFileName;
		this.writeDate = writeDate;
		this.location = location;
		this.loc_x = loc_x;
		this.loc_y = loc_y;
		this.genre = genre;
		this.way = way;
		this.condition = condition;
	}






	public int getArticleNO() {
		return articleNO;
	}



	public void setArticleNO(int articleNO) {
		this.articleNO = articleNO;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public String getLocation() {
		return location;
	}



	public void setLocation(String location) {
		this.location = location;
	}







	public double getLoc_x() {
		return loc_x;
	}



	public void setLoc_x(double loc_x) {
		this.loc_x = loc_x;
	}



	public double getLoc_y() {
		return loc_y;
	}



	public void setLoc_y(double loc_y) {
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



	public String getImageFileName() {
		try {
			if (imageFileName != null && imageFileName.length() != 0) {
				imageFileName = URLDecoder.decode(imageFileName, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		try {
			if(imageFileName!= null && imageFileName.length()!=0) {
				this.imageFileName = URLEncoder.encode(imageFileName,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}


}
