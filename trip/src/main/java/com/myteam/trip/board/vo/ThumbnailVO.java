package com.myteam.trip.board.vo;

import org.springframework.stereotype.Component;

@Component("thumbnailVO")
public class ThumbnailVO {
	private int articleNO;
	private String title;
	private String price;
	private String imageFileName;
	private int imageFiileNO;
	
	public ThumbnailVO() {
		
	}
	
		
	public ThumbnailVO(int articleNO, String title, String price, String imageFileName, int imageFiileNO) {
		super();
		this.articleNO = articleNO;
		this.title = title;
		this.price = price;
		this.imageFileName = imageFileName;
		this.imageFiileNO = imageFiileNO;
	}


	public String getPrice() {
		return price;
	}



	public void setPrice(String price) {
		this.price = price;
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
	
}
