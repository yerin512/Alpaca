package com.myteam.alpaca.board.vo;

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
	private String comPrice;
	private String imageFile1;
	private String imageFile2;
	private String imageFile3;
	private Date writeDate;
	private String location;
	private double loc_x;
	private double loc_y;
	private String condition;
	private String way;

	public ArticleVO() {

	}






	public ArticleVO(String id, int articleNO, String title, String content, int price, String comPrice,
			String imageFile1, String imageFile2, String imageFile3, Date writeDate, String location, double loc_x,
			double loc_y, String condition, String way) {
		super();
		this.id = id;
		this.articleNO = articleNO;
		this.title = title;
		this.content = content;
		this.price = price;
		this.comPrice = comPrice;
		this.imageFile1 = imageFile1;
		this.imageFile2 = imageFile2;
		this.imageFile3 = imageFile3;
		this.writeDate = writeDate;
		this.location = location;
		this.loc_x = loc_x;
		this.loc_y = loc_y;
		this.condition = condition;
		this.way = way;
	}






	public String getComPrice() {
		return comPrice;
	}






	public void setComPrice(String comPrice) {
		this.comPrice = comPrice;
	}






	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getImageFile1() {

		try {
			if (imageFile1 != null && imageFile1.length() != 0) {
				imageFile1 = URLDecoder.decode(imageFile1, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return imageFile1;
	}

	public void setImageFile1(String imageFile1) {
		try {
			if (imageFile1 != null && imageFile1.length() != 0) {
				this.imageFile1 = URLEncoder.encode(imageFile1, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	public String getImageFile2() {

		try {
			if (imageFile2 != null && imageFile2.length() != 0) {
				imageFile2 = URLDecoder.decode(imageFile2, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return imageFile2;
	}

	public void setImageFile2(String imageFile2) {
		try {
			if (imageFile2 != null && imageFile2.length() != 0) {
				this.imageFile2 = URLEncoder.encode(imageFile2, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	 
	public String getImageFile3() {

		try {
			if (imageFile3 != null && imageFile3.length() != 0) {
				imageFile3 = URLDecoder.decode(imageFile3, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return imageFile3;
	}

	public void setImageFile3(String imageFile3) {
		try {
			if (imageFile3 != null && imageFile3.length() != 0) {
				this.imageFile3 = URLEncoder.encode(imageFile3, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
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

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getWay() {
		return way;
	}

	public void setWay(String way) {
		this.way = way;
	}

}
