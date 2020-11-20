package com.myteam.trip.board.vo;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;

public class AImageVO {
	private int imageFileNO;
	private String imageFileName;
	private Date regDate;
	private int a_no;
	
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
	
	public Date getRagDate() {
		return regDate;
	}
	public void setRagDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	
	@Override
	public String toString() {
		return "AImageVO [imageFileNO=" + imageFileNO + ", imageFileName=" + imageFileName + ", regDate=" + regDate
				+ ", a_no=" + a_no + "]";
	}
	

}
