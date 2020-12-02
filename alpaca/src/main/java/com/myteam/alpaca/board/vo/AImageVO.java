package com.myteam.alpaca.board.vo;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;

public class AImageVO {
	@Override
	public String toString() {
		return "AImageVO [imageFileNO=" + imageFileNO + ", imageFileName=" + imageFileName + ", regDate=" + regDate
				+ ", articleNO=" + articleNO + "]";
	}
	private int imageFileNO;
	private String imageFileName;
	private Date regDate;
	private int articleNO;
	
	public int getImageFileNO() {
		return imageFileNO;
	}
	public void setImageFileNO(int imageFileNO) {
		this.imageFileNO = imageFileNO;
	}
	public String getImageFileName() {
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
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getArticleNO() {
		return articleNO;
	}
	public void setArticleNO(int articleNO) {
		this.articleNO = articleNO;
	}
	
	
	

}
