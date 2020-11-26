package com.myteam.trip.board.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("thumbnailVO")
public class ThumbnailVO {
	private int articleNO;
	private String title;
	private int price;
	private String imageFileName;
	private int imageFiileNO;
	private Date writeDate;
	private double loc_x;
	private double loc_y;
	
	
	public ThumbnailVO() {
		
	}



	public ThumbnailVO(int articleNO, String title, int price, String imageFileName, int imageFiileNO, Date writeDate,
			double loc_x, double loc_y) {
		super();
		this.articleNO = articleNO;
		this.title = title;
		this.price = price;
		this.imageFileName = imageFileName;
		this.imageFiileNO = imageFiileNO;
		this.writeDate = writeDate;
		this.loc_x = loc_x;
		this.loc_y = loc_y;
	}




	public Date getWriteDate() {
		return writeDate;
	}




	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
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


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getImageFileName() {
		return imageFileName;
	}


	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}


	public int getImageFiileNO() {
		return imageFiileNO;
	}


	public void setImageFiileNO(int imageFiileNO) {
		this.imageFiileNO = imageFiileNO;
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
	
	
}
